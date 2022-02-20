package com.shop.dto;

import java.util.Date;

public class MemberDTO {
   private String id;
   private String pw;
   private String membername;
   private String year;
   private String month;
   private String day;
   private String gender;
   private String email;
   private String address;
   private String phonenum;
   private String authority;
   
   @Override
   public String toString() {
      return "MemberDTO [id=" + id + ", pw=" + pw + ", membername=" + membername + ", year=" + year
            + ", month=" + month + ", day=" + day + ", gender=" + gender + ", email=" + email + ", adress=" + address
            + ", phonenum=" + phonenum + ", authority=" + authority + "]";
   }
   

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPw() {
      return pw;
   }

   public void setPw(String pw) {
      this.pw = pw;
   }

   public String getMembername() {
      return membername;
   }

   public void setMembername(String membername) {
      this.membername = membername;
   }

   public String getYear() {
      return year;
   }

   public void setYear(String year) {
      this.year = year;
   }

   public String getMonth() {
      return month;
   }

   public void setMonth(String month) {
      this.month = month;
   }

   public String getDay() {
      return day;
   }

   public void setDay(String day) {
      this.day = day;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String adress) {
      this.address = adress;
   }

   public String getPhonenum() {
      return phonenum;
   }

   public void setPhonenum(String phonenum) {
      this.phonenum = phonenum;
   }

   public String getAuthority() {
      return authority;
   }

   public void setAuthority(String authority) {
      this.authority = authority;
   }
   
   
   
}
