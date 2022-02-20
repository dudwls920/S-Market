package com.shop.dto;

public class ProductDTO {
	private String productnum;
	private String productname;
	private String productkind;
	private int productprice;
	private String productcontent;
	private String productimage;
	private String productsales;
	
	@Override
	public String toString() {
		return "ProductDTO [productnum=" + productnum + ", productname=" + productname + ", productkind=" + productkind
				+ ", productprice=" + productprice + ", productcontent=" + productcontent + ", productimage="
				+ productimage + ", productsales=" + productsales + "]";
	}

	public String getProductnum() {
		return productnum;
	}

	public void setProductnum(String productnum) {
		this.productnum = productnum;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductkind() {
		return productkind;
	}

	public void setProductkind(String productkind) {
		this.productkind = productkind;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}

	public String getProductcontent() {
		return productcontent;
	}

	public void setProductcontent(String productcontent) {
		this.productcontent = productcontent;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	public String getProductsales() {
		return productsales;
	}

	public void setProductsales(String productsales) {
		this.productsales = productsales;
	}
	
	


	
}
