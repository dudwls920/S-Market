<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>complete responsive grocery website design tutorial</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/control/resources/css/style.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	<link rel="stylesheet" href="/control/resources/css/style.css">
	<link rel="stylesheet" href="/control/resources/css/cart.css">
	<script src="/control/resources/jquery/jquery-3.3.1.min.js"></script>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

</head>
<body>

	<%@include file="Header.jsp"%>
<!-- header section ends 페이지최상단종료 -->
	<div class="clear"></div>

	
		<div id="tkdtp">
		<h1 class="heading">
			<span>장바구니</span>
		</h1>
	</div>

	<div class="carttable">

		<table class="carttable2" style="background-color: #27ae60;">
			<caption>표 제목 부분</caption>
			<tbody>

				<tr>
					<th class="td_width_1">
						<!-- 체크박스 전체 여부 -->
						<div class="allCheck">
							<input type="checkbox" name="allCheck" class="allCheck2" checked="checked">
							<script>
								$(".allCheck2").click(function(){
								 var chk = $(".allCheck2").prop("checked");
								 if(chk) {
								  $(".chBox").prop("checked", true);
								 } else {
								  $(".chBox").prop("checked", false);
								 }
								});
							</script>
						</div>
					</th>
					<th class="td_width_3">상품이미지</th>
					<th class="td_width_3">상품명</th>
					<th class="td_width_2">가격</th>
					<th class="td_width_2">수량</th>
					<th class="td_width_2">가격총합</th>
					<th class="td_width_1">삭제</th>
				</tr>
			</tbody>
		</table>
		<c:forEach items="${cartList}" var="cartList">
		<table class="cart_table">
			<caption>표 내용 부분</caption>
			
			<tbody>
					<tr>
						<td class="td_width_1">
							<div class="checkBox">
								<input type="checkbox" name="chBox" class="chBox" checked="checked" data-cartNum="${cartList.cartNum}"/>
									<script>
										 $(".chBox").click(function(){
										  	$(".allCheck2").prop("checked", false);
										 });
									</script>
							</div>
						</td>
						
						<td class="td_width_3"><img src="resources\img${cartList.productimage}" style="width:100px; height:100px;"></td>
						<td class="td_width_3">${cartList.productname}</td>
						<td class="td_width_2">
							<fmt:formatNumber pattern="###,###,###" value="${cartList.productprice}"/>원
						</td>
						<td class="td_width_2"><fmt:formatNumber value="${cartList.cartStock}"/>개</td>
						<td class="td_width_2">
							<fmt:formatNumber pattern="###,###,###" value="${cartList.productprice*cartList.cartStock}"/>원
						</td>
						<td class="td_width_1">
							<div class="delete">
								<button type="button" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">x</button>
								 	<script>
									 $(".delete_${cartList.cartNum}_btn").click(function(){
									  var confirm_val = confirm("정말 삭제하시겠습니까?");
									  
									  if(confirm_val) {
									   var checkArr = new Array();
									   
									   checkArr.push($(this).attr("data-cartNum"));
									              
									   $.ajax({
									    url : "/control/deleteCart",
									    async : false,
									    type : "post",
									    data : { chbox : checkArr },
									    success : function(result){
									     if(result == 1) {            
									      location.href = "/control/cartList";
									     } else {
									      alert("삭제 실패");
									     }
									    }
									   });
									  } 
									 });
									</script>
							</div>
						</td>
					</tr>				
			</tbody>
		</table>
		<script>
			function setTotal(){
				$(".checkBox").each(function(index, element){
					if($(element).find(".chBox").is(":checked") === true){
						
					}
				});
			}
		</script>
		<c:set var="sum" value="${sum + (cartList.productprice * cartList.cartStock)}" />
		</c:forEach>
	</div>
	<div class="totalprice">
		<div class="totalprice2">
			<table>
				<tr>
					<td>
						<table>
							<tbody>
								<tr>
									<td><strong>총 결제 금액</strong></td>
									<td>
									<div class="listResult">
										 <div class="sum">
										  총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
										 </div>
									</div>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	
	<!-- 구매 버튼 영역 -->
	<div class="order1">
		<c:forEach items="${cartList}" var="cartList">
			<input type="hidden" class="ocount" value="${cartList.productnum}" />
			<input type="hidden" class="ocount2" value="${cartList.cartStock}" />
			<input type="hidden" class="ocount3" value="${cartList.productprice*cartList.cartStock}" />
		</c:forEach>	
		<button type="button" class="btn1">선택삭제</button>
		<button type="button" class="btn2">구매하기</button>
		<script>
			 $(".btn1").click(function(){
			  var confirm_val = confirm("정말 삭제하시겠습니까?");
			  
			  if(confirm_val) {
			   var checkArr = new Array();
			   
			   $("input[class='chBox']:checked").each(function(){
			    checkArr.push($(this).attr("data-cartNum"));
			   });
			    
			   $.ajax({
				   url : "/control/deleteCart",
				   type : "post",
				   data : { chbox : checkArr },
				   success : function(result){
				    if(result == 1) {          
				     location.href = "/control/cartList";
				    } else {
				     alert("삭제 실패");
				    }
				   }
				  });
			  } 
			 });
			 
			 $(".btn2").click(function(){
				  var ordernum = 1;
				  var id = 'ADMIN';
				  var payname  = "신용카드";
				  var productnum = $(".ocount").val();
				  var ordercount = $(".ocount2").val();
				  var orderprice = $(".ocount3").val();
				  
				  var data = {
					ordernum : ordernum,
					id : id,
					payname : payname,
					productnum : productnum,
					ordercount : ordercount,
					orderprice : orderprice,
				    };
				  
				  var all_urls = ['/control/cartList/addOrder','/control/cartList/addOrdert'];
				  
				  $.each(all_urls, function(i,u){ 
				  $.ajax(u,{
				   type : "post",
				   data : data,
				   success : function(result){
				    
				   if( result == 1 ) {
					     $(".ocount").val("1");
					     location.href='/control/mypage/mypage1';
					    } else {
					     $(".ocount").val("1");
					    }
					   },
					   error : function(){
						   alert("실패.")
					   }
					  });
				  		})
					 });
			</script>
	</div>


	<!-- footer section starts  -->

	<%@include file="Footer.jsp"%>

	<!-- footer section ends -->


</body>
</html>