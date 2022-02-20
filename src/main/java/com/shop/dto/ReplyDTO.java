package com.shop.dto;

import java.util.Date;

public class ReplyDTO {
	private int bno;
	private int rno;
	private String content;
	private String id;
	private Date regdate;
	

	
	public int getBno() {
		return bno;
	}



	public void setBno(int bno) {
		this.bno = bno;
	}



	public int getRno() {
		return rno;
	}



	public void setRno(int rno) {
		this.rno = rno;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	@Override
	public String toString() {
		return "ReplyDTO [bno=" + bno + ", rno=" + rno + ", content=" + content + ", id=" + id + ", regdate=" + regdate
				+ "]";
	}
	
	
	
}
