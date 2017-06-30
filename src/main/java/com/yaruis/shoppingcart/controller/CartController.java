package com.yaruis.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yaruis.ecommercebackend.dao.CartDAO;
import com.yaruis.ecommercebackend.dao.UserDAO;
import com.yaruis.ecommercebackend.model.Cart;
import com.yaruis.ecommercebackend.model.UserCustomer;

@Controller
public class CartController {

	@Autowired
	private UserDAO userdao;

	@Autowired
	CartDAO cartdao;



	@RequestMapping("/**/cart/**/getCartId")
	public String getCartId(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = user.getUsername();
		UserCustomer user1 = userdao.get(userid);
		model.addAttribute("cartId", user1.getCart().getCartId());
		return "cart";
	}

	@RequestMapping("/cart/**/getCart/{cartId}")
	public @ResponseBody Cart getCartItems(@PathVariable(value = "cartId") int cartId) {
		Cart cart = cartdao.getCartByCartId(cartId);
		return cart;
	}

}
