package com.shop.dao;

import java.util.List;

import com.shop.dto.ProductDTO;
import com.shop.dto.CartListDTO;
import com.shop.dto.EventDTO;
import com.shop.dto.OrderDTO;
import com.shop.vo.PageMaker;

public interface ProductDAO {
	public void create(ProductDTO vo) throws Exception;

	  public ProductDTO read(Integer bno) throws Exception;

	  public void update(ProductDTO vo) throws Exception;

	  public void delete(Integer bno) throws Exception;

	  public List<ProductDTO> listAll() throws Exception;
	  
	  public List<ProductDTO> ProductBestSales(PageMaker pm) throws Exception;
	  
	  public List<ProductDTO> listSearch(PageMaker pm)throws Exception;
		  
	  public int listSearchCount(PageMaker pm)throws Exception;
	  public int ProductSearchCount(PageMaker pm)throws Exception;
	  public ProductDTO view(String productnum) throws Exception;
	  
	  public void addCart(CartListDTO cart) throws Exception;
	  
	  public List<CartListDTO> cartList(String id)throws Exception;
	  
	  public void deleteCart(CartListDTO cart) throws Exception;
	  
	  public List<ProductDTO> ProductSearch(PageMaker pm)throws Exception;
	  
	  
	  public void addOrder(OrderDTO order) throws Exception;
	  public void addOrdert(OrderDTO ordert) throws Exception;
}

