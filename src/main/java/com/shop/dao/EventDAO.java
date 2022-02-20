package com.shop.dao;

import java.util.List;

import com.shop.dto.EventDTO;
import com.shop.dto.ReplyDTO;
import com.shop.vo.PageMaker;

public interface EventDAO {
	  public void create(EventDTO vo) throws Exception;
	  public EventDTO read(int bno) throws Exception;
//	  public EventDTO readimage(int bno) throws Exception;

	  public void update(EventDTO vo) throws Exception;
	  public void viewcount(int bno) throws Exception;
	  public EventDTO selectBno(int bno) throws Exception;

	  public void delete(int bno) throws Exception;

	//  
	  public List<EventDTO> EventlistSearch(PageMaker pm)throws Exception;
	//  
	  public int EventlistSearchCount(PageMaker pm)throws Exception;

}
