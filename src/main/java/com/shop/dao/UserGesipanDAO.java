package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.dto.ReplyDTO;
import com.shop.dto.UserGesipanDTO;
import com.shop.vo.PageMaker;

public interface UserGesipanDAO {
	  public void create(UserGesipanDTO vo) throws Exception;
	  public UserGesipanDTO read(int bno) throws Exception;
	  
	  public List<UserGesipanDTO> myread(String id) throws Exception;
	  public void viewcount(int bno) throws Exception;
	  public void update(UserGesipanDTO vo) throws Exception;

	  public void delete(int bno) throws Exception;

	//  
	  public List<UserGesipanDTO> UserGesipanlistSearch(PageMaker pm)throws Exception;
	//  
	  public int UserGesipanlistSearchCount(PageMaker pm)throws Exception;
	  
	  public List<ReplyDTO> readReply(int bno) throws Exception;
	  public void createRe(ReplyDTO re) throws Exception;
	  
	  public void replyRemove(@Param("bno")int bno, @Param("rno")int rno) throws Exception;
	  public void replyModify(ReplyDTO dto) throws Exception;
	  

}
