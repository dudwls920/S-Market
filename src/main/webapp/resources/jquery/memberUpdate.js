/**
 * 
 */

$(document).ready(function(e) {
					var userIdResult = false;
					var idCheckResult = false;
					var userEmailResult = false;
					var userPwResult = false;
					var userPwCheck = false;
					
					
//					$("#userId").keyup(function() {
//										var Id = $("#userId").val();
//										var regExp = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
//										var IdReg = regExp.test(Id);
//
//										if (IdReg) {
//											$("#labelId").html("").attr("style", "color:blue");
//											userIdResult = true;
//
//											$(".idCheck").removeAttr("disabled");
//										} else {
//											$("#labelId").html("아이디는 영문 / 숫자 조합으로 입력해주세요. [6자리이상 15자리이하]").attr("style", "color:red");
//											userIdResult = false;
//											//$(".idCheck").attr("disabled","disabled");
//										}
//									});

					$("#userEmail").keyup(function() {
								var email = $("#userEmail").val();
								var regExp = /\w+@\w+\.\w+/;
								var emailReg = regExp.test(email);
								if (emailReg) {
									userEmailResult = true;
									$("#labelEmail").html("").attr("style","color:blue");
								} else {
									userEmailResult = false;
									$("#labelEmail").html("E-mail 형식으로 입력하세요.").attr("style", "color:red");
								}
							});

					$("#userPw").keyup(function() {
										var pw = $("#userPw").val();
										// 특수문자/문자/숫자 포함 8~15이내의 정규식
										var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

										var pwReg = regExp.test(pw);
										if (pwReg) {
											userPwResult = true;
											$("#labelPw").html("").attr("style", "color:blue");
										} else {
											userPwResult = false;

											$("#labelPw").html("비밀번호는 특수문자,문자와 숫자포함. 8자리이상 15자리이하로 입력해주세요.").attr("style", "color:red");
										}
									});

					$("#userPwCheck").keyup( function() {

								if ($("#userPw").val() != $("#userPwCheck").val()) {
									userPwCheck = false;

									$("#labelPwCheck").html("비밀번호가 일치하지 않습니다.").attr("style", "color:red");
								} else {
									userPwCheck = true;
									$("#labelPwCheck").html("").attr("style", "color:blue");
								}

							});

					/*$("#idCheck").click(function() {
						$.ajax({
							url : "/k/member/idCheck",
							type : "POST",
							dataType : "json",
							data : {
								"userId" : $("#userId").val()
							},
							success : function(data) {

								// alert($("#userId").val());
								if (data == 1) {
									idCheckResult = false;
									alert("이미 가입된 ID 입니다.");
								} else {
									idCheckResult = true;
									alert("사용 가능한 ID 입니다.");
								}

							}
						});
					});*/

					var signinForm = $("#signinForm");
					$(".submit").on("click", function(e) {
								if ( //idCheckResult && 
//									userIdResult && 
									userEmailResult ||
									userPwResult ||
									userPwCheck) {
									alert("정보가 수정되었습니다")
									
									signinForm.submit();	
								} else {
									alert("양식을 확인해주십시오.");
									
									e.preventDefault();
								}

							});

				});
