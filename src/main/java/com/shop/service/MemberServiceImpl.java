package com.shop.service;

import java.util.ArrayList;
import com.shop.dto.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.shop.dao.MemberDAO;
import com.shop.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public  void insert(MemberDTO dto) throws DataAccessException{
		// TODO Auto-generated method stub
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.insert(dto);
	}

	@Override
	public void update(MemberDTO dto) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.update(dto);
	}

	@Override
	public void delete(String name) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.delete(name);
	}

	@Override
	public ArrayList<MemberDTO> selectAll() throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		return dao.selectAll();
	}

	@Override
	public MemberDTO selectName(String name) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		return dao.selectName(name);
	}

	@Override
	public MemberDTO selectLogin(String id,String pw) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		return dao.selectLogin(id,pw);
	}

	@Override
	public MemberDTO checkId(String id) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		return dao.checkId(id);

	}

	@Override
	public int idChk(MemberDTO dto) throws Exception {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = dao.idChk(dto);
		return result;
	}
	

	

}
