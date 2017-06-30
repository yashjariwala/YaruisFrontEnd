package com.yaruis.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yaruis.ecommercebackend.dao.CartDAO;
import com.yaruis.ecommercebackend.dao.CustomerOrderDAO;
import com.yaruis.ecommercebackend.model.Cart;
import com.yaruis.ecommercebackend.model.CustomerOrder;
import com.yaruis.ecommercebackend.model.UserCustomer;

@Controller
public class OrderController {
	
	@Autowired
	CartDAO cartdao;
	
	@Autowired
	CustomerOrderDAO custorderdao;
	

    @RequestMapping("/order/{cartId}")
    public String createOrder(@PathVariable("cartId") int cartId){
        CustomerOrder customerOrder = new CustomerOrder();
        Cart cart = cartdao.getCartByCartId(cartId);
        //UPDATE CARTID FOR CUSTOMERORDER - SET CARTID
        customerOrder.setCart(cart);


        UserCustomer customer = cart.getUsercustomer();
        //SET CUSTOMERID
        customerOrder.setUser(customer);
        //SET BILLINGADDRESSID
        customerOrder.setBillingAddress(customer.getBillingAddress());
        //SET SHIPPINGADDRESSID
        customerOrder.setShippingAddress(customer.getShippingAddress());

        custorderdao.addCustomerOrder(customerOrder);
        return "redirect:/checkout?cartId=" + cartId;

    }

}
