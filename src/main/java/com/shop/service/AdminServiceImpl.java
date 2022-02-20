package com.shop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.AdminDAO;
import com.shop.dao.UserGesipanDAO;
import com.shop.dto.MemberDTO;
import com.shop.dto.OrderDTO;
import com.shop.dto.ProductDTO;
import com.shop.vo.PageMaker;


@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regist(ProductDTO board) throws Exception {

	}

	@Override
	public ProductDTO read(String productnum) throws Exception {
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);

		return dao.read(productnum);
	}

	@Override
	public void modify(ProductDTO board) throws Exception {
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		dao.update(board);
	}

	@Override
	public void remove(String productnum) throws Exception {
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		dao.delete(productnum);
	}

	@Override
	public List<ProductDTO> listAll() throws Exception {
		  AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		  List<ProductDTO> dtos=dao.listAll();
		  System.out.println(dtos);
	    return dtos;
		
	}


	
	@Override
	public List<ProductDTO> listSearchCriteria(PageMaker pm) throws Exception {
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		return dao.listSearch(pm);
	}

	@Override
	public int listSearchCount(PageMaker pm) throws Exception {
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		return dao.listSearchCount(pm);
	}

	@Override
	public void write(ProductDTO board) throws Exception {
		System.out.println(sqlSession);
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		dao.create(board);
	}

	@Override
	public List<ProductDTO>ProductListAll(PageMaker pm) throws Exception {
		  AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		  List<ProductDTO> dtos=dao.ProductListAll(pm);
		  System.out.println(dtos);
	    return dtos;
	}

	@Override
	public List<MemberDTO> MemberList(PageMaker pm) throws Exception {
		 AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		  List<MemberDTO> dtos=dao.MemberList(pm);
		  System.out.println("memberDTO service check"+dtos);
		return dtos;
	}

	@Override
	public List<MemberDTO> listSearchMemberCriteria(PageMaker pm) throws Exception {
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		return dao.listSearchMember(pm);
	}

	@Override
	public int listSearchMemberCount(PageMaker pm) throws Exception {
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		return dao.listSearchCountMember(pm);
	}

	@Override
	public List<OrderDTO> orderAll(PageMaker pm) throws Exception {
		 AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		 return dao.orderAll(pm);
	}

	@Override
	public int orderAllCount(PageMaker pm) throws Exception {
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		return dao.orderAllCount(pm);
	}

	@Override
	public void register(ProductDTO dto) throws Exception {
		System.out.println(sqlSession);
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		dao.register(dto);
	}

	@Override
	public void orderUpdate(OrderDTO board) throws Exception {
		AdminDAO dao=sqlSession.getMapper(AdminDAO.class);
		dao.orderUpdate(board);
	}

}
