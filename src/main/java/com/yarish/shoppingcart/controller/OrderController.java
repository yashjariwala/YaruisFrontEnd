package com.yarish.shoppingcart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yarish.ecommercebackend.dao.CartDAO;
import com.yarish.ecommercebackend.dao.CartItemDAO;
import com.yarish.ecommercebackend.dao.CustomerOrderDAO;
import com.yarish.ecommercebackend.model.Cart;
import com.yarish.ecommercebackend.model.CartItem;
import com.yarish.ecommercebackend.model.CustomerOrder;
import com.yarish.ecommercebackend.model.UserCustomer;

@Controller
public class OrderController {
	
	@Autowired
	CartDAO cartdao;
	
	@Autowired
	CustomerOrderDAO custorderdao;
	
	@Autowired
	CartItemDAO cartitemdao;
	

    @RequestMapping("/order/{cartId}")
    public String createOrder(@PathVariable("cartId") int cartId){
        CustomerOrder customerOrder = new CustomerOrder();
        Cart cart = cartdao.getCartByCartId(cartId);
        List<CartItem> cartitemstoorder = cartitemdao.list(cartId);
        System.out.println(cartitemstoorder);
        //UPDATE CARTID FOR CUSTOMERORDER - SET CARTID
        customerOrder.setCart(cart);
        System.out.println(cart);
        UserCustomer customer = cart.getUsercustomer();
        //SET CUSTOMERID
        customerOrder.setUser(customer);
        System.out.println(customer);
        //SET BILLINGADDRESSID
        customerOrder.setBillingAddress(customer.getBillingAddress());
        //SET SHIPPINGADDRESSID
        customerOrder.setShippingAddress(customer.getShippingAddress());

        custorderdao.addCustomerOrder(customerOrder);
        return "redirect:/checkout?cartId=" + cartId;

    }
    
    @RequestMapping("/Myorders")
    public ModelAndView myorders() {
    	ModelAndView model = new ModelAndView("myorders");
		return model;
    	
    }
    
    @RequestMapping("/Allorders")
    public ModelAndView Allorders() {
    	ModelAndView model = new ModelAndView("allorders");
		return model;
    	
    }
    
   

}
