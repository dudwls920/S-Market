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
    <title>주문/결제</title>
<!-- custom css file link  -->
<link rel="stylesheet" href="/control/resources/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        *{
            margin: 0px;
            padding:0px;
        }
        .mainheader{
            margin : 30px 20px 0px 5%;
            width: 90%;
            font-size:30px;
            border-bottom: solid 3px gray;
        }
        .cart{
            width: 40%;
        }
        #buyitem{
            width: 50%;
            padding: 30px;
        }

        #thuse{
            font-size:24px;
            border-bottom: solid 1px gray;
        }

        button{
            width: 140px;
            font-size: 30px;
            background-color: #27AE60;
            color: white;
            margin-left: 15px;
        }

        #tduse{
            border-right: solid 1px gray;
            background-color: rgb(211, 225, 231);
            font-size: 20px;
            width:20%;
            text-align: center;
            border-bottom: solid 1px gray;
        }
        #tduse2{
            border-right: solid 1px gray;
            font-size: 20px;
            text-align: center;
            border-bottom: solid 1px gray;
        }
        .menuSelect{
            font-weight:bolder;
            font-size: 15px;
            text-align: center;
            width: 100px;
            border: solid  1px gray;
        }
        .textBox{
        	border : 1px solid;
        	font-size: 20px;
        	text-align: center;
        	width : 500px;
        }
        
        
        .buyinfo{
        display: flex;
    	align-items: stretch;
    	justify-content: center;
    }
    
    .cart{
    	margin-top: 30px;
    	border: 1px solid black;
    	border-radius: 10px;
    	font-size: 120%;
    }
    
    .cart div *{
    	margin: 10px;
    }
    .cart img{
    	width: 100px;
    }

	.orderlist{
		height:530px; 
		overflow-y: scroll;
		-ms-overflow-style: none;
	}
	.orderlist::-webkit-scrollbar{ 
		display:none;
	}
	
	.orderlist ~ div{
		display: flex; 
		justify-content: space-around; 
		align-items: center;
		margin:0;
	}

    </style>
    <script type="text/javascript">
        function dispList(selectList) {
            var obj1 = document.getElementById("sc1_list"); 
            var obj2 = document.getElementById("sc2_list"); 
            
            if( selectList == "0" ) { 
                obj1.style.display = "block";	
                obj2.style.display = "none";
                alert(	obj.style.display ) ;
            } else { 
                obj1.style.display = "none";
                obj2.style.display = "block";
            }
        }
        
        function pay(ordernum){
        	if (confirm("결제 하시겠습니까?") == true){    //확인
        		location.href = "/control/mypage/pay?ordernum="+ordernum;
			}else{   //취소
			    return;
			}
        }
        function cancel(ordernum){
        	if (confirm("결제를 취소하시겠습니까?") == true){    //확인
        		location.href = "/control/mypage/mypage1";
			}else{   //취소
			    return;
			}
        }
        
        
    </script>
    
</head>
<body>
	<!-- header section starts 페이지 최상단  -->

	<header>

		<div class="header-1">

			<a href="/control" class="logo"><i
				class="fas fa-shopping-basket"></i>S Market</a>

			<div class="icons">
				<a href="/control/cartList" class="fas fa-shopping-cart"></a>
            	<a href="/control/eventgesipan/eventmain" class="fas fa-gift"></a>
            	<a href="/control/mypage/mypage1" class="fas fa-user-circle"></a>
			</div>
            

		</div>

	</header>
    <!-- 주문/결제-->

        <div class="main">
           <div class="mainheader">
               &nbsp;&nbsp;<b>주문/결제</b>
           </div>
           
           <div class="buyinfo">
<table id="buyitem">
            <th id="thuse" colspan=2>
               구매자정보
            </th>
					<tr>
	
		                <td id="tduse">이름</td> <td id="tduse2">${memberDTO.membername}</td>
		            </tr>
		            <tr>
		
		                <td id="tduse">이메일</td> <td id="tduse2">${memberDTO.email}</td>
		            </tr>
		            <tr>
	
		                <td id="tduse">휴대폰 번호</td> <td id="tduse2">${memberDTO.phonenum}</td>
		            </tr>
<!-- ---------------------------------------------------------------------- -->

<th id="thuse" colspan=2>
    받는사람정보
</th>

<tr>
    
    <td id="tduse">이름</td> <td id="tduse2"><input class="textBox" type="text" value="${memberDTO.membername}"></td>
   
