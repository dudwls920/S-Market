<%@page import="com.shop.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Event</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="/control/resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
<!--게시판css-->

.main {   
  -ms-flex: 70%; /* IE10 */
  flex: 70%;
  background-color: white;
  padding: 20px;
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

.eventgesipan .pagination {
		margin: 10px 0 0 45%;
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
.eventgesipan .pagination a.active {
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.eventgesipan .pagination a:hover:not (.active ) {
	background-color: #ddd;
}
@media ( max-width :1100px) {
	.eventgesipan .pagination {
		margin: 10px 0 0 41%;
	}
}
/*eventgesipan css*/
.egtop{
	margin:20px;
}
.egtitle{
	color:#04AA6D;
	margin: 20px 20px 20px 0px;
	font-size: 30px;
	width: 100%;
	height: auto;
	border-bottom: black solid 1px;
}
.egSelect{
	border:black solid 1px;
}

</style>
<SCRIPT>
	var result = '${msg}';

	if (result == 'success') {
		alert("처리되었습니다");
	}
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							alert("eventmain" + '${pageMaker.makePage(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val());

							self.location = "eventmain" + '${pageMaker.makePage(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						})

				$('.writeBtn').on("click", function(event) {
					location.href = "/control/eventgesipan/eventwrite";
				});
				$('#newBtn').on("click", function(event) {
					self.location = "write";
				});

			});
</SCRIPT>
</head>
<body>

	<%@include file="../Header.jsp"%>
<!-- header section ends 페이지최상단종료 -->

	<!-- home section starts 페이지중단시작  -->

	<!-- category section starts  -->

	<div class="main">
		<p class="egtitle">&nbsp;&nbsp;<a class="fas fa-gift"></a>&nbsp;이벤트&nbsp;<a class="fas fa-gift"></a></p>
		<div class="egtop">
			<button style="width:40px; height:20px; font-size:12px; border-radius: 5px;	background-color: #4CAF50;color: white;	border: 1px solid #4CAF50;" class='writeBtn'>글쓰기</button>
		</div>
		<table class='customers' style="width:100%" border="1">
			<tr>
				<th style="width: 70px; text-align:center;">글번호</th>
				<th style="text-align:center;">제목</th>
				<th style="width: 100px; text-align:center;">작성자</th>
				<th style="width: 200px; text-align:center;">작성날짜</th>
				<th style="width: 70px; text-align:center;">조회수</th>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td style="text-align:center;'">${dto.bno}</td>
					<td><a href="/control/eventgesipan/eventreadA${pageMaker.makeSearch()}&bno=${dto.bno}">${dto.title}</a></td>
					<td style="width: 100px; text-align:center;">${dto.id}</td>
					<td style="width: 200px; text-align:center;"><fmt:formatDate
							pattern="yyyy-MM-dd HH:mm" value="${dto.regdate}" /></td>
					<td style="text-align:center;">${dto.viewcnt }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="eventgesipan">
		<div class="pagination">
			<c:if test="${pageMaker.page !=1}">
				<a href='eventmain${pageMaker.makeSearch(1)}'>&laquo;</a>
			</c:if>
			<c:if test="${EventpageMaker.prev }">
				<a href='eventmain${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage}" var="idx">
				<a href='eventmain${pageMaker.makeSearch(idx)}'
					<c:out value="${pageMaker.page==idx?' class=active ':'' }"/>>
					${idx}</a>
			</c:forEach>

			<%--<a href='#'>1</a>
    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
    	<a href='#' class="active">3</a> --%>

			<c:if test="${pageMaker.next }">
				<a href='eventmain${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a>

			</c:if>


			<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
				<a href='eventmain${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a>
			</c:if>
			</div>

		</div>

	</div>
<br>
<div style="float:left; width:100%;">
   <%@include file="../Footer.jsp"%>
</div>
</body>

</html>

