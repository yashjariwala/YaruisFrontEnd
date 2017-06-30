package com.yaruis.shoppingcart.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yaruis.ecommercebackend.dao.SupplierDAO;
import com.yaruis.ecommercebackend.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	SupplierDAO sdao;

	@RequestMapping("/supplier")
	public ModelAndView supplier() {
		Supplier s = new Supplier();
		ModelAndView model = new ModelAndView("supplier");
		model.addObject("supdata", s);
		return model;
	}

	@RequestMapping(value = "/addsup", method = RequestMethod.POST)
	public String addsup(@Valid @ModelAttribute("supdata") Supplier reg, BindingResult result) {

		if (result.hasErrors())
			return "supplier";
		else
			sdao.save(reg);
		return "redirect:/listsupplier";
	}

	@RequestMapping(value = "/listsupplier")
	public String ViewSupplier(Model model) {
		System.out.println("before");
		model.addAttribute("supplierList", this.sdao.listSupplier());
		System.out.println("after");
		return "/listsupplier";
	}

	@RequestMapping(value = "/listsupplierjson")
	public @ResponseBody List<Supplier> listSupplierInJSON() {
		return sdao.listSupplier();
	}

	@RequestMapping(value = "/removesup/{supplierid}")
	public String DeleteSupplier(@PathVariable("supplierid") int id) {
		this.sdao.delete(id);
		return "redirect:/listsupplier";

	}

	@RequestMapping("/editsup/{supplierid}")
	public String editSupplier(@PathVariable("supplierid") int id, Model model) {
		model.addAttribute("Supplier", this.sdao.get(id));
		model.addAttribute("supplierList", this.sdao.listSupplier());
		return "editsupplier";
	}
}
