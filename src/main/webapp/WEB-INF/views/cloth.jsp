<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cloth</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="/control/resources/css/style.css">
<script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							alert("list" + '${pageMaker.makePage(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val());

							self.location = "list" + '${pageMaker.makePage(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						})

				$('.writeBtn').on("click", function(event) {
					location.href = "/ex/sboard/write";
				});
				$('#newBtn').on("click", function(event) {
					self.location = "write";
				});

			});
</script>

<style>
.product .pagination {
	display: inline-block;
	margin: 10px 0 0 45%;
}

.product .pagination a {
	border-radius: 5px;
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

.product .pagination a.active {
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.product .pagination a:hover:not (.active ) {
	background-color: #ddd;
}

@media ( max-width :1100px) {
	.product .pagination {
		margin: 10px 0 0 41%;
	}
}
img{
	width : 200px;
	height : 200px;
}
</style>
</head>
<body>


	<%@include file="Header.jsp"%>

<!-- header section ends 페이지최상단종료 -->

	<!-- home section starts 페이지중단시작  -->

	<!-- category section starts  -->
	<section class="category" id="category">

		<h1 class="heading">
			제일 잘나가는상품</span>
		</h1>

		<div class="box-container">
			<c:forEach items="${ProductBestSales}" var="best">
				<div class="box">
					<h3>${best.productname}</h3>
					<img src="resources\img${best.productimage}">
					<a href="/control/productdetail?productnum=${best.productnum}" class="btn">Shop Now</a>
				</div>
			</c:forEach>



		</div>

	</section>


	<section class="product" id="product">

		<h1 class="heading">
			latest <span>products</span>
		</h1>

		<div class="box-container">

			<c:forEach items="${list}" var="product">
				<c:if test="${product.productkind == 'cloth' }">
					<div class="box">
						<img src="resources\img${product.productimage}">
						<h3>${product.productname}</h3>
						<div class="price"><fmt:formatNumber value="${product.productprice}"/>원</div>

						<a href="/control/productdetail?productnum=${product.productnum}" class="btn">Shop Now</a>
					</div>
				</c:if>
			</c:forEach>

		</div>
		<!-- 페이징 -->
		<div class="pagination">
			<c:if test="${pageMaker.page !=1}">
				<a href='cloth${pageMaker.makeSearch(1)}'>&laquo;</a>
			</c:if>
			<c:if test="${pageMaker.prev }">
				<a href='cloth${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${ pageMaker.endPage}" var="idx">
				<a href='cloth${pageMaker.makeSearch(idx)}'
					<c:out value="${pageMaker.page==idx?' class=active ':'' }"/>>
					${idx}</a>
			</c:forEach>

			<%--<a href='#'>1</a>
    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
    	<a href='#' class="active">3</a> --%>

			<c:if test="${pageMaker.next }">
				<a href='cloth${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a>
			</c:if>

			<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
				<a href='cloth${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a>
			</c:if>

		</div>


	</section>
	<!-- product section ends -->






<!-- footer section starts  -->

	<%@include file="Footer.jsp"%>

<!-- footer section ends -->






</body>
</html>

