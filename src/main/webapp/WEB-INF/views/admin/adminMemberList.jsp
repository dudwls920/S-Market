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
	width: 120px;
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

.product .pagination a:hover:not(.active) {
background-color: #ddd;
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
<!-- header section ends 페이지최상단종료 -->
	<div class="outline">

		<div class="sidebar">
			<a>회원관리페이지입니다.</a> 
			<a href='adminProduct'><i class="fas fa-caret-right"></i>&nbsp;&nbsp;&nbsp;상품등록</a>
			<a href='adminOrder'><i class="fas fa-caret-right"></i>&nbsp;&nbsp;&nbsp;주문관리</a> 
			<a href='adminMemberList'><i class="fas fa-caret-right"></i>&nbsp;&nbsp;&nbsp;회원관리</a>
		</div>

		<div class="adminmain">
			<br>
			<h3 style="margin-left: 600px">회원리스트</h3>
			<br>
		
			<div class="productTable">
				<table>
					<tr>
						<th>ID</th>
						<th>PW</th>
						<th>이름</th>
						<th>생년월일(년)</th>
						<th>생년월일(월)</th>
						<th>생년월일(일)</th>
						<th>성별</th>
						<th>이메일</th>
						<th>주소</th>
						<th>핸드폰</th>
						<th>삭제</th>
					</tr>
					<c:forEach items="${MemberList}" var="member">
					
						<tr>
							<td>${member.id}</td>
							<td>${member.pw}</td>
							<td>${member.membername}</td>
							<td>${member.year}</td>
							<td>${member.month}</td>
							<td>${member.day}</td>
							<td>${member.gender}</td>
							<td>${member.email}</td>
							<td>${member.address}</td>
							<td>${member.phonenum}</td>
							<td><a href="/control/admin/adminMemberRemove?id=${member.id}">삭제</></td>
						</tr>
					
					</c:forEach>


				</table>
				
				<div class="pagination">
					<c:if test="${pageMaker.page !=1}">
						<a href='adminMemberList${pageMaker.makeSearch(1)}'>&laquo;</a>
					</c:if>
					<c:if test="${pageMaker.prev }">
						<a
							href='adminMemberList${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage}" var="idx">
						<a href='adminMemberList${pageMaker.makeSearch(idx)}'
							<c:out value="${pageMaker.page==idx?' class=active ':'' }"/>>
							${idx}</a>
					</c:forEach>

					<%--<a href='#'>1</a>
    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
    	<a href='#' class="active">3</a> --%>

					<c:if test="${pageMaker.next }">
						<a href='adminMemberList${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a>
					</c:if>

					<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
						<a
							href='adminMemberList${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a>
					</c:if>

				</div>



			</div>

		</div>
	</div>
		<%@include file="../Footer.jsp"%>
</body>

</html>