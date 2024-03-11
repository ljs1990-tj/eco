<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/team_project_style.css">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>로그인 페이지</title>
</head>
<style>
	div {
		margin: 10px;
	}
</style>
<body>
	<div id="app">
		<fieldset class="con-login">
			<div class="login-title">로그인</div>
			<div>
				<input type="text" class="login-input" v-model="userId" placeholder="아이디를 입력해 주세요">
			</div>
			<div>
				<input type="password" class="login-input" v-model="userPw" @keyup.enter="fnLogin" placeholder="비밀번호를 입력해 주세요">
			</div>
			<div class="find-align">
				<a class="login-text" href="/user-join.do">아이디 찾기</a>
				<span class="login-text">|</span>
				<a class="login-text" href="/user-join.do">비밀번호 찾기</a>
			</div>
			<div>
				<button class="login-btn" @click="fnLogin">로그인</button>
				<button class="login-btn login-btn-alter" @click="fnJoin">회원가입</button>
			</div>
			<div style="margin-top: -10px;">
				<a href="javascript:;" @click="fnKakao" style="margin-left: 10px;"><img alt="kakao_login" src="../img/kakao/kakao_login_medium_wide.png" width="255px;"></a>
			</div>
			<div style="color: red; margin-left: 20px;">{{resultMessage}}</div>
		</fieldset>
	</div>
</body>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	userId: "",
    	userPw: "",
    	resultMessage: ""
    }
    , methods: {
    	fnLogin: function() {
            var self = this;
            if(self.userId == "") {
            	self.resultMessage = "아이디를 입력해 주세요!";
            	return;
            }
            if(self.userPw == "") {
            	self.resultMessage = "비밀번호를 입력해 주세요!";
            	return;
            }
            var nparmap = {
            		userId: self.userId,
            		userPw: self.userPw
            };
            $.ajax({
                url:"user-login.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	if(data.result == "success") {
                		self.resultMessage = ""; 
                		$.pageChange("/main.do", {});
                	} else {
                		self.resultMessage = "없는 아이디 또는 비밀번호입니다!";
                	}
                }
            });
        },
        fnJoin: function() {
        	$.pageChange("/user-join.do", {});
        },
        fnKakao: function() {
        	location.href="https://kauth.kakao.com/oauth/authorize?client_id=" + "d806de64224ad3190e9f1f718ee4ec75" + "&redirect_uri=" + "http://localhost:8080/kakaoLogin.do" + "&response_type=code";
        }
    }
    , created: function() {
    	var self = this;
	}
});
</script>
</html>
