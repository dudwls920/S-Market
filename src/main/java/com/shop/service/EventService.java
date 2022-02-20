package com.shop.service;

import java.util.List;

import com.shop.dto.EventDTO;
import com.shop.dto.ReplyDTO;
import com.shop.vo.PageMaker;

public interface EventService {
	public void write(EventDTO board) throws Exception;
	public EventDTO read(int bno) throws Exception;
//	public EventDTO readimage(int bno) throws Exception;
	
	public void viewcount(int bno) throws Exception;
	public void modify(EventDTO board) throws Exception;
	public void remove(int bno) throws Exception;
	
	public List<EventDTO> EventlistSearchCriteria(PageMaker pm) throws Exception;
	public int EventlistSearchCount(PageMaker pm) throws Exception;
	public EventDTO selectBno(int bno) throws Exception;

}
