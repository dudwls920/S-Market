package com.shop.dao;

import java.util.List;

import com.shop.dto.MemberDTO;
import com.shop.dto.OrderDTO;
import com.shop.dto.ProductDTO;
import com.shop.vo.PageMaker;

public interface AdminDAO {
	public void create(ProductDTO vo) throws Exception;
		
	public void register(ProductDTO dto) throws Exception;

	  public ProductDTO read(String productnum) throws Exception;

	  public void update(ProductDTO board) throws Exception;

	  public void delete(String productnum) throws Exception;

	  public List<ProductDTO> listAll() throws Exception;
	  
	  public List<ProductDTO> ProductListAll(PageMaker pm) throws Exception;
	  
	  public List<ProductDTO> listSearch(PageMaker pm)throws Exception;
	  
	  public int listSearchCount(PageMaker pm)throws Exception;
	  
	  public List<MemberDTO> MemberList(PageMaker pm) throws Exception;
	  
	  public List<MemberDTO> listSearchMember(PageMaker pm)throws Exception;
	  
	  public int listSearchCountMember(PageMaker pm)throws Exception;
	  
	  public List<OrderDTO> orderAll(PageMaker pm) throws Exception;
	  public int orderAllCount(PageMaker pm)throws Exception;
	  
	  
	  public void orderUpdate(OrderDTO board) throws Exception;
	  
	  
}
