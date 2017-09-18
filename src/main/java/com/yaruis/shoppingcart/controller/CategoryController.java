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

import com.yaruis.ecommercebackend.dao.CategoryDAO;
import com.yaruis.ecommercebackend.model.Category;

@Controller
public class CategoryController {

	@Autowired
	CategoryDAO cdao;

	@RequestMapping("/category")
	public ModelAndView category() {
		Category c = new Category();
		ModelAndView model = new ModelAndView("Category");
		model.addObject("Catgdata", c);
		return model;
	}

	@RequestMapping(value = "/addcatg", method = RequestMethod.POST)
	public String addcatg(@Valid @ModelAttribute("Catgdata") Category reg, BindingResult result) {
		if (result.hasErrors())
			return "Category";
		else
		cdao.save(reg);
		return "redirect:/listcategory";

	}

	@RequestMapping(value = "/listcategory")
	public String ViewCategory(Model model) {
		model.addAttribute("categoryList", this.cdao.list());
		return "/listcategory";
	}

	@RequestMapping(value = "/removecatg/{categoryid}")
	public String DeleteCategory(@PathVariable("categoryid") int id) {
		this.cdao.delete(id);
		return "redirect:/listcategory";

	}

	@RequestMapping("/editcatg/{categoryid}")
	public String editCategory(@PathVariable("categoryid") int id, Model model) {
		model.addAttribute("Category", this.cdao.get(id));
		model.addAttribute("categoryList", this.cdao.list());
		return "editcategory";
	}

	@RequestMapping(value = "/listcatgeoryjson")
	public @ResponseBody List<Category> listCatgInJSON() {
		return cdao.list();
	}

}
