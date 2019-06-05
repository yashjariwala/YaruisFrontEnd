package com.yarish.shoppingcart.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yarish.ecommercebackend.dao.UserDAO;
import com.yarish.ecommercebackend.model.BillingAddress;
import com.yarish.ecommercebackend.model.CartItem;
import com.yarish.ecommercebackend.model.Email;
import com.yarish.ecommercebackend.model.ShippingAddress;
import com.yarish.ecommercebackend.model.UserCustomer;

@Controller
public class UserController {

	@Autowired
	UserDAO udao;

	@Autowired
	Email email;
	

	@RequestMapping("/Register")
	public ModelAndView register() {
		BillingAddress billingAddress = new BillingAddress();
		ShippingAddress shippingAddress = new ShippingAddress();
		// Cart cart = new Cart();
		UserCustomer u = new UserCustomer();
		u.setBillingAddress(billingAddress);
		u.setShippingAddress(shippingAddress);
		System.out.println(u.getResettoken());
		// u.setCart(cart);
		ModelAndView model = new ModelAndView("signup");
		model.addObject("Userdata", u);
		return model;
	}

	@RequestMapping(value = "/saveuser", method = RequestMethod.POST)
	public String adduser(@Valid @ModelAttribute("Userdata") UserCustomer reg, BindingResult result, Model m)
			throws MessagingException, IOException {

		if (result.hasErrors()) {
			return "signup";
		} else {
			List<UserCustomer> list = udao.list();
			for (int i = 0; i < list.size(); i++) {

				if (reg.getUseremail().equals(list.get(i).getUseremail())) {
					m.addAttribute("emailMsg", "Email already Exists");
					return "signup";
				}

				if (reg.getUsername().equals(list.get(i).getUsername())) {
					m.addAttribute("nameMsg", "Username already Exists");
					return "signup";
				}

			}
			email.send(reg, "Hello " + reg.getUsername() + ", Your Account is Activated",

					"<!doctype html>\n" + "<html>\n" + "  <head>\n"
							+ "    <meta name=\"viewport\" content=\"width=device-width\" />\n"
							+ "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n"
							+ "    <title>Email</title>\n" + "    <style>\n"
							+ "      /* -------------------------------------\n" + "          GLOBAL RESETS\n"
							+ "      ------------------------------------- */\n" + "      img {\n"
							+ "        border: none;\n" + "        -ms-interpolation-mode: bicubic;\n"
							+ "        max-width: 100%; }\n" + "\n" + "      body {\n"
							+ "        background-color: #f6f6f6;\n" + "        font-family: sans-serif;\n"
							+ "        -webkit-font-smoothing: antialiased;\n" + "        font-size: 14px;\n"
							+ "        line-height: 1.4;\n" + "        margin: 0;\n" + "        padding: 0;\n"
							+ "        -ms-text-size-adjust: 100%;\n" + "        -webkit-text-size-adjust: 100%; }\n"
							+ "\n" + "      table {\n" + "        border-collapse: separate;\n"
							+ "        mso-table-lspace: 0pt;\n" + "        mso-table-rspace: 0pt;\n"
							+ "        width: 100%; }\n" + "        table td {\n"
							+ "          font-family: sans-serif;\n" + "          font-size: 14px;\n"
							+ "          vertical-align: top; }\n" + "\n"
							+ "      /* -------------------------------------\n" + "          BODY & CONTAINER\n"
							+ "      ------------------------------------- */\n" + "\n" + "      .body {\n"
							+ "        background-color: #f6f6f6;\n" + "        width: 100%; }\n" + "\n"
							+ "      /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */\n"
							+ "      .container {\n" + "        display: block;\n"
							+ "        Margin: 0 auto !important;\n" + "        /* makes it centered */\n"
							+ "        max-width: 580px;\n" + "        padding: 10px;\n" + "        width: 580px; }\n"
							+ "\n"
							+ "      /* This should also be a block element, so that it will fill 100% of the .container */\n"
							+ "      .content {\n" + "        box-sizing: border-box;\n" + "        display: block;\n"
							+ "        Margin: 0 auto;\n" + "        max-width: 580px;\n" + "        padding: 10px; }\n"
							+ "\n" + "      /* -------------------------------------\n"
							+ "          HEADER, FOOTER, MAIN\n" + "      ------------------------------------- */\n"
							+ "      .main {\n" + "        background: #ffffff;\n" + "        border-radius: 3px;\n"
							+ "        width: 100%; }\n" + "\n" + "      .wrapper {\n"
							+ "        box-sizing: border-box;\n" + "        padding: 20px; }\n" + "\n"
							+ "      .content-block {\n" + "        padding-bottom: 10px;\n"
							+ "        padding-top: 10px;\n" + "      }\n" + "\n" + "      .footer {\n"
							+ "        clear: both;\n" + "        Margin-top: 10px;\n" + "        text-align: center;\n"
							+ "        width: 100%; }\n" + "        .footer td,\n" + "        .footer p,\n"
							+ "        .footer span,\n" + "        .footer a {\n" + "          color: #999999;\n"
							+ "          font-size: 12px;\n" + "          text-align: center; }\n" + "\n"
							+ "      /* -------------------------------------\n" + "          TYPOGRAPHY\n"
							+ "      ------------------------------------- */\n" + "      h1,\n" + "      h2,\n"
							+ "      h3,\n" + "      h4 {\n" + "        color: #000000;\n"
							+ "        font-family: sans-serif;\n" + "        font-weight: 400;\n"
							+ "        line-height: 1.4;\n" + "        margin: 0;\n"
							+ "        Margin-bottom: 30px; }\n" + "\n" + "      h1 {\n" + "        font-size: 35px;\n"
							+ "        font-weight: 300;\n" + "        text-align: center;\n"
							+ "        text-transform: capitalize; }\n" + "\n" + "      p,\n" + "      ul,\n"
							+ "      ol {\n" + "        font-family: sans-serif;\n" + "        font-size: 14px;\n"
							+ "        font-weight: normal;\n" + "        margin: 0;\n"
							+ "        Margin-bottom: 15px; }\n" + "        p li,\n" + "        ul li,\n"
							+ "        ol li {\n" + "          list-style-position: inside;\n"
							+ "          margin-left: 5px; }\n" + "\n" + "      a {\n" + "        color: #3498db;\n"
							+ "        text-decoration: underline; }\n" + "\n"
							+ "      /* -------------------------------------\n" + "          BUTTONS\n"
							+ "      ------------------------------------- */\n" + "      .btn {\n"
							+ "        box-sizing: border-box;\n" + "        width: 100%; }\n"
							+ "        .btn > tbody > tr > td {\n" + "          padding-bottom: 15px; }\n"
							+ "        .btn table {\n" + "          width: auto; }\n" + "        .btn table td {\n"
							+ "          background-color: #ffffff;\n" + "          border-radius: 5px;\n"
							+ "          text-align: center; }\n" + "        .btn a {\n"
							+ "          background-color: #ffffff;\n" + "          border: solid 1px #3498db;\n"
							+ "          border-radius: 5px;\n" + "          box-sizing: border-box;\n"
							+ "          color: #3498db;\n" + "          cursor: pointer;\n"
							+ "          display: inline-block;\n" + "          font-size: 14px;\n"
							+ "          font-weight: bold;\n" + "          margin: 0;\n"
							+ "          padding: 12px 25px;\n" + "          text-decoration: none;\n"
							+ "          text-transform: capitalize; }\n" + "\n" + "      .btn-primary table td {\n"
							+ "        background-color: #3498db; }\n" + "\n" + "      .btn-primary a {\n"
							+ "        background-color: #3498db;\n" + "        border-color: #3498db;\n"
							+ "        color: #ffffff; }\n" + "\n" + "      /* -------------------------------------\n"
							+ "          OTHER STYLES THAT MIGHT BE USEFUL\n"
							+ "      ------------------------------------- */\n" + "      .last {\n"
							+ "        margin-bottom: 0; }\n" + "\n" + "      .first {\n" + "        margin-top: 0; }\n"
							+ "\n" + "      .align-center {\n" + "        text-align: center; }\n" + "\n"
							+ "      .align-right {\n" + "        text-align: right; }\n" + "\n"
							+ "      .align-left {\n" + "        text-align: left; }\n" + "\n" + "      .clear {\n"
							+ "        clear: both; }\n" + "\n" + "      .mt0 {\n" + "        margin-top: 0; }\n" + "\n"
							+ "      .mb0 {\n" + "        margin-bottom: 0; }\n" + "\n" + "      .preheader {\n"
							+ "        color: transparent;\n" + "        display: none;\n" + "        height: 0;\n"
							+ "        max-height: 0;\n" + "        max-width: 0;\n" + "        opacity: 0;\n"
							+ "        overflow: hidden;\n" + "        mso-hide: all;\n"
							+ "        visibility: hidden;\n" + "        width: 0; }\n" + "\n"
							+ "      .powered-by a {\n" + "        text-decoration: none; }\n" + "\n" + "      hr {\n"
							+ "        border: 0;\n" + "        border-bottom: 1px solid #f6f6f6;\n"
							+ "        Margin: 20px 0; }\n" + "\n" + "      /* -------------------------------------\n"
							+ "          RESPONSIVE AND MOBILE FRIENDLY STYLES\n"
							+ "      ------------------------------------- */\n"
							+ "      @media only screen and (max-width: 620px) {\n" + "        table[class=body] h1 {\n"
							+ "          font-size: 28px !important;\n"
							+ "          margin-bottom: 10px !important; }\n" + "        table[class=body] p,\n"
							+ "        table[class=body] ul,\n" + "        table[class=body] ol,\n"
							+ "        table[class=body] td,\n" + "        table[class=body] span,\n"
							+ "        table[class=body] a {\n" + "          font-size: 16px !important; }\n"
							+ "        table[class=body] .wrapper,\n" + "        table[class=body] .article {\n"
							+ "          padding: 10px !important; }\n" + "        table[class=body] .content {\n"
							+ "          padding: 0 !important; }\n" + "        table[class=body] .container {\n"
							+ "          padding: 0 !important;\n" + "          width: 100% !important; }\n"
							+ "        table[class=body] .main {\n" + "          border-left-width: 0 !important;\n"
							+ "          border-radius: 0 !important;\n"
							+ "          border-right-width: 0 !important; }\n"
							+ "        table[class=body] .btn table {\n" + "          width: 100% !important; }\n"
							+ "        table[class=body] .btn a {\n" + "          width: 100% !important; }\n"
							+ "        table[class=body] .img-responsive {\n" + "          height: auto !important;\n"
							+ "          max-width: 100% !important;\n" + "          width: auto !important; }}\n"
							+ "\n" + "      /* -------------------------------------\n"
							+ "          PRESERVE THESE STYLES IN THE HEAD\n"
							+ "      ------------------------------------- */\n" + "      @media all {\n"
							+ "        .ExternalClass {\n" + "          width: 100%; }\n" + "        .ExternalClass,\n"
							+ "        .ExternalClass p,\n" + "        .ExternalClass span,\n"
							+ "        .ExternalClass font,\n" + "        .ExternalClass td,\n"
							+ "        .ExternalClass div {\n" + "          line-height: 100%; }\n"
							+ "        .apple-link a {\n" + "          color: inherit !important;\n"
							+ "          font-family: inherit !important;\n"
							+ "          font-size: inherit !important;\n"
							+ "          font-weight: inherit !important;\n"
							+ "          line-height: inherit !important;\n"
							+ "          text-decoration: none !important; }\n"
							+ "        .btn-primary table td:hover {\n"
							+ "          background-color: #34495e !important; }\n" + "        .btn-primary a:hover {\n"
							+ "          background-color: #34495e !important;\n"
							+ "          border-color: #34495e !important; } }\n" + "\n" + "    </style>\n"
							+ "</head>\n" + "  <body class=\"\">\n"
							+ "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\">\n"
							+ "      <tr>\n" + "        <td>&nbsp;</td>\n" + "        <td class=\"container\">\n"
							+ "          <div class=\"content\">\n" + "\n"
							+ "            <!-- START CENTERED WHITE CONTAINER -->\n"
							+ "            <span class=\"preheader\"></span>\n" + "            <table class=\"main\">\n"
							+ "\n" + "              <!-- START MAIN CONTENT AREA -->\n" + "              <tr>\n"
							+ "                <td class=\"wrapper\">\n"
							+ "                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
							+ "                    <tr>\n" + "                      <td>\n"
							+ "<p><img src=\"cid:image\" width=auto></p>"
							+ "                        <h1>Welcome to Yarish!</h1><br>\n"
							+ "                        <h3>Your password is " + reg.getUserpassword() + "</h3>"
							+ "                        <p> Thank you for selecting Yarish! </p><br>"
							+ "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\">\n"
							+ "                          <tbody>\n" + "                            <tr>\n"
							+ "                              <td align=\"left\">\n"
							+ "                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
							+ "                                  <tbody>\n"
							+ "                                    <tr>\n"
							+ "                                      <td> <a href=\"http://localhost:8081/EcommerceFrontEnd/Home\" target=\"_blank\">Shop Now!</a> </td>\n"
							+ "                                    </tr>\n"
							+ "                                  </tbody>\n"
							+ "                                </table>\n" + "                              </td>\n"
							+ "                            </tr>\n" + "                          </tbody>\n"
							+ "                        </table>\n"
							+ "                        <p><br>We hope you have a plesent shopping experience.<p>"
							+ "						<p>We are available for support and help 24/7.<br></p>"
							+ "                        <p>Thanking You</p>"
							+ "                       <p>Yash Jariwala</p>"
							+ " 				        <p> Owner at Yarish corporation ltd.</p>"
							+ "                        <p>Good luck!</p>" + "                      </td>\n"
							+ "                    </tr>\n" + "                  </table>\n" + "                </td>\n"
							+ "              </tr>\n" + "\n" + "            <!-- END MAIN CONTENT AREA -->\n"
							+ "            </table>\n" + "\n" + "            <!-- START FOOTER -->\n"
							+ "            <div class=\"footer\">\n"
							+ "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
							+ "                <tr>\n" + "                  <td class=\"content-block\">\n"
							+ "                    <span class=\"apple-link\">\n" + "NIIT "
							+ "2nd Floor, Jayashree Building, Next to Paradise Towers, Gokhale Road, Thane West, Naupada, Thane West, Thane, Maharashtra 400602</span>\n"
							+ "                  </td>\n" + "                </tr>\n" + "                <tr>\n"
							+ "                  <td class=\"content-block powered-by\">\n"
							+ "                  </td>\n" + "                </tr>\n" + "              </table>\n"
							+ "            </div>\n" + "            <!-- END FOOTER -->\n" + "\n"
							+ "          <!-- END CENTERED WHITE CONTAINER -->\n" + "          </div>\n"
							+ "        </td>\n" + "        <td>&nbsp;</td>\n" + "      </tr>\n" + "    </table>\n"
							+ "  </body>\n" + "</html>");
			udao.save(reg);
			return "login";
		}
	}

