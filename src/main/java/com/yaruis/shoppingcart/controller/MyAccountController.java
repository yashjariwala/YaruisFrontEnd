package com.yaruis.shoppingcart.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yaruis.ecommercebackend.dao.BillingAddressDAO;
import com.yaruis.ecommercebackend.dao.CartDAO;
import com.yaruis.ecommercebackend.dao.CartItemDAO;
import com.yaruis.ecommercebackend.dao.CustomerOrderDAO;
import com.yaruis.ecommercebackend.dao.ShippingAddressDAO;
import com.yaruis.ecommercebackend.dao.UserDAO;
import com.yaruis.ecommercebackend.model.BillingAddress;
import com.yaruis.ecommercebackend.model.Cart;
import com.yaruis.ecommercebackend.model.CustomerOrder;
import com.yaruis.ecommercebackend.model.Email;
import com.yaruis.ecommercebackend.model.ShippingAddress;
import com.yaruis.ecommercebackend.model.UserCustomer;

@Controller
public class MyAccountController {

	@Autowired
	private UserDAO udao;

	@Autowired
	private ShippingAddressDAO shipdao;

	@Autowired
	private BillingAddressDAO billdao;

	@Autowired
	private CartDAO cartdao;

	@Autowired
	private CartItemDAO cartitemdao;

	@Autowired
	private CustomerOrderDAO custorderdao;

	@Autowired
	Email email;

	@RequestMapping("/**/MyAccount/**/getUserDetails")
	public ModelAndView getuserid(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = user.getUsername();
		UserCustomer usercustomerobj = udao.get(userid);
		return new ModelAndView("Myaccount", "usercustomerobj", usercustomerobj);
	}

	@RequestMapping("/MyAccount/getUserDetails/editshippingaddress")
	public ModelAndView getshippingid(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = user.getUsername();
		UserCustomer usercustomerobj = udao.get(userid);
		int shippingid = usercustomerobj.getShippingAddress().getShippingid();
		ShippingAddress shippingaddressobj = shipdao.get(shippingid);
		System.out.println(shippingid);
		return new ModelAndView("editshippingaddress", "shippingaddressobj", shippingaddressobj);
	}

	@RequestMapping("/MyAccount/getUserDetails/editbillingaddress")
	public ModelAndView getbillingid(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = user.getUsername();
		UserCustomer usercustomerobjbill = udao.get(userid);
		int billingid = usercustomerobjbill.getBillingAddress().getBillingid();
		BillingAddress billingaddressobj = billdao.get(billingid);
		System.out.println(billingid);
		return new ModelAndView("editbillingaddress", "billingaddressobj", billingaddressobj);
	}

	@RequestMapping(value = "/updatebilladd", method = RequestMethod.POST)
	public String addbill(@Valid @ModelAttribute("billadata") BillingAddress reg, BindingResult result) {

		if (result.hasErrors())
			return "editbillingaddress";
		else
			billdao.update(reg);
		;
		return "redirect:/MyAccount/getUserDetails";
	}

	@RequestMapping(value = "/updateshipadd", method = RequestMethod.POST)
	public String addship(@Valid @ModelAttribute("shipadata") ShippingAddress reg, BindingResult result) {

		if (result.hasErrors())
			return "editshippingaddress.jsp";
		else
			shipdao.update(reg);
		;
		return "redirect:/MyAccount/getUserDetails";
	}

	@RequestMapping(value = "/MyAccount/getUserDetails/editpersonalinfo")
	public ModelAndView getUserPersonalDetails(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = user.getUsername();
		UserCustomer Userdata = udao.get(userid);
		return new ModelAndView("editpersonaldetails", "Userdata", Userdata);
	}

	@RequestMapping(value = "/updatepersonalinfo", method = RequestMethod.POST)
	public String addpersonal(@Valid @ModelAttribute("Userdata") UserCustomer reg, BindingResult result, Model m) {

		if (result.hasErrors()) {
			return "editpersonaldetails";
		} else {

			udao.update(reg);
			return "redirect:/MyAccount/getUserDetails";
		}

	}

