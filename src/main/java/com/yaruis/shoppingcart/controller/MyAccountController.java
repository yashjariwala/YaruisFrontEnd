package com.yaruis.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yaruis.ecommercebackend.dao.CartDAO;
import com.yaruis.ecommercebackend.dao.UserDAO;
import com.yaruis.ecommercebackend.model.Cart;
import com.yaruis.ecommercebackend.model.UserCustomer;

@Controller
public class MyAccountController {

	@Autowired
	private UserDAO udao;
	
	@Autowired
	private UserCustomer usercustomer;

	@RequestMapping("/**/MyAccount/**/getUserDetails")
	public ModelAndView getuserid(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = user.getUsername();
		UserCustomer usercustomerobj = udao.get(userid);
		return new ModelAndView("Myaccount", "usercustomerobj", usercustomerobj);
	}

//	@RequestMapping("/MyAccount/**/getUserDetails/{userid}")
//	public @ResponseBody UserCustomer getCartItems(@PathVariable(value = "cartId") int cartId) {
//		Cart cart = cartdao.getCartByCartId(cartId);
//		return cart;
//	}

}
