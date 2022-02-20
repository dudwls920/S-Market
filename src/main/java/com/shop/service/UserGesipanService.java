package com.shop.service;

import java.util.List;

import com.shop.dto.ReplyDTO;
import com.shop.dto.UserGesipanDTO;
import com.shop.vo.PageMaker;

public interface UserGesipanService {
	public void write(UserGesipanDTO board) throws Exception;
	public UserGesipanDTO read(int bno) throws Exception;
	
	public List<UserGesipanDTO> myread(String id) throws Exception;
	public void viewcount(int bno) throws Exception;
	public void modify(UserGesipanDTO board) throws Exception;
	public void remove(int bno) throws Exception;
	
	public List<UserGesipanDTO> UserGesipanlistSearchCriteria(PageMaker pm) throws Exception;
	public int UserGesipanlistSearchCount(PageMaker pm) throws Exception;
	public List<ReplyDTO> readReply(int bno) throws Exception;
	public void writeRe(ReplyDTO reply) throws Exception;
	
	public void replyRemove(int bno,int rno) throws Exception;
	public void replyModify(ReplyDTO dto) throws Exception;
	
}
