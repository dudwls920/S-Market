package com.shop.control;

import java.util.Locale;

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
public class AppliancesController {

	private static final Logger logger = LoggerFactory.getLogger(AppliancesController.class);

	@Inject
	private ProductService service;

	@RequestMapping(value = "/appliances", method = RequestMethod.GET)
	public void list(PageMaker pm,Model model) throws Exception {

		pm.setProductkind("appliances");
		model.addAttribute("ProductBestSalesList", service.ProductBestSales(pm));
		
		
		logger.info("listPage");
		System.out.println(pm);
		//PageMaker [page=2, perPageNum=10, searchType=t, keyword=888, totalCount=0, startPage=0, endPage=0, prev=false, next=false]
		model.addAttribute("list", service.listSearchCriteria(pm));
		pm.setTotalCount(service.listSearchCount(pm));
	}
	
}
