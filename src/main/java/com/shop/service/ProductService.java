package com.shop.service;

import java.util.List;

import com.shop.dto.CartListDTO;
import com.shop.dto.OrderDTO;
import com.shop.dto.ProductDTO;
import com.shop.vo.PageMaker;


public interface ProductService {
	 public void regist(ProductDTO board) throws Exception;

	  public ProductDTO read(Integer bno) throws Exception;

	  public void modify(ProductDTO board) throws Exception;

	  public void remove(Integer bno) throws Exception;

	  public List<ProductDTO> listAll() throws Exception;
	  
	  public List<ProductDTO> ProductBestSales(PageMaker pm) throws Exception;
	  
	  public ProductDTO view(String productnum) throws Exception;
	  
	  public void addCart(CartListDTO cart) throws Exception;
	  
	  public List<CartListDTO> cartList(String id)throws Exception;
	  
	  public void deleteCart(CartListDTO cart) throws Exception;
	  public List<ProductDTO> ProductSearch(PageMaker pm)throws Exception;	  
	  public int ProductSearchCount(PageMaker pm)throws Exception;
		public List<ProductDTO> listSearchCriteria(PageMaker pm) throws Exception;
		public int listSearchCount(PageMaker pm) throws Exception;
		
		public void addOrder(OrderDTO order) throws Exception;
		public void addOrdert(OrderDTO ordert) throws Exception;
}
