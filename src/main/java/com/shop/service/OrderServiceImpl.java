package com.shop.service;

import java.util.ArrayList;
import java.util.List;

import com.shop.dto.OrderDTO;
import com.shop.dto.UserGesipanDTO;
import com.shop.vo.PageMaker;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shop.dao.OrderDAO;
import com.shop.dao.UserGesipanDAO;


@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public ArrayList<OrderDTO> orderList(String id) throws Exception {
		// TODO Auto-generated method stub
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		return dao.orderList(id);
	}


	@Override
	public void remove(String num) throws Exception {
		// TODO Auto-generated method stub
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		dao.remove(num);
	}


	@Override
	public ArrayList<OrderDTO> cashOrderList(String num) throws Exception {
		// TODO Auto-generated method stub
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		return dao.cashOrderList(num);
	}


	@Override
	public List<UserGesipanDTO> mypostList(PageMaker pm,String id) throws Exception {
		OrderDAO dao=sqlSession.getMapper(OrderDAO.class);
		return dao.mypostList(pm,id);
	}


	@Override
	public int mypostCount(String id) throws Exception {
		OrderDAO dao=sqlSession.getMapper(OrderDAO.class);
		return dao.mypostCount(id);
	}


	@Override
	public void update(String ordernum) throws Exception {
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		dao.update(ordernum);
	}


}
