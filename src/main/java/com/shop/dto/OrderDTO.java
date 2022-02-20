package com.shop.dto;

public class OrderDTO {
	private int ordernum;
	private String orderdate;
	private String productimage;
	private String productname;
	private String productcontent;
	private int orderprice;
	private int amount_orderprice;
	private int ordercount;
	private String paycheck;
	private String delivery;
	private String productnum;
	private String productkind;
	private String payname;
	private String id;
	
	
	
	public String getPayname() {
		return payname;
	}
	public void setPayname(String payname) {
		this.payname = payname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductcontent() {
		return productcontent;
	}
	public void setProductcontent(String productcontent) {
		this.productcontent = productcontent;
	}
	public int getAmount_orderprice() {
		return amount_orderprice;
	}
	public void setAmount_orderprice(int amount_orderprice) {
		this.amount_orderprice = amount_orderprice;
	}
	public int getOrdercount() {
		return ordercount;
	}
	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getProductimage() {
		return productimage;
	}
	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public String getPaycheck() {
		return paycheck;
	}
	public void setPaycheck(String paycheck) {
		this.paycheck = paycheck;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	
	public String getProductnum() {
		return productnum;
	}
	public void setProductnum(String productnum) {
		this.productnum = productnum;
	}
	public String getProductkind() {
		return productkind;
	}
	public void setProductkind(String productkind) {
		this.productkind = productkind;
	}
	@Override
	public String toString() {
		return "OrderDTO [ordernum=" + ordernum + ", orderdate=" + orderdate + ", productimage=" + productimage
				+ ", productname=" + productname + ", productcontent=" + productcontent + ", orderprice=" + orderprice
				+ ", amount_orderprice=" + amount_orderprice + ", ordercount=" + ordercount + ", paycheck=" + paycheck
				+ ", delivery=" + delivery + ", productnum=" + productnum + ", productkind=" + productkind
				+ ", payname=" + payname + ", id=" + id + "]";
	}

	
	
	
}
