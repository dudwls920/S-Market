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

        <!-- custom css file link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="/control/resources/css/signUp.css">
        <link rel="stylesheet" href="/control/resources/css/style.css">
     <!-- script link  -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="/control/resources/jquery/jquery-3.4.1.js"></script>
    <script src="/control/resources/jquery/memberModify.js"></script>
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
</style>

</head>
<body>

	<%@include file="../Header.jsp"%>

<!-- home section starts 페이지중단시작  -->



<!-- 수정정보 -->

	<div class="mypage-box">
		<div class="sidebar">
			<a href="/control/mypage/mypage1">
				<div>주문내역</div>
			</a> <a href="/control/mypage/mypage2">
				<div>내가쓴글</div>
			</a> <a href="/control/mypage/mypage3">
				<div>회원정보수정</div>
			</a>
			</a> <a href="/control/mypage/mypage4">
				<div class="selected">회원탈퇴</div>
			</a>
			
		</div>
		<div class="mypage-content">
			<h4>
				<div style="width: 5px; height: 25px; background-color: #27ae60; display: inline-block; vertical-align: bottom;">
				</div>
				계정삭제
			</h4>
			<hr>

<div style="width:500px; height:500px; margin-left:30%">
<div id="wrapper">
 <form action="" method="post">
<!--아이디-->
    <div id="content2">
        <h3 class="join_title"><label for="id">아이디</label></h3>
        
        
        <div id="idDDiv">
            <div id="idDiv">                
                <span class="box1 int_id" >
                <input type="text" required="required" id="userId" name="id" class="int" maxlength="20" value="${memberDTO.id}" readonly>  
                <span class="step_url">@shopping.com</span>
                </span>         
            	</div>
            </div>
        
<!--이름-->          
        <div>
            <h3 class="join_title"><label for="membername">이름</label></h3>
            <span class="box1 int_name">
                <input type="text" name="membername" class="int" maxlength="20" value="${memberDTO.membername}" readonly>
            </span>
            <span class="error_next_box"></span>
        </div>
   <div class="btn_area">
    <input type="submit" class="memberRemove" id="memberRemoveForm" value="탈퇴하기">
    		</div>
    	</div>
    </form>
	</div>
    </div>
 </div>
 </div>

	<!-- footer section starts  -->
	
	
	<%@include file="../Footer.jsp"%>

<!-- footer section ends -->

</body>
</html>