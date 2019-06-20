package com.yarish.shoppingcart.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yarish.ecommercebackend.dao.ProductDAO;
import com.yarish.ecommercebackend.model.Product;

@Controller
public class ProductaddController {

	@Autowired
	ProductDAO pdao;

	@RequestMapping("/productadmin")
	public ModelAndView productadmin() {
		Product p = new Product();
		ModelAndView model = new ModelAndView("Productadmin");
		model.addObject("Proddata", p);
		model.addObject("Catgname", pdao.listcatname());
		model.addObject("Supname", pdao.listsupname());
		return model;
	}

	@RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public String addprod(@Valid @ModelAttribute("Proddata") Product reg, HttpServletRequest request,
			BindingResult result) {

		MultipartFile image = reg.getImage();
		if (image != null && !image.isEmpty()) {
			Path path = Paths.get("C:\\Users\\yashj\\WebSite\\YarishFrontEnd\\src\\main\\webapp\\resources\\images\\"
					+ reg.getProductname() + ".jpg");
			try {
				image.transferTo(new File(path.toString()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		pdao.save(reg);
		return ("redirect:/listproduct");

	}

	@RequestMapping(value = "/listproduct")
	public String ViewProducts(Model model) {
		model.addAttribute("productList", this.pdao.list());
		return "/listproducts";
	}
	
	@RequestMapping(value = "/listproduct/{nameofcatgtobesorted}")
	public String ViewProductsByCategory(Model model,@PathVariable("nameofcatgtobesorted") String nameofcatg) {
		model.addAttribute("productListbycategory", this.pdao.listprodbycategory(nameofcatg));
		return "/listedproductbycategory";
	}

	@RequestMapping(value = "/removeprod/{productid}")
	public String DeleteProducts(@PathVariable("productid") int id, Product proString) {
		proString = pdao.get(id);
		System.out.println(proString);
		String todelprodname = proString.getProductname();
		System.out.println(todelprodname);
		try {

			File file = new File("C:\\Users\\yashj\\WebSite\\YarishFrontEnd\\src\\main\\webapp\\resources\\images\\" + todelprodname+".jpg");

			if (file.delete()) {
				System.out.println(file.getName() + " is deleted!");
				this.pdao.delete(id);
			} else {
				System.out.println("Delete operation is failed.");
				return "redirect:/listproduct";
			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		return "redirect:/listproduct";

	}

	@RequestMapping("/editprod/{productid}")
	public String editProducts(@PathVariable("productid") int id, Model model) {
		model.addAttribute("Product", this.pdao.get(id));
		model.addAttribute("productList", this.pdao.list());
		return "editproduct";
	}

	@RequestMapping(value = "/listproductsjson")
	public @ResponseBody List<Product> listProdInJSON() {
		return pdao.list();
	}
	
	@RequestMapping("/listproductsjson/{nameofcatgtobesorted}")
	public @ResponseBody List<Product> listjsonproductsbycategoryInJSON (@PathVariable("nameofcatgtobesorted") String nameofcatgtobesorted, Model model) {
		return pdao.listprodbycategory(nameofcatgtobesorted);
	}
	
	@RequestMapping("/infoprod/{productid}")
	public ModelAndView getRecord(@PathVariable("productid") int id, Model model) {
		Product productObject = pdao.get(id);
		return new ModelAndView("singleProduct", "productObject", productObject);
	}

}
