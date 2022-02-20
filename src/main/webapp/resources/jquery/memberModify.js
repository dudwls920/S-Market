/**
 * 
 */

$(document).ready(function(){
	
	var userIdResult = false;
	var idCheckResult = false;
	var userEmailResult = false;
	var userPwResult = false;
	var userPwCheck = false;
	
	var memberModifyForm = $("#memberModifyForm");
	$(".memberModify").on("click", function(e) {
		var memberConfirm = confirm("회원정보를 수정 하시겠습니까 ?");
		
		if (userPwResult && userPwCheck && userEmailResult) {
			if(memberConfirm == true) {
				memberModifyForm.submit();
				
				alert("회원 정보를 수정하였습니다")
			}else {
				e.preventDefault();
				
				alert("회원정보 수정을 취소하였습니다.")
			}	
		} else {				
			e.preventDefault();
			
			alert("비밀번호 또는 이메일 형식을 확인해주세요.");
		}

	})
	
	
	$("#userPw").keyup(function() {

		var pw = $("#userPw").val();
		// 특수문자/문자/숫자 포함 8~15이내의 정규식
		var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
		var pwReg = regExp.test(pw);
		if (pwReg) {
			userPwResult = true;
			$("#labelPw").html("").attr(
					"style", "color:blue");
		} else {
			userPwResult = false;
	
			$("#labelPw")
					.html(
							"비밀번호는 특수문자,문자와 숫자포함. 8자리이상 15자리이하로 입력해주세요.")
					.attr("style", "color:red");
		}
	})
	
	$("#userPwCheck").keyup(function() {

		if ($("#userPw").val() != $("#userPwCheck")
				.val()) {
			userPwCheck = false;

			$("#labelPwCheck").html("비밀번호가 일치하지 않습니다.")
					.attr("style", "color:red");
		} else {
			userPwCheck = true;
			$("#labelPwCheck").html("").attr(
					"style", "color:blue");
		}

	})
	
	$("#userEmail").keyup(function() {

		var email = $("#userEmail").val();
		var regExp = /\w+@\w+\.\w+/;
		var emailReg = regExp.test(email);
		if (emailReg) {
			userEmailResult = true;
			$("#labelEmail").html("").attr("style",
					"color:blue");
		} else {
			userEmailResult = false;

			$("#labelEmail").html("E-mail 형식으로 입력하세요.")
					.attr("style", "color:red");
		}
	})
	
	var memberRemoveForm = $("#memberRemoveForm");
	
	$(".memberRemove").on("click", function(e){
		var memberConfirm = confirm("회원을 탈퇴 하시겠습니까 ?");
		if(memberConfirm == true) {
				memberRemoveForm.submit();
		}else {
			e.preventDefault();	
		}	
			
	});
	
	var signinForm = $("#signinForm");
	$(".submit").on("click", function(e) {
				if (true) {
					alert("정보가 수정되었습니다")
					
					signinForm.submit();	
				}
			});
	
	
});