package com.shop.control;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.service.ProductService;
import com.shop.vo.PageMaker;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private ProductService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String listAll(PageMaker pm, Model model) throws Exception {
			pm.setProductkind("");
		  model.addAttribute("list", service.listAll());
		  model.addAttribute("ProductBestSales", service.ProductBestSales(pm));
		  model.addAttribute("list",service.listSearchCriteria(pm));
		  pm.setTotalCount(service.listSearchCount(pm));
		  
		  return "main";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(PageMaker pm, Model model) throws Exception {
		  pm.setProductkind("");
		  model.addAttribute("list",service.ProductSearch(pm));
		  pm.setTotalCount(service.ProductSearchCount(pm));
		  
		  return "/search";
	}
	
	
	
}
