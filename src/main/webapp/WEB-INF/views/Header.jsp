<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String id=(String)session.getAttribute("id"); 
String auth=(String)session.getAttribute("authority");
String num= "1";
%>
<!-- header section starts 페이지 최상단  -->
<header>
	<script>
	$(document).ready(function() {
		var fObject = $(".form");

		$(".searchBtn").on("click", function() {

			fObject.attr("method", "get");
			fObject.attr("action", "/control/search");
			fObject.submit();

		});
	</script>
	
	

    <div class="header-1">

        <a href="/control" class="logo"><i class="fas fa-shopping-basket"></i>S Market</a>
        
        <form name="search" action="/control/search" class="search-box-container" method="get">
            <input type="text" name="keyword" id="search-box" value="${pageMaker.keyword}" placeholder="search here...">
            <button type="submit" class="searchBtn" style="border:none;"><label for="search-box" class="fas fa-search"></label></button>
        </form>

        <div class="icons">
            <a href="/control/cartList" class="fas fa-shopping-cart"></a>
            <a href="/control/eventgesipan/eventmain" class="fas fa-gift"></a>
            <a href="/control/mypage/mypage1?id=<%=id%>" class="fas fa-user-circle"></a>
        </div>


    </div>

    <div class="header-2">

        <div id="menu-bar" class="fas fa-bars"></div>

        <nav class="navbar">
            <a href="/control/appliances"><b>가전제품</b></a>
            <a href="/control/cloth" style="margin-left: 10px;"><b>의류</b></a>
            <a href="/control/food" style="margin-left: 10px;"><b>식품</b></a>
            <a href="/control/sports" style="margin-left: 10px;"><b>스포츠</b></a>
        </nav>
        <div class="login">
            <%if(id==null){ %>
            <a href="/control/login/login">로그인 </a>&puncsp;
            <a href="/control/login/signUp"> 회원가입 </a>&puncsp;
            <%}else{ %>
            <%	if(auth.equals(num)){ %>
            <a href="/control/admin/adminMemberList"> 관리자 페이지 </a>&puncsp;
            <span style="font-size: 14px"><%=id%> 님 </span>&nbsp; &nbsp; 
            <a href="/control/login/logout">로그아웃 </a>&puncsp;
            <%	}else{ %>
            <span style="font-size: 14px"><%=id%> 님 </span>&nbsp; &nbsp; 
            <a href="/control/login/logout">로그아웃 </a>&puncsp;                       
            <%	} %>
            <%} %>
            <a href="/control/usergesipan/usergesipanmain"> 고객센터</a>
        </div>
    </div>

</header>

<!-- header section ends 페이지최상단종료 -->
</body>
</html>