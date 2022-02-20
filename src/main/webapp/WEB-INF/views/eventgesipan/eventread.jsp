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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		var fObject = $(".form");

		$(".btnList").on("click", function() {

			fObject.attr("method", "get");
			fObject.attr("action", "/control/eventgesipan/eventmain");
			fObject.submit();

		})
		$(".btnRemove").on("click", function() {
			fObject.attr("action", "/control/eventgesipan/eventremove");
			fObject.submit();
		})
		$(".btnModify").on("click", function() {
			fObject.attr("method", "get");
			fObject.attr("action", "/control/eventgesipan/eventmodify");
			fObject.submit();
		})
	});
</script>

<style>
table {
	width : 70%;
	margin-left: auto;
	margin-right: auto;
}

tr th {
	height: 50px;
	text-align: center;
	border-bottom: solid 1px #ddd;
	font-size: 15px;
}

tr td {
	border-bottom: solid 1px #ddd;
	height: 50px;
}

.main h1 {
	width:70%;
	margin-left: auto;
	margin-right: auto;
	border-bottom : 1px solid #ddd;
	padding : 11px;
}

.main .reply {
	width : 70%;
	margin-left: auto;
	margin-right: auto;
}
.main .replyinsert{
	width : 70%;
	margin-left: auto;
	margin-right: auto;
}
.main .box-footer{
	padding : 5px;
	width : 70%;
	margin-left: auto;
	margin-right: auto;
}
ol {
background-color : #ddd;
border-bottom : 1px #c8c8c8 solid; 
}

ol p {
padding : 10px;
}

ol p a {
margin-left : 95%;
cursor: pointer;
}

.read{
resize: none;
-ms-overflow-style: none;
border: none;
width: 100%;
font-size:14px;
text-align:center;
}
	.read::-webkit-scrollbar{ 
		display:none;
	}
</style>
</head>
<body>
	<%@include file="../Header.jsp"%>
<!-- header section ends 페이지최상단종료 -->

	<!-- home section starts 페이지중단시작  -->

	<!-- category section starts  -->

	<div class="main">
  
		<form class="form" method="post">
							<input type='hidden' name='bno' value="${eventDTO.bno}"> 
							<input type='hidden' name='page' value="${pageMaker.page}"> 
							<input type='hidden' name='perPageNum' value="${pageMaker.perPageNum}">
							<input type='hidden' name='searchType' value="${pageMaker.searchType}">
							<input type='hidden' name='keyword' value="${pageMaker.keyword}">
		</form>
		
		<h1>Event</h1>
		<table>
			<tr>
				<th>${eventDTO.title}</th>
			</tr>
			<tr>
				<td>작성자:${eventDTO.id}</td>
			</tr>
			<tr>
				
				<td style="height:100%;">
				<img src="../resources/img/event/${eventDTO.image}.PNG" alt="" style="width:100%;">
				<textarea class="read" name="content" rows="4"
					readonly="readonly">${eventDTO.content}</textarea>
				</td>
			</tr>
		</table>
		
			<div class="box-footer">
				<button type="submit" class="btnList">목록</button>
			</div>

			<br><br><br>
		
	</div>
<%-- 					<br>
					<div id="reply">
					<ol class="replyList">
					<c:forEach items="${replyList}" var="item">
					작성자 : ${item.id}<br/>
					작성 날짜: <fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd" />
							<p>${item.content}</p>
							
						</c:forEach>
					</ol>
					
					</div>  --%>
					
					

	<!-- product section ends -->







	<!-- footer section starts  -->

	<%@include file="../Footer.jsp"%>
</body>
</html>