	@RequestMapping(value = "/deletepersonalinfo", method = RequestMethod.POST)
	public String deletedatapersonal(@Valid @ModelAttribute("Userdata") UserCustomer reg, CustomerOrder cust,
			BindingResult result, HttpServletRequest request, HttpServletResponse response, Model m)
			throws MessagingException, IOException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = user.getUsername();
		UserCustomer usercustomerobcart = udao.get(userid);
		int useriddelete = usercustomerobcart.getUserid();
		int id = usercustomerobcart.getCart().getCartId();
		Cart cart = cartdao.getCartByCartId(id);
		cartitemdao.removeAllCartItems(cart);
		int billingid = usercustomerobcart.getBillingAddress().getBillingid();
		int shippingid = usercustomerobcart.getShippingAddress().getShippingid();
		List<CustomerOrder> customerOrder = custorderdao.list(useriddelete);
		email.send(reg, "Hello " + reg.getUsername() + ", Your Account is Deleted Permanantly!", "<!doctype html>\n"
				+ "<html>\n" + "  <head>\n" + "    <meta name=\"viewport\" content=\"width=device-width\" />\n"
				+ "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n"
				+ "    <title>Email</title>\n" + "    <style>\n" + "      /* -------------------------------------\n"
				+ "          GLOBAL RESETS\n" + "      ------------------------------------- */\n" + "  body {\n"
				+ "        background-color: #f6f6f6;\n" + "        font-family: sans-serif;\n"
				+ "        -webkit-font-smoothing: antialiased;\n" + "        font-size: 14px;\n"
				+ "        line-height: 1.4;\n" + "        margin: 0;\n" + "        padding: 0;\n"
				+ "        -ms-text-size-adjust: 100%;\n" + "        -webkit-text-size-adjust: 100%; }\n" + "\n"
				+ "      table {\n" + "        border-collapse: separate;\n" + "        mso-table-lspace: 0pt;\n"
				+ "        mso-table-rspace: 0pt;\n" + "        width: 100%; }\n" + "        table td {\n"
				+ "          font-family: sans-serif;\n" + "          font-size: 14px;\n"
				+ "          vertical-align: top; }\n" + "\n" + "      /* -------------------------------------\n"
				+ "          BODY & CONTAINER\n" + "      ------------------------------------- */\n" + "\n"
				+ "      .body {\n" + "        background-color: #f6f6f6;\n" + "        width: 100%; }\n" + "\n"
				+ "      /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */\n"
				+ "      .container {\n" + "        display: block;\n" + "        Margin: 0 auto !important;\n"
				+ "        /* makes it centered */\n" + "        max-width: 580px;\n" + "        padding: 10px;\n"
				+ "        width: 580px; }\n" + "\n"
				+ "      /* This should also be a block element, so that it will fill 100% of the .container */\n"
				+ "      .content {\n" + "        box-sizing: border-box;\n" + "        display: block;\n"
				+ "        Margin: 0 auto;\n" + "        max-width: 580px;\n" + "        padding: 10px; }\n" + "\n"
				+ "      /* -------------------------------------\n" + "          HEADER, FOOTER, MAIN\n"
				+ "      ------------------------------------- */\n" + "      .main {\n"
				+ "        background: #ffffff;\n" + "        border-radius: 3px;\n" + "        width: 100%; }\n" + "\n"
				+ "      .wrapper {\n" + "        box-sizing: border-box;\n" + "        padding: 20px; }\n" + "\n"
				+ "      .content-block {\n" + "        padding-bottom: 10px;\n" + "        padding-top: 10px;\n"
				+ "      }\n" + "\n" + "      .footer {\n" + "        clear: both;\n" + "        Margin-top: 10px;\n"
				+ "        text-align: center;\n" + "        width: 100%; }\n" + "        .footer td,\n"
				+ "        .footer p,\n" + "        .footer span,\n" + "        .footer a {\n"
				+ "          color: #999999;\n" + "          font-size: 12px;\n" + "          text-align: center; }\n"
				+ "\n" + "      /* -------------------------------------\n" + "          TYPOGRAPHY\n"
				+ "      ------------------------------------- */\n" + "      h1,\n" + "      h2,\n" + "      h3,\n"
				+ "      h4 {\n" + "        color: #000000;\n" + "        font-family: sans-serif;\n"
				+ "        font-weight: 400;\n" + "        line-height: 1.4;\n" + "        margin: 0;\n"
				+ "        Margin-bottom: 30px; }\n" + "\n" + "      h1 {\n" + "        font-size: 35px;\n"
				+ "        font-weight: 300;\n" + "        text-align: center;\n"
				+ "        text-transform: capitalize; }\n" + "\n" + "      p,\n" + "      ul,\n" + "      ol {\n"
				+ "        font-family: sans-serif;\n" + "        font-size: 14px;\n" + "        font-weight: normal;\n"
				+ "        margin: 0;\n" + "        Margin-bottom: 15px; }\n" + "        p li,\n" + "        ul li,\n"
				+ "        ol li {\n" + "          list-style-position: inside;\n" + "          margin-left: 5px; }\n"
				+ "\n" + "      a {\n" + "        color: #3498db;\n" + "        text-decoration: underline; }\n" + "\n"
				+ "      /* -------------------------------------\n" + "          BUTTONS\n"
				+ "      ------------------------------------- */\n" + "      .btn {\n"
				+ "        box-sizing: border-box;\n" + "        width: 100%; }\n"
				+ "        .btn > tbody > tr > td {\n" + "          padding-bottom: 15px; }\n"
				+ "        .btn table {\n" + "          width: auto; }\n" + "        .btn table td {\n"
				+ "          background-color: #ffffff;\n" + "          border-radius: 5px;\n"
				+ "          text-align: center; }\n" + "        .btn a {\n" + "          background-color: #ffffff;\n"
				+ "          border: solid 1px #3498db;\n" + "          border-radius: 5px;\n"
				+ "          box-sizing: border-box;\n" + "          color: #3498db;\n" + "          cursor: pointer;\n"
				+ "          display: inline-block;\n" + "          font-size: 14px;\n"
				+ "          font-weight: bold;\n" + "          margin: 0;\n" + "          padding: 12px 25px;\n"
				+ "          text-decoration: none;\n" + "          text-transform: capitalize; }\n" + "\n"
				+ "      .btn-primary table td {\n" + "        background-color: #3498db; }\n" + "\n"
				+ "      .btn-primary a {\n" + "        background-color: #3498db;\n"
				+ "        border-color: #3498db;\n" + "        color: #ffffff; }\n" + "\n"
				+ "      /* -------------------------------------\n" + "          OTHER STYLES THAT MIGHT BE USEFUL\n"
				+ "      ------------------------------------- */\n" + "      .last {\n"
				+ "        margin-bottom: 0; }\n" + "\n" + "      .first {\n" + "        margin-top: 0; }\n" + "\n"
				+ "      .align-center {\n" + "        text-align: center; }\n" + "\n" + "      .align-right {\n"
				+ "        text-align: right; }\n" + "\n" + "      .align-left {\n" + "        text-align: left; }\n"
				+ "\n" + "      .clear {\n" + "        clear: both; }\n" + "\n" + "      .mt0 {\n"
				+ "        margin-top: 0; }\n" + "\n" + "      .mb0 {\n" + "        margin-bottom: 0; }\n" + "\n"
				+ "      .preheader {\n" + "        color: transparent;\n" + "        display: none;\n"
				+ "        height: 0;\n" + "        max-height: 0;\n" + "        max-width: 0;\n"
				+ "        opacity: 0;\n" + "        overflow: hidden;\n" + "        mso-hide: all;\n"
				+ "        visibility: hidden;\n" + "        width: 0; }\n" + "\n" + "      .powered-by a {\n"
				+ "        text-decoration: none; }\n" + "\n" + "      hr {\n" + "        border: 0;\n"
				+ "        border-bottom: 1px solid #f6f6f6;\n" + "        Margin: 20px 0; }\n" + "\n"
				+ "      /* -------------------------------------\n"
				+ "          RESPONSIVE AND MOBILE FRIENDLY STYLES\n"
				+ "      ------------------------------------- */\n"
				+ "      @media only screen and (max-width: 620px) {\n" + "        table[class=body] h1 {\n"
				+ "          font-size: 28px !important;\n" + "          margin-bottom: 10px !important; }\n"
				+ "        table[class=body] p,\n" + "        table[class=body] ul,\n"
				+ "        table[class=body] ol,\n" + "        table[class=body] td,\n"
				+ "        table[class=body] span,\n" + "        table[class=body] a {\n"
				+ "          font-size: 16px !important; }\n" + "        table[class=body] .wrapper,\n"
				+ "        table[class=body] .article {\n" + "          padding: 10px !important; }\n"
				+ "        table[class=body] .content {\n" + "          padding: 0 !important; }\n"
				+ "        table[class=body] .container {\n" + "          padding: 0 !important;\n"
				+ "          width: 100% !important; }\n" + "        table[class=body] .main {\n"
				+ "          border-left-width: 0 !important;\n" + "          border-radius: 0 !important;\n"
				+ "          border-right-width: 0 !important; }\n" + "        table[class=body] .btn table {\n"
				+ "          width: 100% !important; }\n" + "        table[class=body] .btn a {\n"
				+ "          width: 100% !important; }\n" + "        table[class=body] .img-responsive {\n"
				+ "          height: auto !important;\n" + "          max-width: 100% !important;\n"
				+ "          width: auto !important; }}\n" + "\n" + "      /* -------------------------------------\n"
				+ "          PRESERVE THESE STYLES IN THE HEAD\n" + "      ------------------------------------- */\n"
				+ "      @media all {\n" + "        .ExternalClass {\n" + "          width: 100%; }\n"
				+ "        .ExternalClass,\n" + "        .ExternalClass p,\n" + "        .ExternalClass span,\n"
				+ "        .ExternalClass font,\n" + "        .ExternalClass td,\n" + "        .ExternalClass div {\n"
				+ "          line-height: 100%; }\n" + "        .apple-link a {\n"
				+ "          color: inherit !important;\n" + "          font-family: inherit !important;\n"
				+ "          font-size: inherit !important;\n" + "          font-weight: inherit !important;\n"
				+ "          line-height: inherit !important;\n" + "          text-decoration: none !important; }\n"
				+ "        .btn-primary table td:hover {\n" + "          background-color: #34495e !important; }\n"
				+ "        .btn-primary a:hover {\n" + "          background-color: #34495e !important;\n"
				+ "          border-color: #34495e !important; } }\n" + "\n" + "    </style>\n" + "</head>\n"
				+ "  <body class=\"\">\n"
				+ "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\">\n" + "      <tr>\n"
				+ "        <td>&nbsp;</td>\n" + "        <td class=\"container\">\n"
				+ "          <div class=\"content\">\n" + "\n" + "            <!-- START CENTERED WHITE CONTAINER -->\n"
				+ "            <span class=\"preheader\"></span>\n" + "            <table class=\"main\">\n" + "\n"
				+ "              <!-- START MAIN CONTENT AREA -->\n" + "              <tr>\n"
				+ "                <td class=\"wrapper\">\n"
				+ "                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
				+ "                    <tr>\n" + "                      <td>\n" + "<p><img src=\"cid:image\" width=auto></p>"
				+ "                        <h1>Sorry to see you go!</h1><br>\n"
				+ "                        <h3>Your account was deleted from Yaruis shop website.</h3>"
				+ "                        <p> We hope to have you back some day.</p><br>"
				+ "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\">\n"
				+ "                          <tbody>\n" + "                            <tr>\n"
				+ "                              <td align=\"left\">\n"
				+ "                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
				+ "                                  <tbody>\n" + "                                    <tr>\n"
				+ "                                      <td> <a href=\"http://192.168.31.213:8081/EcommerceFrontEnd/Home\" target=\"_blank\">Come Back Soon!</a> </td>\n"
				+ "                                    </tr>\n" + "                                  </tbody>\n"
				+ "                                </table>\n" + "                              </td>\n"
				+ "                            </tr>\n" + "                          </tbody>\n"
				+ "                        </table>\n" + "                        <p>Thanking You</p>"
				+ "                       <p>Yash Jariwala</p>"
				+ " 				        <p> Owner at Yaruis corporation ltd.</p>"
				+ "                        <p>Good luck!</p>" + "                      </td>\n"
				+ "                    </tr>\n" + "                  </table>\n" + "                </td>\n"
				+ "              </tr>\n" + "\n" + "            <!-- END MAIN CONTENT AREA -->\n"
				+ "            </table>\n" + "\n" + "            <!-- START FOOTER -->\n"
				+ "            <div class=\"footer\">\n"
				+ "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n" + "                <tr>\n"
				+ "                  <td class=\"content-block\">\n"
				+ "                    <span class=\"apple-link\">\n" + "NIIT "
				+ "2nd Floor, Jayashree Building, Next to Paradise Towers, Gokhale Road, Thane West, Naupada, Thane West, Thane, Maharashtra 400602</span>\n"
				+ "                  </td>\n" + "                </tr>\n" + "                <tr>\n"
				+ "                  <td class=\"content-block powered-by\">\n" + "                  </td>\n"
				+ "                </tr>\n" + "              </table>\n" + "            </div>\n"
				+ "            <!-- END FOOTER -->\n" + "\n" + "          <!-- END CENTERED WHITE CONTAINER -->\n"
				+ "          </div>\n" + "        </td>\n" + "        <td>&nbsp;</td>\n" + "      </tr>\n"
				+ "    </table>\n" + "  </body>\n" + "</html>");
		new SecurityContextLogoutHandler().logout(request, response, auth);
		custorderdao.delete(customerOrder);
		udao.updatedeletecascade(reg);
		cartdao.delete(id);
		billdao.delete(billingid);
		shipdao.delete(shippingid);
		udao.delete(useriddelete);
		return "redirect:/Home";
	}

	@RequestMapping(value = "/**/MyAccount/**/deleteuser")
	public ModelAndView DeletePersonalDetails(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = user.getUsername();
		UserCustomer Userdata = udao.get(userid);
		return new ModelAndView("DeleteAccountConfirm", "Userdata", Userdata);

	}

}
