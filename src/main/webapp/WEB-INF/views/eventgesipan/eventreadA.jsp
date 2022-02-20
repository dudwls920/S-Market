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
#eventtitle{
margin: 20px 0px 0px 50%;
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

		<form class="form" method="get">
			<input type='hidden' name='bno' value="${eventDTO.bno}"> <input
				type='hidden' name='page' value="${pageMaker.page}"> <input
				type='hidden' name='perPageNum' value="${pageMaker.perPageNum}">
			<input type='hidden' name='searchType'
				value="${pageMaker.searchType}"> <input type='hidden'
				name='keyword' value="${pageMaker.keyword}">
		</form>
		<h1 id="eventtitle">글 제목</h1>
			<input type="text" name='title' style="width: 100%;font-size:20px; font-weight:bolder; text-align:center;"
				value="${eventDTO.title}" readonly="readonly" >

		<h2>
			내용
					<div class="box">
						<img src="../resources/img/event/${eventDTO.image}.PNG" style="width:100%;">
					</div>
			</h2>
			<h2>
				<textarea class="read" name="content" rows="4"
					readonly="readonly">${eventDTO.content}</textarea>
			</h2>


					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" class="btnModify">수정</button>
						<button type="submit" class="btnRemove">삭제</button>
						<button type="submit" class="btnList">목록</button>
					</div>

					
					


<%-- 					<div id="reply">
					<ol class="replyList">
						<c:forEach items="${replyList}">
							<li>
							<p>
							작성자 : ${replyList.id}<br/>
							작성 날짜: <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
							</p><p>${replyList.content}</p>
							</li>
							
						</c:forEach>
					</ol>
					
					</div>  --%>

	</div>


	<!-- product section ends -->







	<%@include file="../Footer.jsp"%>
</body>
</html>