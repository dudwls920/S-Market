<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>admin</title>
<link rel="stylesheet" href="/control/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	$(document).ready(function() {

		var formObj = $("form[role='removeForm']");

		console.log(formObj);

		$(".btnRemove").on("click", function() {
			formObj.attr("action", "/control/admin/adminProductRemove");
			formObj.submit();
		});

	});
</script>
<style>
* {
	margin: 0px;
	padding: 0px;
}

body {
	
}

.outline {
	display: flex;
	flex-flow: nowrap;
	width: 1920px;
	height: 1000px;
}

.sidebar {
	width: 15%;
	height: 100%;
	background-color: white;
}

.sidebar a {
	cursor: pointer;
	color: black;
	font-size: 13px;
	text-decoration: none;
	display: block;
	padding: 5px 30px;
	line-height: 65px;
	text-align: center;
}

.sidebar a:hover {
	transition: 0.3s ease;
	background-color: #ddd;
}

.adminmain {
	width: 85%;
	height: 100%;
	/*background-color: #f9f9f9;*/
	background-color: #eee;
	display: block;
	font-size: 13px;
}

/*테이블*/
table {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

table thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table tbody th {
	width: 170px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #27ae60;
}

table td {
	width: 100px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

/*페이지네이션*/
.pagination {
	display: inline-block;
	margin: 10px 0 0 25%;
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

.product .pagination a :hover :not (.active){
	background-color:#ddd;
}
@media ( max-width :1100px) {
	.pagination {
		margin: 10px 0 0 41%;
	}
}
</style>
</head>

<body>
		<%@include file="../Header.jsp"%>
	
	<div class="outline">

		<div class="sidebar">
			<a>상품등록페이지입니다.</a> <a href='adminProduct'><i
				class="fas fa-caret-right"></i>&nbsp;&nbsp;&nbsp;상품등록</a> <a
				href='adminOrder'><i class="fas fa-caret-right"></i>&nbsp;&nbsp;&nbsp;주문관리</a>
			<a href='adminMemberList'><i class="fas fa-caret-right"></i>&nbsp;&nbsp;&nbsp;회원관리</a>
		</div>
		
		<div class="adminmain">
			<br>
			<h3 style="margin-left: 600px">상품 등록</h3>
			<br>
			<form action="" method="post">
				<table>
					<tr>
						<th>상품코드</th>
						<th>상품이름</th>
						<th>상품종류</th>
						<th>상품가격</th>
						<th>상품설명</th>
						<th>상품이미지</th>
						<th>상품판매량</th>
						<th>입력</th>
					</tr>
					<tr>
					<td>${productDTO.productnum}</td>
					<td><input type="text" id="productname" name="productname"
						style="width: 150px;" value="${productDTO.productname}"></td>
					<td><input type="text" id="productkind" name="productkind"
						style="width: 150px;" value="${productDTO.productkind}"></td>
					<td><input type="text" id="productprice" name="productprice"
						style="width: 150px;" value="${productDTO.productprice}"></td>
					<td><input type="text" id="productcontent"
						name="productcontent" style="width: 150px;" value="${productDTO.productcontent}"></td>
					<td><input type="text" id="productimage" name="productimage"
						style="width: 150px;" value="${productDTO.productimage}"></td>
					<td><input type="text" id="productsales" name="productsales"
						style="width: 150px;" value="${productDTO.productsales}"></td>
					<td><button type="submit">수정하기</button></td>
					</tr>

				</table>



			</form>



		</div>
	</div>
		<%@include file="../Footer.jsp"%>
</body>

</html>