<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="/control/resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var fObject = $(".form");

		$(".btnCancel").on("click", function() {

			fObject.attr("method", "get");
			fObject.attr("action", "/control/eventgesipan/eventmain");
			fObject.submit();

		})
		$(".btnSave").on("click", function() {
			fObject.attr("method", "post");
			fObject.attr("action", "/control/eventgesipan/eventmodify");
			fObject.submit();
		})

	});
</script>
<style>
* {
  box-sizing: border-box;
}

/* Style the body */
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

/* Header/logo Title */
.header {
  padding: 80px;
  text-align: center;
  background: #1abc9c;
  color: white;
}

/* Increase the font size of the heading */
.header h1 {
  font-size: 40px;
}

/* Style the top navigation bar */
.navbar {
  overflow: hidden;
}

/* Style the navigation bar links */
.navbar a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 20px;
  text-decoration: none;
}

/* Right-aligned link */
.navbar a.right {
  float: right;
}

/* Change color on hover */
.navbar a:hover {
  background-color: #ddd;
  color: black;
}

/* Column container */
.row {  
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
}

/* Create two unequal columns that sits next to each other */
/* Sidebar/left column */
.side {
  -ms-flex: 30%; /* IE10 */
  flex: 30%;
  background-color: #f1f1f1;
  padding: 20px;
}

/* Main column */
.main {   
  -ms-flex: 70%; /* IE10 */
  flex: 70%;
  background-color: white;
  padding: 20px;
}

/* Fake image, just for this example */
.fakeimg {
  background-color: #aaa;
  width: 100%;
  padding: 20px;
}

/* Footer */
.footer {
  padding: 20px;
  text-align: center;
  background: #ddd;
}

/* Responsive layout - when the screen is less than 700px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
  .row {   
    flex-direction: column;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .navbar a {
    float: none;
    width: 100%;
  }
}
/* table css*/
.customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

.customers td, .customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

.customers tr:nth-child(even){background-color: #f2f2f2;}

.customers tr:hover {background-color: #ddd;}

.customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}

/*pagination*/

.pagination {
  display: inline-block;
}

.pagination a {
  border-radius: 5px;
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}

.pagination a.active {
border-radius: 5px;
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

@media (max-width:1100px){
   .product .pagination {
        margin : 10px 0 0 41%;
	}
}
</style>
</head>
<body>

	<%@include file="../Header.jsp"%>
<!-- header section ends 페이지최상단종료 -->

	<div class="main">

		<form class="form" method="post">

			<input type='hidden' name='bno' value="${eventDTO.bno}"> <input
				type='hidden' name='page' value="${pageMaker.page}"> <input
				type='hidden' name='perPageNum' value="${pageMaker.perPageNum}">
			<input type='hidden' name='searchType'
				value="${pageMaker.searchType}"> <input type='hidden'
				name='keyword' value="${pageMaker.keyword}">



			<h1>수정</h1>
			<h2>
				제목
				<input type="text" name='title' style="width: 100%"
					value="${eventDTO.title}">
			</h2>

			<h2>
				내용
				<textarea style="width: 100%" name="content" rows="3">${eventDTO.content}</textarea>
			</h2>
			
			<h2>
				사진첨부
				<textarea style="width: 100%" name="image" rows="1">${eventDTO.image}</textarea>
			</h2>

			<h2>
			 <input type="hidden" name="id" style="width: 100%"
					value="${eventDTO.id}">
				<h2>
		</form>
		<!-- /.box-body -->
		<div class="box-footer">
			<button type="submit" class="btnSave">저장</button>
			<button type="submit" class="btnCancel">취소</button>
		</div>

	</div>
	<%@include file="../Footer.jsp"%>
</body>
</html>