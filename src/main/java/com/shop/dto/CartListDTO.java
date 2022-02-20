package com.shop.dto;

public class CartListDTO {

	private int cartNum;
	private String id;
	private String productnum;
	private int cartStock;

	private String productname;
	private int productprice;
	private String productkind;
	private String productimage;
	
	@Override
	public String toString() {
		return "CartListDTO [cartNum=" + cartNum + ", id=" + id + ", productnum=" + productnum + ", cartStock="
				+ cartStock + ", productname=" + productname + ", productprice=" + productprice + ", productkind="
				+ productkind + ", productimage=" + productimage + "]";
	}

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProductnum() {
		return productnum;
	}

	public void setProductnum(String productnum) {
		this.productnum = productnum;
	}

	public int getCartStock() {
		return cartStock;
	}

	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}

	public String getProductkind() {
		return productkind;
	}

	public void setProductkind(String productkind) {
		this.productkind = productkind;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}
	
	
	
	
	
	

	
	
}
