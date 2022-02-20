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
				<div class="selected">회원정보수정</div>
			</a>
			</a> <a href="/control/mypage/mypage4">
				<div>회원탈퇴</div>
			</a>
		</div>
		<div class="mypage-content">
			<h4>
				<div style="width: 5px; height: 25px; background-color: #27ae60; display: inline-block; vertical-align: bottom;">
				</div>
				내정보수정
			</h4>
			<hr>

<div style="width:500px; height:980px; margin-left:30%">
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
                <label id="labelId"></label>             
            </div>
             <button type="button" class="idCheck" disabled="disabled" id="idCheck">ID 중복검사</button>  
            <br>
            </div>
        
<!--비밀번호-->
        <div>
            <h3 class="join_title"><label for="pw">비밀번호</label></h3>
            <span class="box1 int_pass"><input type="password" value="${memberDTO.pw}"required="required" id="userPw" name="pw" class="int" maxlength="20">
                <span id="alertTxt">사용불가</span>    
            <img src="../resources/img/lock.png"  id="pswd1_img1" class="pswdImg">
            <br>
            <label id="labelPw"></label>
        </span>
        <span class="error_next_box"></span>
        </div>
<!--비밀번호재확인-->
        <br>
        <div>
            <h3 class="join_title"><label for="pw1">비밀번호 재확인</label></h3>
            <span class="box1 int_pass_check">
                <input type="password" value="${memberDTO.pw}"required="required" id="userPwCheck" name="userPwCheck" class="int" maxlength="20">
                <img src="../resources/img/unlock.png" id="pswd2_img1" class="pswdImg">
                <br>
                <label id="labelPwCheck"></label>                    
            </span>
            <span class="error_next_box"></span>
        </div>
<!--이름-->
        <br>            
        <div>
            <h3 class="join_title"><label for="membername">이름</label></h3>
            <span class="box1 int_name">
                <input type="text" name="membername" class="int" maxlength="20" value="${memberDTO.membername}">
            </span>
            <span class="error_next_box"></span>
        </div>

<!--생년월일-->
        <h3><label for="yy">생년월일</label></h3>
<div id="bir_wrap">
           <div id="bir_yy">
               <span class="box1">
                   <input type="text" name="year" value="${memberDTO.year}" readonly="readonly" class="int" maxlength="4" placeholder="년(4자)">
               </span>
           </div>
            <div id="bir_mm">
               <span class="box1">
                   <input type="text" name="month" value="${memberDTO.month}" readonly="readonly" class="int" maxlength="4" placeholder="월">
               </span>
           </div>
            <div id="bir_dd">
               <span class="box1">
                   <input type="text" name="day" class="int" value="${memberDTO.day}" readonly="readonly" maxlength="4" placeholder="일">
               </span>
           </div>
              </div>
<!--성별-->
    <div>
        <h3 class="join_title"><label for="gender">성별</label></h3>
        <span class="box1 gender_code">
                <input type="text" name="gender" class="int" value="${memberDTO.gender}" readonly>
        </span>
        <span class="error_next_box">필수 정보 입니다.</span>
    </div>
<!--email-->
    <div>
        <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional"></span></label></h3>
        <span class="box1_int_email">
            <input type="text" required="required" id="userEmail" name="email" value="${memberDTO.email}"class="int" maxlength="90" style="width : 100%;">
            <label id="labelEmail"></label>
        </span>
        <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
    </div>
<!--주소-->            
        <div>
            <h3 class="join_title"><label for="address">주소</label></h3>
            <span class="box1 int_name">
                <input type="text" name="address" value="${memberDTO.address}" class="int" maxlength="150">
            </span>
            <span class="error_next_box"></span>
        </div>
<!--휴대전화-->
    <div>
        <h3 class="join_title"><label for="phonenum">휴대전화</label></h3>
        <span class="box1 int_mobile">
            <input type="text" name="phonenum" value="${memberDTO.phonenum}" class="int" maxlength="16">
        </span>
        <span class="error_next_box"></span>
    </div>

<div class="btn_area">
    <input type="submit" class="submit" id="signinForm" value="수정하기">
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