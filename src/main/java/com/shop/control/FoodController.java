package com.shop.control;

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

@Controller
public class FoodController {

	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);

	@Inject
	private ProductService service;

	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public void listAll(PageMaker pm, Model model) throws Exception {
		  pm.setProductkind("food");
		  model.addAttribute("list", service.listAll());
		  model.addAttribute("ProductBestSalesList", service.ProductBestSales(pm));
		  
		  logger.info("listPage");
			System.out.println(pm);
			model.addAttribute("list",service.listSearchCriteria(pm));
			pm.setTotalCount(service.listSearchCount(pm));
		
	}
	
	

}
