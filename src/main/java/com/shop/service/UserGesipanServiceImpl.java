package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.EventDAO;
import com.shop.dao.UserGesipanDAO;
import com.shop.dto.ReplyDTO;
import com.shop.dto.UserGesipanDTO;
import com.shop.vo.PageMaker;

@Service
public class UserGesipanServiceImpl implements UserGesipanService {
	@Inject
	private SqlSession sqlSession;

	@Override
	public void write(UserGesipanDTO board) throws Exception {
		System.out.println(sqlSession);
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);
		dao.create(board);

	}

	@Override
	public UserGesipanDTO read(int bno) throws Exception {
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);

		return dao.read(bno);
	}
	@Override
	public List<UserGesipanDTO> myread(String id) throws Exception {
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);

		return dao.myread(id);
	}

	@Override
	public void modify(UserGesipanDTO board) throws Exception {
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);
		dao.update(board);
	}

	@Override
	public void remove(int bno) throws Exception {
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);
		dao.delete(bno);

	}

	@Override
	public List<UserGesipanDTO> UserGesipanlistSearchCriteria(PageMaker pm) throws Exception {
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);
		return dao.UserGesipanlistSearch(pm);
	}

	@Override
	public int UserGesipanlistSearchCount(PageMaker pm) throws Exception {
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);
		return dao.UserGesipanlistSearchCount(pm);
	}

	@Override
	public List<ReplyDTO> readReply(int bno) throws Exception {
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);
		return dao.readReply(bno);
	}

	@Override
	public void writeRe(ReplyDTO reply) throws Exception {
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);
		dao.createRe(reply);
		
	}

	@Override
	public void replyRemove(int bno,int rno) throws Exception {
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);
		dao.replyRemove(bno,rno);
	}

	@Override
	public void viewcount(int bno) throws Exception {
		// TODO Auto-generated method stub
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);
		dao.viewcount(bno);
	}

	@Override
	public void replyModify(ReplyDTO dto) throws Exception {
		
		UserGesipanDAO dao=sqlSession.getMapper(UserGesipanDAO.class);
		dao.replyModify(dto);		
	}
	

}
