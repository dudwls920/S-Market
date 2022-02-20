package com.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shop.dto.MemberDTO;


public interface MemberDAO {

	public void insert(MemberDTO dto) throws DataAccessException;
	public void update(MemberDTO dto) throws Exception;
	public void delete(String name) throws Exception;
	public MemberDTO checkId(String id) throws Exception;
	
	public int idChk(MemberDTO dto) throws Exception;
	
	public ArrayList<MemberDTO> selectAll() throws Exception;
	public MemberDTO selectName(String name) throws Exception;
	public MemberDTO selectLogin(@Param("id") String id,@Param("pw") String pw) throws Exception;
	
}