</tr>
<tr>
    
    <td id="tduse">배송주소</td> <td id="tduse2"><input class="textBox" type="text" value="${memberDTO.address}"></td>
    
</tr>
<tr>
    
    <td id="tduse">연락처</td> <td id="tduse2"><input class="textBox" type="text" value="${memberDTO.phonenum}"></td>
    
</tr>
<tr>
    
    <td id="tduse">배송 요청사항</td> <td id="tduse2">
    <select class="menuSelect" name="delivery" style="margin-bottom: 5px;">
        <option value="KEY1"><b>문 앞</b></option>
        <option value="KEY2"><b>경비실</b></option>
        <option value="KEY3"><b>택배함</b></option>
        <option value="KEY4"><b>기타사항</b></option>
    </select></td>
    
</tr>
<!-- ------------------------------------------------------------------------- -->

<th id="thuse" colspan=2>
    결제정보
</th>

<tr>
    
    <td id="tduse" style="height: 50px;">결제방법</td>
    <td id="tduse2" style="height: 50px;">
        <input type="radio" name="결제" id="sc1" onclick="dispList('0');" checked>실시간 계좌이체
        <input type="radio" name="결제" id="sc2" onclick="dispList('1');">신용/체크카드결제
        <div id="sc1_list" style="display:block">
            <input type="text" value="국민은행" readonly style="width: 80px; text-align: center; font-size: 16px; font-weight: bolder;">
            <input type="text" value="777823-01-526842" readonly style="width: 160px; text-align: center; font-size: 16px; font-weight: bolder; margin-bottom: 5px;">
        </div>
        <div id="sc2_list" style="display:none">
            <select class="menuSelect" name="delivery" style="width: 180px; margin-bottom: 5px;">
                <option value="KEY1">KB국민카드</option>
                <option value="KEY2">롯데카드</option>
                <option value="KEY3">신한카드</option>
                <option value="KEY4">하나카드</option>
                <option value="KEY5">BC카드</option>
                <option value="KEY6">삼성카드</option>
                <option value="KEY7">현대카드</option>
                <option value="KEY8">우리카드</option>
                <option value="KEY9">NH농협카드</option>
                <option value="KEY10">씨티카드</option>
                <option value="KEY11">카카오뱅크카드</option>
                <option value="KEY12">기타(은행/증권)카드</option>
            </select>
            <input type="text" style="width: 50px;" maxlength='4'> -
            <input type="text" style="width: 50px;" maxlength='4'> -
            <input type="text" style="width: 50px;" maxlength='4'> -
            <input type="text" style="width: 50px;" maxlength='4'>
        </div>
    </td>
    
</tr>
</table>
           
           <div class="cart">
           	<div>
           		<h1>주문상품</h1>
           		<hr/>
           		<div class="orderlist">
	           	<c:forEach items="${cashOrderList}" var="list">
	           	<div style="display:flex;">
	           	
	           		<div>
	           		
	           		<img src="/control/resources/img${list.productimage}">
	           		</div>
	           		<div>
	           		<h2>${list.productname}</h2>
	           		<h4 style="color:gray">${list.productcontent}</h4>
	           		<h3><fmt:formatNumber value="${list.orderprice}" type = "currency"/> / ${list.ordercount}개</h3>
	           		</div>
	           	</div>
	           	<hr/>
	           	</c:forEach>
	           	</div>
	           	<div style="color: gray;">
	           		<h3>상품금액</h3>
	           		<h3><fmt:formatNumber value="${cashOrderList[0].amount_orderprice}" type = "currency"/></h3>
	           	</div>
	           	<div style="color: gray;">
	           		<h3>+ 배송비</h3>
	           		<h3>₩2,500</h3>
	           	</div>
	           	<div style="display: flex; justify-content: space-around; align-items: center;">
	           		<h2>총 결제금액</h2>
	           		<h1><fmt:formatNumber value="${cashOrderList[0].amount_orderprice+2500}" type = "currency"/></h1>
	           	</div>
           	</div>
        	


           </div>
  
       </div>
        
        
           
        <div style="margin: 20px 0px 20px 39%">
            <button id="paybtn" onclick="pay('${cashOrderList[0].ordernum}')">결제</button>
            <button id="cancelbtn" onclick="cancel('${cashOrderList[0].ordernum}')">취소</button>
        </div>
       

        </div>
<!-- footer section starts  -->

	<%@include file="Footer.jsp"%>
<!-- footer section ends -->

 

    
</body>
</html>