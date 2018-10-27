package com.yaruis.shoppingcart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yaruis.ecommercebackend.dao.CartDAO;
import com.yaruis.ecommercebackend.dao.CartItemDAO;
import com.yaruis.ecommercebackend.dao.CustomerOrderDAO;
import com.yaruis.ecommercebackend.model.Cart;
import com.yaruis.ecommercebackend.model.CartItem;
import com.yaruis.ecommercebackend.model.CustomerOrder;
import com.yaruis.ecommercebackend.model.UserCustomer;

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
