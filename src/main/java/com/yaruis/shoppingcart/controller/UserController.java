package com.yaruis.shoppingcart.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yaruis.ecommercebackend.dao.UserDAO;
import com.yaruis.ecommercebackend.model.BillingAddress;
import com.yaruis.ecommercebackend.model.Email;
import com.yaruis.ecommercebackend.model.ShippingAddress;
import com.yaruis.ecommercebackend.model.UserCustomer;

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
		// u.setCart(cart);
		ModelAndView model = new ModelAndView("signup");
		model.addObject("Userdata", u);
		return model;
	}

	@RequestMapping(value = "/saveuser", method = RequestMethod.POST)
	public String adduser(@Valid @ModelAttribute("Userdata") UserCustomer reg, BindingResult result, Model m)
			throws MessagingException {

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
			email.send(reg, "hello " + reg.getUsername() + ", Your Account is Activated",
					"Welcome to Yash's website - Yaruis! Your password is " + reg.getUserpassword()
							+ " Thank you for selecting Yaruis! " + "We hope you have a plesent shopping experience."
							+ "We are available for support and help 24/7." + "Thanking You Yash Jariwala!"
							+ " Owner at Yaruis corporation ltd.");
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

//	@RequestMapping(value = "/removeuser/{userid}")
//	public String DeleteUser(@PathVariable("userid") int id) {
//		this.udao.delete(id);
//		return "redirect:/listuser";
//
//	}

//	@RequestMapping("/edituser/{username}")
//	public String editUser(@PathVariable("username") String username, Model model) {
//		model.addAttribute("User", this.udao.get(username));
//		model.addAttribute("userList", this.udao.list());
//		return "edituser";
//	}

	@RequestMapping("/Login")
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("login");
		return model;
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