	//
	// @RequestMapping(value = "/saveshipadd", method = RequestMethod.POST)
	// public String addshipdata(@Valid
	// @ModelAttribute("shipdata")ShippingAddress reg,BindingResult result)
	// {
	// udao.save(reg);
	// return "billingaddress";
	//
	// }
	//
	//
	// @RequestMapping(value = "/savebilldata", method = RequestMethod.POST)
	// public String addbilldata(@Valid
	// @ModelAttribute("billdata")BillingAddress reg,BindingResult result)
	// {
	// udao.save(reg);
	// return "login";
	//
	// }

	@RequestMapping(value = "/listuser")
	public String ViewUser(Model model) {
		model.addAttribute("userList", this.udao.list());
		return "/listusers";
	}

	@RequestMapping("/Login")
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("login");
		return model;
	}

	@RequestMapping("/forgotUsername")
	public ModelAndView forgotun() {
		ModelAndView model = new ModelAndView("forgotUsername");
		return model;
	}

	@RequestMapping("/passwordreset")
	public String passwordreset(@RequestParam("emailpassforgot")String mailpf,@RequestParam("usernamepassforgot")String usernamepf, Model model) throws MessagingException, IOException{
		UserCustomer userpf = udao.get1(mailpf);
		if (userpf == null) {
		model.addAttribute("error", "Email id doesn't exsist!");
		return "/forgotPassword";
		}
		else {
			String usernamedb = userpf.getUsername();
			if (usernamedb.equals(usernamepf)) {
				String resettokendb = userpf.getResettoken();
				System.out.println(resettokendb);
				email.send(userpf, "Password Reset", "<!doctype html>\n" + "<html>\n" + "  <head>\n"
						+ "    <meta name=\"viewport\" content=\"width=device-width\" />\n"
						+ "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n"
						+ "    <title>Email</title>\n" + "    <style>\n"
						+ "      /* -------------------------------------\n" + "          GLOBAL RESETS\n"
						+ "      ------------------------------------- */\n" + "      img {\n"
						+ "        border: none;\n" + "        -ms-interpolation-mode: bicubic;\n"
						+ "        max-width: 100%; }\n" + "\n" + "      body {\n"
						+ "        background-color: #f6f6f6;\n" + "        font-family: sans-serif;\n"
						+ "        -webkit-font-smoothing: antialiased;\n" + "        font-size: 14px;\n"
						+ "        line-height: 1.4;\n" + "        margin: 0;\n" + "        padding: 0;\n"
						+ "        -ms-text-size-adjust: 100%;\n" + "        -webkit-text-size-adjust: 100%; }\n" + "\n"
						+ "      table {\n" + "        border-collapse: separate;\n"
						+ "        mso-table-lspace: 0pt;\n" + "        mso-table-rspace: 0pt;\n"
						+ "        width: 100%; }\n" + "        table td {\n" + "          font-family: sans-serif;\n"
						+ "          font-size: 14px;\n" + "          vertical-align: top; }\n" + "\n"
						+ "      /* -------------------------------------\n" + "          BODY & CONTAINER\n"
						+ "      ------------------------------------- */\n" + "\n" + "      .body {\n"
						+ "        background-color: #f6f6f6;\n" + "        width: 100%; }\n" + "\n"
						+ "      /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */\n"
						+ "      .container {\n" + "        display: block;\n" + "        Margin: 0 auto !important;\n"
						+ "        /* makes it centered */\n" + "        max-width: 580px;\n"
						+ "        padding: 10px;\n" + "        width: 580px; }\n" + "\n"
						+ "      /* This should also be a block element, so that it will fill 100% of the .container */\n"
						+ "      .content {\n" + "        box-sizing: border-box;\n" + "        display: block;\n"
						+ "        Margin: 0 auto;\n" + "        max-width: 580px;\n" + "        padding: 10px; }\n"
						+ "\n" + "      /* -------------------------------------\n" + "          HEADER, FOOTER, MAIN\n"
						+ "      ------------------------------------- */\n" + "      .main {\n"
						+ "        background: #ffffff;\n" + "        border-radius: 3px;\n"
						+ "        width: 100%; }\n" + "\n" + "      .wrapper {\n" + "        box-sizing: border-box;\n"
						+ "        padding: 20px; }\n" + "\n" + "      .content-block {\n"
						+ "        padding-bottom: 10px;\n" + "        padding-top: 10px;\n" + "      }\n" + "\n"
						+ "      .footer {\n" + "        clear: both;\n" + "        Margin-top: 10px;\n"
						+ "        text-align: center;\n" + "        width: 100%; }\n" + "        .footer td,\n"
						+ "        .footer p,\n" + "        .footer span,\n" + "        .footer a {\n"
						+ "          color: #999999;\n" + "          font-size: 12px;\n"
						+ "          text-align: center; }\n" + "\n"
						+ "      /* -------------------------------------\n" + "          TYPOGRAPHY\n"
						+ "      ------------------------------------- */\n" + "      h1,\n" + "      h2,\n"
						+ "      h3,\n" + "      h4 {\n" + "        color: #000000;\n"
						+ "        font-family: sans-serif;\n" + "        font-weight: 400;\n"
						+ "        line-height: 1.4;\n" + "        margin: 0;\n" + "        Margin-bottom: 30px; }\n"
						+ "\n" + "      h1 {\n" + "        font-size: 35px;\n" + "        font-weight: 300;\n"
						+ "        text-align: center;\n" + "        text-transform: capitalize; }\n" + "\n"
						+ "      p,\n" + "      ul,\n" + "      ol {\n" + "        font-family: sans-serif;\n"
						+ "        font-size: 14px;\n" + "        font-weight: normal;\n" + "        margin: 0;\n"
						+ "        Margin-bottom: 15px; }\n" + "        p li,\n" + "        ul li,\n"
						+ "        ol li {\n" + "          list-style-position: inside;\n"
						+ "          margin-left: 5px; }\n" + "\n" + "      a {\n" + "        color: #3498db;\n"
						+ "        text-decoration: underline; }\n" + "\n"
						+ "      /* -------------------------------------\n" + "          BUTTONS\n"
						+ "      ------------------------------------- */\n" + "      .btn {\n"
						+ "        box-sizing: border-box;\n" + "        width: 100%; }\n"
						+ "        .btn > tbody > tr > td {\n" + "          padding-bottom: 15px; }\n"
						+ "        .btn table {\n" + "          width: auto; }\n" + "        .btn table td {\n"
						+ "          background-color: #ffffff;\n" + "          border-radius: 5px;\n"
						+ "          text-align: center; }\n" + "        .btn a {\n"
						+ "          background-color: #ffffff;\n" + "          border: solid 1px #3498db;\n"
						+ "          border-radius: 5px;\n" + "          box-sizing: border-box;\n"
						+ "          color: #3498db;\n" + "          cursor: pointer;\n"
						+ "          display: inline-block;\n" + "          font-size: 14px;\n"
						+ "          font-weight: bold;\n" + "          margin: 0;\n"
						+ "          padding: 12px 25px;\n" + "          text-decoration: none;\n"
						+ "          text-transform: capitalize; }\n" + "\n" + "      .btn-primary table td {\n"
						+ "        background-color: #3498db; }\n" + "\n" + "      .btn-primary a {\n"
						+ "        background-color: #3498db;\n" + "        border-color: #3498db;\n"
						+ "        color: #ffffff; }\n" + "\n" + "      /* -------------------------------------\n"
						+ "          OTHER STYLES THAT MIGHT BE USEFUL\n"
						+ "      ------------------------------------- */\n" + "      .last {\n"
						+ "        margin-bottom: 0; }\n" + "\n" + "      .first {\n" + "        margin-top: 0; }\n"
						+ "\n" + "      .align-center {\n" + "        text-align: center; }\n" + "\n"
						+ "      .align-right {\n" + "        text-align: right; }\n" + "\n" + "      .align-left {\n"
						+ "        text-align: left; }\n" + "\n" + "      .clear {\n" + "        clear: both; }\n"
						+ "\n" + "      .mt0 {\n" + "        margin-top: 0; }\n" + "\n" + "      .mb0 {\n"
						+ "        margin-bottom: 0; }\n" + "\n" + "      .preheader {\n"
						+ "        color: transparent;\n" + "        display: none;\n" + "        height: 0;\n"
						+ "        max-height: 0;\n" + "        max-width: 0;\n" + "        opacity: 0;\n"
						+ "        overflow: hidden;\n" + "        mso-hide: all;\n" + "        visibility: hidden;\n"
						+ "        width: 0; }\n" + "\n" + "      .powered-by a {\n"
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
						+ "          width: auto !important; }}\n" + "\n"
						+ "      /* -------------------------------------\n"
						+ "          PRESERVE THESE STYLES IN THE HEAD\n"
						+ "      ------------------------------------- */\n" + "      @media all {\n"
						+ "        .ExternalClass {\n" + "          width: 100%; }\n" + "        .ExternalClass,\n"
						+ "        .ExternalClass p,\n" + "        .ExternalClass span,\n"
						+ "        .ExternalClass font,\n" + "        .ExternalClass td,\n"
						+ "        .ExternalClass div {\n" + "          line-height: 100%; }\n"
						+ "        .apple-link a {\n" + "          color: inherit !important;\n"
						+ "          font-family: inherit !important;\n" + "          font-size: inherit !important;\n"
						+ "          font-weight: inherit !important;\n"
						+ "          line-height: inherit !important;\n"
						+ "          text-decoration: none !important; }\n" + "        .btn-primary table td:hover {\n"
						+ "          background-color: #34495e !important; }\n" + "        .btn-primary a:hover {\n"
						+ "          background-color: #34495e !important;\n"
						+ "          border-color: #34495e !important; } }\n" + "\n" + "    </style>\n" + "</head>\n"
						+ "  <body class=\"\">\n"
						+ "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\">\n"
						+ "      <tr>\n" + "        <td>&nbsp;</td>\n" + "        <td class=\"container\">\n"
						+ "          <div class=\"content\">\n" + "\n"
						+ "            <!-- START CENTERED WHITE CONTAINER -->\n"
						+ "            <span class=\"preheader\"></span>\n" + "            <table class=\"main\">\n"
						+ "\n" + "              <!-- START MAIN CONTENT AREA -->\n" + "              <tr>\n"
						+ "                <td class=\"wrapper\">\n"
						+ "                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
						+ "                    <tr>\n" + "                      <td>\n"
						+ "							<p><img src=\"cid:image\" width=auto></p>"
						+ "                        <h1>-| User Password |-</h1><br>\n"
						+ "                        <p> Please delete this email once user name known! </p><br>"
						+ "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\">\n"
						+ "                          <tbody>\n" + "                            <tr>\n"
						+ "                              <td align=\"left\">\n"
						+ "                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
						+ "                                  <tbody>\n" + "                                    <tr>\n"
						+ "                                      <td> <a href=\"http://localhost:8081/EcommerceFrontEnd/reset/"+resettokendb+"\" target=\"_blank\">Reset Password</a> </td>\n"
						+ "                                    </tr>\n" + "                                  </tbody>\n"
						+ "                                </table>\n" + "                              </td>\n"
						+ "                            </tr>\n" + "                          </tbody>\n"
						+ "                        </table>\n"
						+ "                        <p><br>This is a sender email please do not reply to this email.<p>"
						+ "						<p>We are available for support and help 24/7.<br></p>"
						+ "                        <p>Thanking You</p>" + "                       <p>Yash Jariwala</p>"
						+ " 				        <p> Owner at Yarish corporation ltd.</p>"
						+ "                        <p>Good luck!</p>" + "                      </td>\n"
						+ "                    </tr>\n" + "                  </table>\n" + "                </td>\n"
						+ "              </tr>\n" + "\n" + "            <!-- END MAIN CONTENT AREA -->\n"
						+ "            </table>\n" + "\n" + "            <!-- START FOOTER -->\n"
						+ "            <div class=\"footer\">\n"
						+ "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
						+ "                <tr>\n" + "                  <td class=\"content-block\">\n"
						+ "                    <span class=\"apple-link\">\n" + "NIIT "
						+ "2nd Floor, Jayashree Building, Next to Paradise Towers, Gokhale Road, Thane West, Naupada, Thane West, Thane, Maharashtra 400602</span>\n"
						+ "                  </td>\n" + "                </tr>\n" + "                <tr>\n"
						+ "                  <td class=\"content-block powered-by\">\n" + "                  </td>\n"
						+ "                </tr>\n" + "              </table>\n" + "            </div>\n"
						+ "            <!-- END FOOTER -->\n" + "\n"
						+ "          <!-- END CENTERED WHITE CONTAINER -->\n" + "          </div>\n" + "        </td>\n"
						+ "        <td>&nbsp;</td>\n" + "      </tr>\n" + "    </table>\n" + "  </body>\n" + "</html>");
				model.addAttribute("error", "An Email is sent to the registered Email ID!");
				return "/forgotPassword";
			}
			else {
				model.addAttribute("error", "User Name enterd is Incorrect!");
				return "/forgotPassword";
			}
		}
	}
	@RequestMapping(value="/reset/{resettoken}", method= RequestMethod.GET)
	public String resetpasswordfinal(@PathVariable("resettoken") String resettokenack, Model model) {
		System.out.println(resettokenack);
		UserCustomer userrtf = udao.get2(resettokenack);
		if (userrtf == null ) {
		model.addAttribute("error","Oops! This is an invalid password reset link");
		return "login";
		
		}
		else {
		System.out.println(userrtf.getUseremail());
		return "resetPassword";
		}
		
	}
	
	@RequestMapping(value="/reset/{resettoken}", method= RequestMethod.POST)
	public ModelAndView setnewpass(@PathVariable("resettoken") String resettokenack,@RequestParam("newpassword") String newpasset, Model model) {
		System.out.println(newpasset);
		System.out.println(resettokenack);
		UserCustomer user = udao.get2(resettokenack);
		System.out.println("user found" + user.getUseremail());
		user.setUserpassword(newpasset);
		udao.save(user);
		ModelAndView model1 = new ModelAndView("login");
		model.addAttribute("error", "The password has been changed and now you can login using your new password.");
		return model1;
		
	}
	
	

	@RequestMapping("/forgotPassword")
	public ModelAndView forgotpass() {
		ModelAndView model = new ModelAndView("forgotPassword");
		return model;
	}

	@RequestMapping("/usernameemailsent")
	public ModelAndView sendemail(@RequestParam("emailsendforgotun") String mailun, Model model)
			throws MessagingException, IOException {
		model.addAttribute("error", "The entered Email Id is: " + mailun + "!");
		System.out.println(mailun);
		String useremail = mailun;
		UserCustomer usercustomerobj001 = udao.get1(useremail);
		if (usercustomerobj001 == null) {
			System.out.println("Email id not found in db");
			model.addAttribute("error", "Email id doesn't exsist!");
			ModelAndView model1 = new ModelAndView("forgotUsername");
			return model1;
		} else {
			System.out.println(usercustomerobj001);
			String usermailfg = usercustomerobj001.getUsername();
			System.out.println(usermailfg);

			{
				email.send(usercustomerobj001, "Forgot User Name", "<!doctype html>\n" + "<html>\n" + "  <head>\n"
						+ "    <meta name=\"viewport\" content=\"width=device-width\" />\n"
						+ "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n"
						+ "    <title>Email</title>\n" + "    <style>\n"
						+ "      /* -------------------------------------\n" + "          GLOBAL RESETS\n"
						+ "      ------------------------------------- */\n" + "      img {\n"
						+ "        border: none;\n" + "        -ms-interpolation-mode: bicubic;\n"
						+ "        max-width: 100%; }\n" + "\n" + "      body {\n"
						+ "        background-color: #f6f6f6;\n" + "        font-family: sans-serif;\n"
						+ "        -webkit-font-smoothing: antialiased;\n" + "        font-size: 14px;\n"
						+ "        line-height: 1.4;\n" + "        margin: 0;\n" + "        padding: 0;\n"
						+ "        -ms-text-size-adjust: 100%;\n" + "        -webkit-text-size-adjust: 100%; }\n" + "\n"
						+ "      table {\n" + "        border-collapse: separate;\n"
						+ "        mso-table-lspace: 0pt;\n" + "        mso-table-rspace: 0pt;\n"
						+ "        width: 100%; }\n" + "        table td {\n" + "          font-family: sans-serif;\n"
						+ "          font-size: 14px;\n" + "          vertical-align: top; }\n" + "\n"
						+ "      /* -------------------------------------\n" + "          BODY & CONTAINER\n"
						+ "      ------------------------------------- */\n" + "\n" + "      .body {\n"
						+ "        background-color: #f6f6f6;\n" + "        width: 100%; }\n" + "\n"
						+ "      /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */\n"
						+ "      .container {\n" + "        display: block;\n" + "        Margin: 0 auto !important;\n"
						+ "        /* makes it centered */\n" + "        max-width: 580px;\n"
						+ "        padding: 10px;\n" + "        width: 580px; }\n" + "\n"
						+ "      /* This should also be a block element, so that it will fill 100% of the .container */\n"
						+ "      .content {\n" + "        box-sizing: border-box;\n" + "        display: block;\n"
						+ "        Margin: 0 auto;\n" + "        max-width: 580px;\n" + "        padding: 10px; }\n"
						+ "\n" + "      /* -------------------------------------\n" + "          HEADER, FOOTER, MAIN\n"
						+ "      ------------------------------------- */\n" + "      .main {\n"
						+ "        background: #ffffff;\n" + "        border-radius: 3px;\n"
						+ "        width: 100%; }\n" + "\n" + "      .wrapper {\n" + "        box-sizing: border-box;\n"
						+ "        padding: 20px; }\n" + "\n" + "      .content-block {\n"
						+ "        padding-bottom: 10px;\n" + "        padding-top: 10px;\n" + "      }\n" + "\n"
						+ "      .footer {\n" + "        clear: both;\n" + "        Margin-top: 10px;\n"
						+ "        text-align: center;\n" + "        width: 100%; }\n" + "        .footer td,\n"
						+ "        .footer p,\n" + "        .footer span,\n" + "        .footer a {\n"
						+ "          color: #999999;\n" + "          font-size: 12px;\n"
						+ "          text-align: center; }\n" + "\n"
						+ "      /* -------------------------------------\n" + "          TYPOGRAPHY\n"
						+ "      ------------------------------------- */\n" + "      h1,\n" + "      h2,\n"
						+ "      h3,\n" + "      h4 {\n" + "        color: #000000;\n"
						+ "        font-family: sans-serif;\n" + "        font-weight: 400;\n"
						+ "        line-height: 1.4;\n" + "        margin: 0;\n" + "        Margin-bottom: 30px; }\n"
						+ "\n" + "      h1 {\n" + "        font-size: 35px;\n" + "        font-weight: 300;\n"
						+ "        text-align: center;\n" + "        text-transform: capitalize; }\n" + "\n"
						+ "      p,\n" + "      ul,\n" + "      ol {\n" + "        font-family: sans-serif;\n"
						+ "        font-size: 14px;\n" + "        font-weight: normal;\n" + "        margin: 0;\n"
						+ "        Margin-bottom: 15px; }\n" + "        p li,\n" + "        ul li,\n"
						+ "        ol li {\n" + "          list-style-position: inside;\n"
						+ "          margin-left: 5px; }\n" + "\n" + "      a {\n" + "        color: #3498db;\n"
						+ "        text-decoration: underline; }\n" + "\n"
						+ "      /* -------------------------------------\n" + "          BUTTONS\n"
						+ "      ------------------------------------- */\n" + "      .btn {\n"
						+ "        box-sizing: border-box;\n" + "        width: 100%; }\n"
						+ "        .btn > tbody > tr > td {\n" + "          padding-bottom: 15px; }\n"
						+ "        .btn table {\n" + "          width: auto; }\n" + "        .btn table td {\n"
						+ "          background-color: #ffffff;\n" + "          border-radius: 5px;\n"
						+ "          text-align: center; }\n" + "        .btn a {\n"
						+ "          background-color: #ffffff;\n" + "          border: solid 1px #3498db;\n"
						+ "          border-radius: 5px;\n" + "          box-sizing: border-box;\n"
						+ "          color: #3498db;\n" + "          cursor: pointer;\n"
						+ "          display: inline-block;\n" + "          font-size: 14px;\n"
						+ "          font-weight: bold;\n" + "          margin: 0;\n"
						+ "          padding: 12px 25px;\n" + "          text-decoration: none;\n"
						+ "          text-transform: capitalize; }\n" + "\n" + "      .btn-primary table td {\n"
						+ "        background-color: #3498db; }\n" + "\n" + "      .btn-primary a {\n"
						+ "        background-color: #3498db;\n" + "        border-color: #3498db;\n"
						+ "        color: #ffffff; }\n" + "\n" + "      /* -------------------------------------\n"
						+ "          OTHER STYLES THAT MIGHT BE USEFUL\n"
						+ "      ------------------------------------- */\n" + "      .last {\n"
						+ "        margin-bottom: 0; }\n" + "\n" + "      .first {\n" + "        margin-top: 0; }\n"
						+ "\n" + "      .align-center {\n" + "        text-align: center; }\n" + "\n"
						+ "      .align-right {\n" + "        text-align: right; }\n" + "\n" + "      .align-left {\n"
						+ "        text-align: left; }\n" + "\n" + "      .clear {\n" + "        clear: both; }\n"
						+ "\n" + "      .mt0 {\n" + "        margin-top: 0; }\n" + "\n" + "      .mb0 {\n"
						+ "        margin-bottom: 0; }\n" + "\n" + "      .preheader {\n"
						+ "        color: transparent;\n" + "        display: none;\n" + "        height: 0;\n"
						+ "        max-height: 0;\n" + "        max-width: 0;\n" + "        opacity: 0;\n"
						+ "        overflow: hidden;\n" + "        mso-hide: all;\n" + "        visibility: hidden;\n"
						+ "        width: 0; }\n" + "\n" + "      .powered-by a {\n"
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
						+ "          width: auto !important; }}\n" + "\n"
						+ "      /* -------------------------------------\n"
						+ "          PRESERVE THESE STYLES IN THE HEAD\n"
						+ "      ------------------------------------- */\n" + "      @media all {\n"
						+ "        .ExternalClass {\n" + "          width: 100%; }\n" + "        .ExternalClass,\n"
						+ "        .ExternalClass p,\n" + "        .ExternalClass span,\n"
						+ "        .ExternalClass font,\n" + "        .ExternalClass td,\n"
						+ "        .ExternalClass div {\n" + "          line-height: 100%; }\n"
						+ "        .apple-link a {\n" + "          color: inherit !important;\n"
						+ "          font-family: inherit !important;\n" + "          font-size: inherit !important;\n"
						+ "          font-weight: inherit !important;\n"
						+ "          line-height: inherit !important;\n"
						+ "          text-decoration: none !important; }\n" + "        .btn-primary table td:hover {\n"
						+ "          background-color: #34495e !important; }\n" + "        .btn-primary a:hover {\n"
						+ "          background-color: #34495e !important;\n"
						+ "          border-color: #34495e !important; } }\n" + "\n" + "    </style>\n" + "</head>\n"
						+ "  <body class=\"\">\n"
						+ "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\">\n"
						+ "      <tr>\n" + "        <td>&nbsp;</td>\n" + "        <td class=\"container\">\n"
						+ "          <div class=\"content\">\n" + "\n"
						+ "            <!-- START CENTERED WHITE CONTAINER -->\n"
						+ "            <span class=\"preheader\"></span>\n" + "            <table class=\"main\">\n"
						+ "\n" + "              <!-- START MAIN CONTENT AREA -->\n" + "              <tr>\n"
						+ "                <td class=\"wrapper\">\n"
						+ "                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
						+ "                    <tr>\n" + "                      <td>\n"
						+ "<p><img src=\"cid:image\" width=auto></p>"
						+ "                        <h1>-| User Name |-</h1><br>\n"
						+ "                        <h3>Your User Name is " + usermailfg + "</h3>"
						+ "                        <p> Please delete this email once user name known! </p><br>"
						+ "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\">\n"
						+ "                          <tbody>\n" + "                            <tr>\n"
						+ "                              <td align=\"left\">\n"
						+ "                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
						+ "                                  <tbody>\n" + "                                    <tr>\n"
						+ "                                      <td> <a href=\"http://localhost:8081/EcommerceFrontEnd/Login\" target=\"_blank\">Login</a> </td>\n"
						+ "                                    </tr>\n" + "                                  </tbody>\n"
						+ "                                </table>\n" + "                              </td>\n"
						+ "                            </tr>\n" + "                          </tbody>\n"
						+ "                        </table>\n"
						+ "                        <p><br>This is a sender email please do not reply to this email.<p>"
						+ "						<p>We are available for support and help 24/7.<br></p>"
						+ "                        <p>Thanking You</p>" + "                       <p>Yash Jariwala</p>"
						+ " 				        <p> Owner at Yarish corporation ltd.</p>"
						+ "                        <p>Good luck!</p>" + "                      </td>\n"
						+ "                    </tr>\n" + "                  </table>\n" + "                </td>\n"
						+ "              </tr>\n" + "\n" + "            <!-- END MAIN CONTENT AREA -->\n"
						+ "            </table>\n" + "\n" + "            <!-- START FOOTER -->\n"
						+ "            <div class=\"footer\">\n"
						+ "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n"
						+ "                <tr>\n" + "                  <td class=\"content-block\">\n"
						+ "                    <span class=\"apple-link\">\n" + "NIIT "
						+ "2nd Floor, Jayashree Building, Next to Paradise Towers, Gokhale Road, Thane West, Naupada, Thane West, Thane, Maharashtra 400602</span>\n"
						+ "                  </td>\n" + "                </tr>\n" + "                <tr>\n"
						+ "                  <td class=\"content-block powered-by\">\n" + "                  </td>\n"
						+ "                </tr>\n" + "              </table>\n" + "            </div>\n"
						+ "            <!-- END FOOTER -->\n" + "\n"
						+ "          <!-- END CENTERED WHITE CONTAINER -->\n" + "          </div>\n" + "        </td>\n"
						+ "        <td>&nbsp;</td>\n" + "      </tr>\n" + "    </table>\n" + "  </body>\n" + "</html>");
				model.addAttribute("error", "An Email is sent to the registered Email ID!");
				ModelAndView model1 = new ModelAndView("forgotUsername");
				return model1;
			}
		}
	}

	@RequestMapping("/loginerror")
	public String LoginError(@RequestParam(value = "error", required = false) String error, Model model) {
		model.addAttribute("error", "Incorrect Username or Password.");
		return "login";
	}

	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		model.addAttribute("logout", "Have a great time! Thank you for visiting us.");
		return "login";// You can redirect wherever you want,
						// but generally it's a good practice to
						// show login screen again.
	}
}