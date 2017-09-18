package com.yaruis.shoppingcart.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yaruis.ecommercebackend.dao.BillingAddressDAO;
import com.yaruis.ecommercebackend.dao.ShippingAddressDAO;
import com.yaruis.ecommercebackend.dao.UserDAO;
import com.yaruis.ecommercebackend.model.BillingAddress;
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
}
