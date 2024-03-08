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
			<div class="join-title">로그인</div>
			<div>
				<input type="text" class="login-input" v-model="userId" placeholder="아이디">
			</div>
			<div>
				<input type="password" class="login-input" v-model="userPw" @keyup.enter="fnLogin" placeholder="비밀번호">
			</div>
			<div style="text-align: right;">
				<a class="join-text" href="/user-join.do">회원가입</a>
			</div>
			<div style="color: red;">{{resultMessage}}</div>
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
    }
    , created: function() {
    	var self = this;
	}
});
</script>
</html>
