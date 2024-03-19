<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="../css/join-login.css"> -->
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>로그인 페이지</title>
</head>
<style>
	.con-login {
		border: 1px solid #ddd;
		background-color: white;
		border-radius: 5px;
		margin: 200px auto;
		width: 300px;
	}
	
	.login-title {
		text-align: center;
		font-size: 15px;
		font-weight: bold;
		margin: 25px;
	}
	
	.login-input {
		width: 255px;
		height: 40px;
		border: 2px solid #ddd;
		border-radius: 5px;
		margin-left: 10px;
		padding-left: 20px;
	}
	
	.login-input:focus {
		border-color: #2c9d59;
	}
	
	.login-input::placeholder {
		font-size: 12px;
		color: #999;
	}
	
	.find-align {
		text-align: right;
		padding-right: 15px;
		line-height: 0px;
	}
	
	.login-btn {
		width: 255px;
		height: 40px;
		margin-left: 10px;
		background-color: #2c9d59;
		color: white;
		font-weight: bold;
		cursor: pointer;
		border: 1px solid #2c9d59;
		margin-top: 10px;
	}
	
	.login-btn:hover {
		background-color: #1f814c;
	}
	
	.login-btn-alter {
		background-color: white;
		color: #2c9d59;
		margin-bottom: 10px;
	}
	
	.login-btn-alter:hover {
		background-color: #defcdd;
	}
	
	.login-text {
		text-decoration: none;
		font-size: 11px;
		color: black;
		letter-spacing: -1px;
	}
</style>
<body>
	<!-- header -->
	<%@ include file="layout/header.jsp"%>
	<div id="app">
		<fieldset class="con-login">
			<div class="login-title" style="margin: 10px;">로그인</div>
			<div style="margin: 10px;" class="inputBox">
				<input type="text" class="login-input" v-model="userId"
					@keyup.enter="fnLogin" placeholder="아이디를 입력해 주세요" maxlength="20" autofocus>
			</div>
			<div style="margin: 10px;">
				<input type="password" class="login-input" v-model="userPw"
					@keyup.enter="fnLogin" placeholder="비밀번호를 입력해 주세요" maxlength="16">
			</div>
			<div class="find-align" style="margin: 10px;">
				<a class="login-text" href="/find-password.do"
					@click.prevent="fnOpenFind('id')">아이디 찾기</a> <span
					style="font-size: 13px;">|</span> <a class="login-text"
					href="/find-password.do" @click.prevent="fnOpenFind('password')">비밀번호
					찾기</a>
			</div>
			<div style="margin: 10px;">
				<button class="login-btn" @click="fnLogin">로그인</button>
				<button class="login-btn login-btn-alter" @click="fnJoin">회원가입</button>
			</div>
			<div style="margin: 10px;">
				<!-- <div style="margin-top: 0px;"><a href="javascript:;" @click="fnKakao" style="margin-left: 10px;"><img alt="kakao_login" src="../img/kakao/kakao_login_medium_wide.png" width="255px;"></a></div> -->
			</div>
			<div style="color: red; font-weight: bold; margin-left: 20px;">{{resultMessage}}</div>
		</fieldset>
	</div>
	<!-- footer -->
	<%@ include file="layout/footer.jsp"%>
</body>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	userId: "",
    	userPw: "",
    	resultMessage: "",
    	userType : "",
    	authYn : ""
    }
    , methods: {
    	fnLogin: function() {
    	    var self = this;
    	    var leftPosition = (window.screen.width - 400) / 2; // 화면의 가로 중앙 위치
    	    var topPosition = (window.screen.height - 400) / 2; // 화면의 세로 중앙 위치
    	    if (self.userId == "") {
    	        self.resultMessage = "아이디를 입력해 주세요!";
    	        return;
    	    }
    	    if (self.userPw == "") {
    	        self.resultMessage = "비밀번호를 입력해 주세요!";
    	        return;
    	    }
    	    var nparmap = {
    	        userId: self.userId,
    	        userPw: self.userPw
    	    };
    	    $.ajax({
    	        url: "user-login.dox",
    	        dataType: "json",
    	        type: "POST",
    	        data: nparmap,
    	        success: function(data) {
    	        	console.log(data);
    	            if (data.result == "success") {
    	                self.resultMessage = "";
    	                self.userType = data.user.userType; // 로그인 후 등급 정보 할당
    	                self.authYn = data.user.authYn;
    	                if (self.userType === 'D') {
    	                	alert("탈퇴회원이므로 복구해주시길 바랍니다.");
    	                    // 등급이 D인 경우 회원탈퇴상태이므로 복구 페이지로 이동
    	                   var popup = window.open('/user-resume.do', 'userCancleDelete Popup', 'width=500,height=400,left=' + leftPosition + ',top=' + topPosition);
							// 주기적으로 팝업 창이 닫혔는지 확인
							var interval = setInterval(function() {
								if (popup && popup.closed) {
									clearInterval(interval); // 인터벌 중단
									// 팝업 창이 닫혔을 때 부모 창으로 이동
									window.location.href = '/user-login.do';
								}
							}, 1000); // 1초마다 확인
    	                }else if(self.authYn === 'N'){
    	                	alert("본인인증 하셔야 이용이 가능합니다");
    	                	window.location.href = "/user-login-certifyMain.do"
    	                }else {
    	                    // 등급이 D가 아닌 경우 기존의 로직 수행
    	                   $.pageChange("/main.do", {});
    	                }
    	            } else if (data.result == "fail") {
    	                self.resultMessage = data.message;
    	            }
    	        }
    	    });
    	},
        fnJoin: function() {
        	$.pageChange("/user-join.do", {});
        },
        fnOpenFind: function(kind) {
        	var leftPosition = (window.screen.width / 2) - (460 / 2);
       		var topPosition = (window.screen.height / 2) - (300 / 2);
        	if(kind == 'id') {
	       		window.open('/find-id.do', '_blank', 'width=460, height=300, left=' + leftPosition + ',top=' + topPosition + ', toolbar=no, location=no, status=no, menubar=no');        		
        	} else if(kind == 'password') {
          		// 비밀번호 찾기 팝업을 창의 상단 중앙에 위치시키기 위해 창의 크기와 화면 크기를 이용하여 위치 조정
	       		window.open('/find-password.do', '_blank', 'width=460, height=300, left=' + leftPosition + ',top=' + topPosition + ', toolbar=no, location=no, status=no, menubar=no');
        	}
        }
    }
			    , created: function() {
			    	var self = this;
				}
			});

			$(document).ready(function() {
			    var $loginBox = $('.outBox');
			    var $loginInputBox = $('#sampleId');
			
			    $loginInputBox.on('keyup', function() {
			        if ($(this).val() !== '') {
			            // 입력 값이 비어 있지 않은 경우
			            $loginBox.addClass('existence');
			        } else {
			            // 입력 값이 비어 있는 경우
			            $loginBox.removeClass('existence');
			        }
			    });
			});
</script>
</html>
