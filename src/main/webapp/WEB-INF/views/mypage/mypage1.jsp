<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage</title>

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
    justify-content: space-between;
}
.mypage-content table img{
	width: 100px;
	height: 100px;
	padding: 0px 10px;	
}

/* table css*/
.customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

.customers tr td:not(td.noclick){
	cursor:pointer;
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

.info-div{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.order-cancel{
	border: 1px solid #dddddd;
	border-radius: 5px;
	background-color: #04AA6D;	
	color:white;
	padding: 5px;
	display: block;
}

.order-cancel:hover{
	font-weight: bolder;
	cursor: pointer;
	background-color: #2b975a;
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

	<script>
		
	$(document).ready(function(){

		// 주문을 클릭하면 해당 주문번호와 같은 주문인 상품들 토글
		$('.customers tr td:not(.noclick)').click(function(){
			
			var str = '.'+$(this).parent().attr("id");
			var leng = $(str).length;
			
			$(this).parent().parent().find('tr').not(str).find('div').slideUp(500);
			// 펼쳐져 있는 다른 tr 닫기

			if( $(str).find('div').css('display') === 'none' ){
				// 보여주기
				$(str).find('div').slideDown(500);
				
				//개수만큼 td 합치기 
				$(this).parent().find('td').not('.info').attr('rowspan',leng+1);
				
				//상품 정보 제외하고 숨기기
				$(str).find('td').not('.info').hide();
				
			}else{
				$(str).find('div').slideUp(500);
				// 숨기기
				
			}			
				
		})
			
	})
	
	function remove(ordernum){

			if (confirm("주문을 취소하시겠습니까?") == true){    //확인
				var link = "/control/mypage/remove?ordernum="+ordernum;
			    location.href = link;

			}else{   //취소

			    return;

			}
		}
	function cash(ordernum){

		if (confirm("결제 하시겠습니까?") == true){    //확인
			var link = "/control/mypage/cash?ordernum="+ordernum;
		    location.href = link;

		}else{   //취소

		    return;

		}
	}
			
	</script>

</head>
<body>
	<%@include file="../Header.jsp"%>

<!-- header section ends 페이지최상단종료 -->

<!-- home section starts 페이지중단시작  -->
	<div class="mypage-box">
		<div class="sidebar">
			<a href="/control/mypage/mypage1">
				<div class="selected">주문내역</div>
			</a> <a href="/control/mypage/mypage2">
				<div>내가쓴글</div>
			</a> <a href="/control/mypage/mypage3">
				<div>회원정보수정</div>
			</a>
			<a href="/control/mypage/mypage4">
				<div>회원탈퇴</div>
			</a>
		</div>
		<div class="mypage-content">
			<h4>
				<div style="width: 5px; height: 25px; background-color: #27ae60; display: inline-block; vertical-align: bottom;">
				</div>
				주문내역
			</h4>
			<hr>
			
<!-- 주문내역 테이블 -->

			<table class="customers" width="100%">
				<tr>
					<th style="width: 120px">날짜</th>
					<th>상품정보</th>
					<th style="width: 100px">가격</th>
					<th style="width: 100px">결제상태</th>
					<th style="width: 100px">배송정보</th>
					<th style="display: none"></th>
				</tr>
				<c:set var="prevOrdernum" value="0"/>
				<c:forEach items="${orderList}" var="dto">
				<fmt:parseNumber value="${prevOrdernum}" var="i" type="number"/>
					<c:if test="${dto.ordernum != i }">
					<tr id="orderid${dto.ordernum}" >
						<td>${dto.orderdate}</td>
						<td class="info">
						<span style="display: flex; align-items: center;">
						
							<img src="/control/resources\img${dto.productimage}"> ${dto.productname}</span>
						 <span>${dto.ordercount}개</span> 
						</td>
						<td><fmt:formatNumber value="${dto.orderprice}" type = "currency"/></td>
						<td>${dto.paycheck}</td>
						<td >${dto.delivery }</td>
						<td class="noclick" style="border: none; width: 100px;">
						<c:if test="${dto.paycheck eq 'X'}">
						<a class="order-cancel" onclick="cash(${dto.ordernum})">결제하기</a><br/>
						</c:if>
						<a class="order-cancel" onclick="remove(${dto.ordernum})">주문취소</a></td>
					</tr>
					</c:if>
					<c:if test="${dto.ordernum == i }">
					<tr class="orderid${dto.ordernum}">
						<td style="padding:0"><div style="display:none"></div></td>
						<td class="info noclick" style="padding:0px 8px">
						<div class="info-div" style="display: none;">
							<span style="display: flex; align-items: center;">
							<img src="/control/resources\img${dto.productimage}"> ${dto.productname}</span>
						 <span>${dto.ordercount}개</span>
						</div>
						</td>
						<td style="padding:0"><div style="display:none"></div></td>
						<td style="padding:0"><div style="display:none"></div></td>
						<td style="padding:0"><div style="display:none"></div></td>
						<td style="padding:0; border: none;"><div style="display:none"></div></td>
					</tr>
					
					</c:if>
					
					<fmt:parseNumber value="${dto.ordernum}" var="prevOrdernum" type="number"/>
				</c:forEach>
			</table>
			
			<c:if test="${empty orderList}">
				<div class="noorder">
					주문한 내역이 없습니다.
				</div>
			
			</c:if>
			
		</div>
	</div>



	<%@include file="../Footer.jsp"%>

<!-- footer section ends -->

</body>
</html>