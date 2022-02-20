package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shop.dao.EventDAO;
import com.shop.dto.EventDTO;
import com.shop.dto.ReplyDTO;
import com.shop.vo.PageMaker;

@Service
public class EventServiceImpl implements EventService {
	@Inject
	private SqlSession sqlSession;

	@Override
	public void write(EventDTO board) throws Exception {
		System.out.println(sqlSession);
		EventDAO dao=sqlSession.getMapper(EventDAO.class);
		dao.create(board);

	}

	@Override
	public EventDTO read(int bno) throws Exception {
		EventDAO dao=sqlSession.getMapper(EventDAO.class);

		return dao.read(bno);
	}

	@Override
	public void modify(EventDTO board) throws Exception {
		EventDAO dao=sqlSession.getMapper(EventDAO.class);
		dao.update(board);
	}

	@Override
	public void remove(int bno) throws Exception {
		EventDAO dao=sqlSession.getMapper(EventDAO.class);
		dao.delete(bno);

	}

	@Override
	public List<EventDTO> EventlistSearchCriteria(PageMaker pm) throws Exception {
		EventDAO dao=sqlSession.getMapper(EventDAO.class);
		return dao.EventlistSearch(pm);
	}

	@Override
	public int EventlistSearchCount(PageMaker pm) throws Exception {
		EventDAO dao=sqlSession.getMapper(EventDAO.class);
		return dao.EventlistSearchCount(pm);
	}

	@Override
	public void viewcount(int bno) throws Exception {
		// TODO Auto-generated method stub
		EventDAO dao=sqlSession.getMapper(EventDAO.class);
		dao.viewcount(bno);
	}

	@Override
	public EventDTO selectBno(int bno) throws Exception {
		// TODO Auto-generated method stub
		EventDAO dao=sqlSession.getMapper(EventDAO.class);	
		return dao.selectBno(bno);
	}


	

//	@Override
//	public EventDTO readimage(int bno) throws Exception {
//		// TODO Auto-generated method stub
//		EventDAO dao=sqlSession.getMapper(EventDAO.class);
//		dao.readimage(bno);
//		return dao.readimage(bno);
//	}

}
