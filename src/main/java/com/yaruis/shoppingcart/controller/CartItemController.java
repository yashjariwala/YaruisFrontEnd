package com.yaruis.shoppingcart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.yaruis.ecommercebackend.dao.CartDAO;
import com.yaruis.ecommercebackend.dao.CartItemDAO;
import com.yaruis.ecommercebackend.dao.ProductDAO;
import com.yaruis.ecommercebackend.dao.UserDAO;
import com.yaruis.ecommercebackend.model.Cart;
import com.yaruis.ecommercebackend.model.CartItem;
import com.yaruis.ecommercebackend.model.Product;
import com.yaruis.ecommercebackend.model.UserCustomer;

@Controller
public class CartItemController {

	@Autowired
	private CartItemDAO cartitemdao;

	@Autowired
	private UserDAO userdao;

	@Autowired
	private ProductDAO productdao;

	@Autowired
	private CartDAO cartdao;

	@RequestMapping("/cart/add/{productid}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void addCartItem(@PathVariable(value = "productid") int productid) {
		// Is to get the username of the customer
		// User object contains details about the user -username , password,
		// activeuser or not
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		UserCustomer user1 = userdao.get(username);
		Cart cart = user1.getCart();

		List<CartItem> cartItems = cart.getCartItems();
		System.out.println(cartItems.isEmpty());
		Product product = productdao.get(productid);

		for (int i = 0; i < cartItems.size(); i++) {
			CartItem cartItem = cartItems.get(i);

			if (product.getProductid() == cartItem.getProduct().getProductid()) {
				cartItem.setQuantity(cartItem.getQuantity() + 1);
				cartItem.setTotalprice(cartItem.getQuantity() * cartItem.getProduct().getProductprice());
				cartitemdao.addCartItem(cartItem);
				return;
			}
		}
		CartItem cartItem = new CartItem();
		cartItem.setQuantity(1);
		cartItem.setProduct(product);
		cartItem.setTotalprice(product.getProductprice() * 1);
		cartItem.setCart(cart);
		cartitemdao.addCartItem(cartItem);
		System.out.println(cartItem.getTotalprice());
	}

	@RequestMapping("/cart/removecartitem/{cartitemid}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeCartItem(@PathVariable(value = "cartitemid") int cartItemId) {
		System.out.println("removing item");
		cartitemdao.removeCartItem(cartItemId);
	}

	@RequestMapping("/cart/removeAllItems/{cartId}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeAllCartItems(@PathVariable(value = "cartId") int cartId) {
		Cart cart = cartdao.getCartByCartId(cartId);
		cartitemdao.removeAllCartItems(cart);
	}

}
