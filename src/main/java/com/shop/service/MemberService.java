package com.shop.service;

import java.util.ArrayList;

import org.springframework.dao.DataAccessException;

import com.shop.dto.MemberDTO;

public interface MemberService {
	public void insert(MemberDTO dto) throws DataAccessException;
	public void update(MemberDTO dto) throws Exception;
	public void delete(String name) throws Exception;
	public MemberDTO checkId(String id) throws Exception;
	
	public int idChk(MemberDTO dto) throws Exception;
	
	public ArrayList<MemberDTO> selectAll() throws Exception;
	
	public MemberDTO selectName(String name) throws Exception;
	public MemberDTO selectLogin(String id,String pw) throws Exception;

	
}
