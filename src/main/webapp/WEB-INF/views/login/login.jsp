<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<title>Login</title>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>complete responsive grocery website design tutorial</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/control/resources/css/style.css">
    <link rel="stylesheet" href="/control/resources/css/login.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script>
	var msg = "${msg}";
	
	if(msg == 'success'){
		alert('성공');
	}else if(msg == 'fail'){
		alert('실패');
	}

</script>
</head>
<body>

	<%@include file="../Header.jsp"%>

<!-- home section starts 페이지중단시작  -->
<form action="" method="post">
<div class="main">
		<header>
			<h1><big>로그인</big></h1>
		</header>

		<section class="login-wrap">

			<div class="login-id-wrap">
				<input placeholder="아이디" type="text" class="input-id" name="id"></input>
			</div>
			<div class="login-pw-wrap">
				<input placeholder="비밀번호" type="password" class="input-pw" name="pw"></input>
			</div>
			<div class="login-under">
					
			</div>
			<div class="login-btn-wrap">
				<button class="login-btn">로그인</button>
			</div>
			
		</section>	
			</div>
		</section>

		<section class="find-signup-wrap" style="padding : 0px;">

			<span class="find-id">
				<a href="#a" target="_blank"
					title="아이디 찾기">아이디 찾기</a>
			</span>

			<span class="find-pw">
				<a href="#a" target="_blank" title="비밀번호 찾기">비밀번호 찾기</a>
			</span>

			<span class="sign-up">
				<a href="/control/login/signUp" title="회원가입">회원가입</a>
            </span>
		</section>

	</div>
</form>
<!-- footer section starts  -->

	<%@include file="../Footer.jsp"%>

<!-- footer section ends -->


<!-- custom js file link  -->
<script src="js/script.js"></script>

    
</body>
</html>