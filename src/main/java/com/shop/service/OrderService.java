package com.shop.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.dto.OrderDTO;
import com.shop.dto.UserGesipanDTO;
import com.shop.vo.PageMaker;

public interface OrderService {
	public ArrayList<OrderDTO> orderList(String id)throws Exception;
	public void remove(String num)throws Exception;
	public void update(String ordernum)throws Exception;
	public ArrayList<OrderDTO> cashOrderList(String num)throws Exception;
	
	public List<UserGesipanDTO> mypostList(PageMaker pm, String id)throws Exception;
	public int mypostCount(String id)throws Exception;
}
