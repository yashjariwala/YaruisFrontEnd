package com.yaruis.shoppingcart.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yaruis.ecommercebackend.dao.CartDAO;
import com.yaruis.ecommercebackend.dao.ShippingAddressDAO;
import com.yaruis.ecommercebackend.dao.UserDAO;
import com.yaruis.ecommercebackend.model.Cart;
import com.yaruis.ecommercebackend.model.ShippingAddress;
import com.yaruis.ecommercebackend.model.Supplier;
import com.yaruis.ecommercebackend.model.UserCustomer;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
public class MyAccountController {

	@Autowired
	private UserDAO udao;

	@Autowired
	private ShippingAddressDAO shipdao;

	@Autowired
	private UserCustomer usercustomer;

	@Autowired
	private ShippingAddress shippingaddress;

	@RequestMapping("/**/MyAccount/**/getUserDetails")
	public ModelAndView getuserid(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = user.getUsername();
		UserCustomer usercustomerobj = udao.get(userid);
		return new ModelAndView("Myaccount", "usercustomerobj", usercustomerobj);
	}

	@RequestMapping("/MyAccount/editshipadd")
		public String editProducts(@PathVariable("shippingid") int id, Model model) {
			return "editshippingaddress";

	}

	@RequestMapping(value = "/updateshipadd", method = RequestMethod.POST)
	public String addsup(@Valid @ModelAttribute("shipadddata") ShippingAddress reg, BindingResult result) {

		if (result.hasErrors())
			return "editshippingaddress.jsp";
		else
			shipdao.update(reg);
		;
		return "redirect:/MyAccount/getUserDetails";
	}

}
