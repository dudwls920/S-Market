<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A수정</title>
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
			fObject.attr("action", "/control/usergesipan/usergesipanmain");
			fObject.submit();

		})
		$(".btnSave").on("click", function() {
			fObject.attr("method", "post");
			fObject.attr("action", "/control/usergesipan/usergesipanmodify");
			fObject.submit();
		})

	});
</script>
<style>
	table {
	width : 50%;
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
	width:50%;
	margin-left: auto;
	margin-right: auto;
	border-bottom : 1px solid #ddd;
	padding : 11px;
}
	
</style>
</head>
<body>

	<%@include file="../Header.jsp"%>
	
	<div class="main">

		<form class="form" method="post">

			<input type='hidden' name='bno' value="${userGesipanDTO.bno}"> <input
				type='hidden' name='page' value="${pageMaker.page}"> <input
				type='hidden' name='perPageNum' value="${pageMaker.perPageNum}">
			<input type='hidden' name='searchType'
				value="${pageMaker.searchType}"> <input type='hidden'
				name='keyword' value="${pageMaker.keyword}">

<h1>수정</h1>
		<table>
			<tr>
				<th><input type="text" name='title' style="width: 100%"
					value="${userGesipanDTO.title}"></th>
			</tr>
			<tr>
				<td><textarea style="width: 100%" name="content" rows="20">${userGesipanDTO.content}</textarea></td>
			</tr>
			<tr>
				<td style="height:50px;"><input type="text" name="id" style="width: 100%"
					value="${userGesipanDTO.id}"></td>
			</tr>
			<tr>
				<td>
					<div class="box-footer">
						<button type="submit" class="btnSave">저장</button>
						<button type="submit" class="btnCancel">취소</button>
					</div>
				</td>
			</tr>
		</table>
			
		</form>
		<!-- /.box-body -->
		
	</div>
	
	<%@include file="../Footer.jsp"%>
	
</body>
</html>