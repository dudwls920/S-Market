<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>MyPage</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/control/resources/css/style.css">
    
    <style type="text/css">
.mypage-box {
	display: flex;
	padding: 1rem 7%;
}

.mypage-box .sidebar {
	width: 15%;
	font-size: 17px;
}

.mypage-box .sidebar div {
	width: 100%;
	border: 1px solid #2B975A;
	text-align: center;
	padding: 20px 0px;
	background-color: #27ae60;
	color: #fff;
	font-weight: bold;
}

.mypage-box .sidebar div:hover {
	background-color: #2D9058;
	border: 1px solid #327642;
}

.mypage-box .sidebar .selected {
	background-color: #2D9058;
	border: 1px solid #327642;
}

.mypage-box .mypage-content {
	width: 100%;
	padding-left: 20px;
	padding-top: 20px;
	color: #2c2c54;
}
.mypage-content h4{
	font-size: 2rem;
}
.mypage-content table{
	font-size: 1.5rem;
	text-align: center;
}
.mypage-content table .info{
	display: flex;
    align-items: center;
}
.mypage-content table img{
	width: 100px;
	padding: 0px 10px;	
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

.customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #04AA6D;
  color: white;
}


.mypage-box .mypage-content hr {
	margin: 10px 0px 10px 0px;
}

/*pagination*/
.pagination {
	margin-top: 20px;
	display: flex;
    justify-content: center;
}

.pagination a {
	border-radius: 5px;
	color: black;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

@media ( max-width :1100px) {
	.product .pagination {
		margin: 10px 0 0 41%;
	}
}
.noorder{
	width: 100%;
	height: 200px;
	background-color: #f9f9f9;
	text-align: center;
    line-height: 200px;
    font-size: 20px;
    font-weight: 900;
}
</style>

</head>
<body>

	<%@include file="../Header.jsp"%>

<!-- header section ends 페이지최상단종료 -->

<!-- home section starts 페이지중단시작  -->
	<div class="mypage-box">
		<div class="sidebar">
			<a href="/control/mypage/mypage1">
				<div >주문내역</div>
			</a> <a href="/control/mypage/mypage2">
				<div class="selected">내가쓴글</div>
			</a> <a href="/control/mypage/mypage3">
				<div>회원정보수정</div>
			</a>
			</a> <a href="/control/mypage/mypage4">
				<div>회원탈퇴</div>
			</a>
		</div>
		<div class="mypage-content">
			<h4>
				<div style="width: 5px; height: 25px; background-color: #27ae60; display: inline-block; vertical-align: bottom;">
				</div>
				내가쓴글
			</h4>
			<hr>
			
<!-- 내가쓴글 테이블 -->
			
			<table class='customers' width=100% border="1">
			<tr>
				<th style="width: 80px">글번호</th>
				<th>제목</th>
				<th style="width: 100px">작성자</th>
				<th style="width: 200px">작성날짜</th>
				<th style="width: 80px">조회수</th>
			</tr>
			
			<c:forEach items="${mypost}" var="dto">
				<tr>
					<td style="width: 10px">${dto.bno}</td>
					<td><a href="/control/usergesipan/usergesipanread${pageMaker.makeSearch()}&bno=${dto.bno}">${dto.title}</a></td>
					<td style="width: 100px">${dto.id}</td>
					<td style="width: 200px"><fmt:formatDate
							pattern="yyyy-MM-dd HH:mm" value="${dto.regdate}" /></td>
					<td style="width: 40px">${dto.viewcnt }</td>
				</tr>
				
			</c:forEach>
		</table>
		
		<c:if test="${empty mypost}">
				<div class="noorder">
					작성한 글이 없습니다.
				</div>
			
		</c:if>
			
		<div class="pagination">
    	<c:if test="${pageMaker.page !=1}">
    		<a href='mypage2${pageMaker.makeSearch(1)}'>&laquo;</a>
    	</c:if>
    	<c:if test="${pageMaker.prev }">
    		<a href='mypage2${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
    	</c:if>
    	
    	<c:forEach begin="${pageMaker.startPage }" end="${ pageMaker.endPage}" var="idx">
    		<a href='mypage2${pageMaker.makeSearch(idx)}' 
    		 <c:out value="${pageMaker.page==idx?' class=active ':'' }"/> >
    		 ${idx}</a>
    	</c:forEach>
    	
    	<%--<a href='#'>1</a>
    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
    	<a href='#' class="active">3</a> --%>
    	
    	<c:if test="${pageMaker.next }">
    		<a href='mypage2${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a>
    	</c:if>
    	
    	
    	<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
    		<a href='mypage2${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a>
    	</c:if>
    	
    </div>
		</div>
		</div>
		


	<!-- footer section starts  -->

	<%@include file="../Footer.jsp"%>

<!-- footer section ends -->

</body>
</html>