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
	<link rel="stylesheet" href="/control/resources/css/style.css">
	<link rel="stylesheet" href="/control/resources/css/productdetail1.css">
	<script src="/control/resources/jquery/jquery-3.4.1.js"></script>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

</head>
<body>

	<%@include file="Header.jsp"%>
	<div class="clear"></div>

	<div class="table1">
		<h2>${view.productname}</h2>
		<table>
			<colgroup>
				<col style="width: 173px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th>판매가</th>
					<td class="price"><fmt:formatNumber
							value="${view.productprice}" pattern="#,###" />원</td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td>
					${view.productnum}
					<input type="hidden" class="vcount" value="${view.productnum}">
					</td>
				</tr>

				<tr>
					<th>구매수량</th>
					<td>
						<p class="tlength">
						 <button type="button" class="minus">-</button>
 						 <input type="number" class="numBox" min="1" max="10" value="1" readonly="readonly" style="width:55px;"/>
 						 <button type="button" class="plus">+</button>
 						 <script>
							$(".plus").click(function(){
							 var num = $(".numBox").val();
							 var plusNum = Number(num) + 1;
							
							 if(plusNum<=10){
								 $(".numBox").val(plusNum); 
							 } else {
								 $(".numBox").val(num); 
								 alert("최대 구매 수량을 초과하였습니다")
							 }
							             
							});
							
							$(".minus").click(function(){
							 var num = $(".numBox").val();
							 var minusNum = Number(num) - 1;
							 
							 if(minusNum <= 0) {
							  $(".numBox").val(num);
							 } else {
							  $(".numBox").val(minusNum);          
							 }
							});
						</script>
						</p>
					</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>무료배송</td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td>${view.productcontent}</td>
				</tr>
				<tr>
					<th>결재금액</th>
					<td class="total">
					<script>
					$(".plus").click(function(){
					 var num = $(".numBox").val();
					 var doubleNum = Number(num)*${view.productprice};
					 
					 $(".price1").val(doubleNum)
					});
					
					$(".minus").click(function(){
					var num = $(".numBox").val();
					var doubleNum = Number(num)*${view.productprice};
						 
					$(".price1").val(doubleNum)
					});
					</script>
					<b><input type="text" class="price1" value="${view.productprice}" style="font-size:19px; color:#0a56a9; width:95px"/>원</b>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="img">
			<img src="resources\img${view.productimage}"> 
		</div>
		<div class="tbtns">
			<button type="button" class="tbtn1">장바구니</button>
			<button type="button" class="tbtn2">구매하기</button>
			 <script>
				 $(".tbtn1").click(function(){
				  var productnum = "${view.productnum}";
				  var cartStock = $(".numBox").val();
				           
				  var data = {
					productnum : productnum,
				    cartStock : cartStock
				    };
				  
				  $.ajax({
				   url : "/control/view/addCart",
				   type : "post",
				   data : data,
				   success : function(result){
				    
				    if( result == 1 ) {
				     alert("카트 담기 성공");
				     $(".numBox").val("1");
				    } else {
				     alert("회원만 사용할 수 있습니다.")
				     $(".numBox").val("1");
				    }
				   },
				   error : function(){
				    alert("카트 담기 실패");
				   }
				  });
				 });
				 
				 $(".tbtn2").click(function(){
					  var ordernum = 1;
					  var id = 'ADMIN';
					  var payname  = "신용카드";
					  var productnum = $(".vcount").val();
					  var ordercount = $(".numBox").val();
					  var orderprice = $(".price1").val();
					  
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
						     $(".vcount").val("1");
						     location.href='/control/mypage/mypage1';
						    } else {
						     alert("회원만 사용할 수 있습니다.")
						     $(".vcount").val("1");
						    }
						   },
						   error : function(){
						   }
						  });
					  		})
						 });
			</script>						  
		</div>
	</div>

	<div class="clear"></div>


	<div id="tkdtp">
		<h1 class="heading">
			<span>제품 상세보기</span>
		</h1>
		<img src="resources\img${view.productimage}"> 
	</div>


	<!-- footer section starts  -->
		<%@include file="Footer.jsp"%>

	<!-- footer section ends -->


</body>
</html>