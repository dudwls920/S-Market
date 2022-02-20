<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A게시판</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="/control/resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(document).ready(function() {
	var fObject=$(".form");
	
	$(".btnList").on("click",function(){
		location.href="/control/usergesipan/usergesipanmain";
	})			
	$(".btnRemove").on("click",function(){
		fObject.attr("method","get");
		fObject.attr("action","/control/usergesipan/usergesipanremove");
		fObject.submit();
	})
	$(".btnModify").on("click",function(){
		fObject.attr("method","get");
		fObject.attr("action","/control/usergesipan/usergesipanmodify");
		fObject.submit();
	})
});

	var str = "";


	function modify(rno, content){
		
		str = content;
		//기존 내용 저장
		$(".replyList button:not(."+rno+")").hide();
		// 나머지 숨기기
		
		$("#replyContent"+rno).attr('readonly',false);
			//수정가능
		$("#replySave"+rno).show();
			//저장버튼 보임
		$("#replyCancel"+rno).show();
			//취소버튼 보임
		$("#replyRemove"+rno).hide();
			//삭제버튼 숨기기
		$("#replyMB"+rno).hide();
			//수정버튼 숨기기
			
		
		
	}
	
	function cancel(rno){
		$("#replyContent"+rno).attr('readonly',true);
			//수정불가
		$("#replySave"+rno).hide();
			//저장버튼 숨기기
		$("#replyCancel"+rno).hide();
			//취소버튼 숨기기
		$("#replyRemove"+rno).show();
			//삭제버튼 보임
		$("#replyMB"+rno).show();
			//수정버튼 보임
			
		$("#replyContent"+rno).val(str);
			//기존 내용 불러오기
			
		$(".replyList button:not(."+rno+").rc").show();
			// 나머지 보이기
	}
	
	
	function save(bno,rno,content){
		
		// DB에 업데이트
		content = $("#replyContent"+rno).val();
		location.href = "/control/usergesipan/usergesipanreadModify?rno="+rno+"&bno="+bno+"&content="+content;

	}
	
	function remove(rno,bno){

		location.href = "/control/usergesipan/usergesipanreadRemove?rno="+rno+"&bno="+bno;
		// 댓글 삭제
	}
	


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

.main .reply {
	width : 50%;
	margin-left: auto;
	margin-right: auto;
}
.main .replyinsert{
	width : 50%;
	margin-left: auto;
	margin-right: auto;
}
.main .box-footer{
	padding : 5px;
	width : 50%;
	margin-left: auto;
	margin-right: auto;
}
ol {
background-color : #ddd;
}

ol p {
padding : 10px;
}

ol p button {
margin: 0px 0px 10px 10px;
float:right;
cursor: pointer;
}

.replyRead{
width:100%;
height:90px;
background-color : #ddd;
border-bottom : 1px #c8c8c8 solid;
}

.replyList input{
border:none;
background-color:#ddd;
}

</style>

</head>
<body>
<!-- header section starts 페이지 최상단  -->
	<%@include file="../Header.jsp"%>

<!-- header section ends 페이지최상단종료 -->

	<!-- home section starts 페이지중단시작  -->

	<!-- category section starts  -->

	<div class="main">
  
		<form class="form" method="post">
							<input type='hidden' name='bno' value="${userGesipanDTO.bno}"> 
							<input type='hidden' name='page' value="${pageMaker.page}"> 
							<input type='hidden' name='perPageNum' value="${pageMaker.perPageNum}">
							<input type='hidden' name='searchType' value="${pageMaker.searchType}">
							<input type='hidden' name='keyword' value="${pageMaker.keyword}">
		</form>
		
		<h1>Q&A</h1>
		<table>
			<tr>
				<th>${userGesipanDTO.title}</th>
			</tr>
			<tr>
				<td>작성자:${userGesipanDTO.id}</td>
			</tr>
			<tr>
				<td style="height:400px;">${userGesipanDTO.content}</td>
			</tr>
		</table>
		
			<div class="box-footer">
    <c:set var="id" value="<%=id%>" />
   	 <c:set var="auth" value="<%=auth%>" />
    	<c:if test="${userGesipanDTO.id == id || auth == 1}">
            	<button type="submit" class="btnModify">수정</button>
				<button type="submit" class="btnRemove">삭제</button>
    </c:if>
                

            	<button type="button" class="btnList">목록</button>      

			</div>


		<div class="reply" id="reply">
		<c:forEach items="${replyList}" var="item">
		<div class="replyRead">
			<ol class="replyList">
						작성자 : ${item.id} &nbsp;&nbsp;&nbsp;&nbsp;
						작성 날짜: <fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd" />
					<p>
					<input type="text" id="replyContent${item.rno}" name="content" value="${item.content}" readonly>
					</p>
   	 		<c:set var="id" value="<%=id%>" />
   	 		 <c:set var="auth" value="<%=auth%>" />
    			<c:if test="${item.id == id || auth == 1}">
    			
    				<p>
    				<button id="replyRemove${item.rno}" class="${item.rno} rc" onclick="remove('${item.rno}','${item.bno}')">삭제</button>
    				<button id="replyMB${item.rno}" class="${item.rno} rc" onclick="modify('${item.rno}','${item.content}')">수정</button>
    				
    				<button id="replyCancel${item.rno}"  onclick="cancel('${item.rno}')" style="display:none;">취소</button>
    				<button id="replySave${item.rno}"  onclick="save('${item.bno}','${item.rno}','${item.content}')" style="display:none;">저장</button>
    				
					</p>
				</c:if>
			</ol>
		</div>
		</c:forEach>
		</div>
		<br><br><br>
		<form method="post">
			<div class="replyinsert" id="replyinsert">
				<textarea name="content" rows="5" cols="70" placeholder="댓글입력" style="resize: none; border: solid 1px #ddd; width:100%;" required></textarea>
				<input type='hidden' name="id" value="<%= id %>" readonly="readonly">
				
				
			<%if(id==null){ %>
			<input type="button" value="로그인안함입력" onclick="javascript:alert('로그인이 필요한 기능입니다.')" >
            <%}else{ %>
            <input type="submit" value="입력">                      
            <%} %>
				
				
			</div>

			<br><br><br>
		
		</form>
		
	</div>


	<!-- product section ends -->







	<!-- footer section starts  -->

		<%@include file="../Footer.jsp"%>
</body>
</html>