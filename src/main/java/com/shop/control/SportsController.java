package com.shop.control;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.vo.PageMaker;
import com.shop.service.ProductService;

@Controller
public class SportsController {

	private static final Logger logger = LoggerFactory.getLogger(SportsController.class);

	@Inject
	private ProductService service;

	@RequestMapping(value = "/sports", method = RequestMethod.GET)
	public void listAll(PageMaker pm, Model model) throws Exception {
		  pm.setProductkind("sports");
		  model.addAttribute("ProductBestSalesList", service.ProductBestSales(pm));
		  logger.info("listPage");
		  System.out.println(pm);
		  model.addAttribute("list",service.listSearchCriteria(pm));
		  pm.setTotalCount(service.listSearchCount(pm));
			//model.addAttribute("pageMaker",pm);
			//return "sboard/list";
		
	}
	
	

}
