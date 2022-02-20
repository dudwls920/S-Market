package com.shop.service;

import java.util.List;

import com.shop.dto.EventDTO;
import com.shop.dto.MemberDTO;
import com.shop.dto.OrderDTO;
import com.shop.dto.ProductDTO;
import com.shop.vo.PageMaker;
import com.shop.dto.ProductDTO;

public interface AdminService {
	
	public void register(ProductDTO dto) throws Exception;
	
	
	public void write(ProductDTO board) throws Exception;

	public void regist(ProductDTO board) throws Exception;

	public ProductDTO read(String productnum) throws Exception;

	public void modify(ProductDTO board) throws Exception;

	public void remove(String productnum) throws Exception;

	public List<ProductDTO> listAll() throws Exception;
	
	public List<ProductDTO> ProductListAll(PageMaker pm) throws Exception;

	public List<ProductDTO> listSearchCriteria(PageMaker pm) throws Exception;

	public int listSearchCount(PageMaker pm) throws Exception;
	
	public List<MemberDTO> MemberList(PageMaker pm) throws Exception;
	
	public List<MemberDTO> listSearchMemberCriteria(PageMaker pm) throws Exception;

	public int listSearchMemberCount(PageMaker pm) throws Exception;
	
	public List<OrderDTO> orderAll(PageMaker pm) throws Exception;
	public int orderAllCount(PageMaker pm)throws Exception;

	public void orderUpdate(OrderDTO board) throws Exception;
}
