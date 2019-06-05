package com.yarish.shoppingcart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChangeImagesController {
	
	@RequestMapping("/UpdateImages")
	public ModelAndView limages() {
		ModelAndView model = new ModelAndView("updateimages");
		return model;
	}
	
	@RequestMapping("/UpdateImages/changeimgcarousel1")
	public ModelAndView carouselimage1() {
		ModelAndView model = new ModelAndView("updateimages");
		return model;
		
	}


}
