<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/user-myPage.css" type="text/css">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>비밀번호 확인 페이지</title>
</head>
<style>

</style>
<body class="MyPagePwdbackground">
	<div id="app" class="app">
		<div>
			<span>비밀번호 입력 :</span> 
			<input type="password" v-model="userPw" @keydown.enter="fnList()" @input="validateInput">
			<button @click="fnList()">확인</button>
			<button @click="fnclose()" class="cancel-btn">취소</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	userId : "${userId}",
    	userPw : ""
    }
    , methods: {
    	//비밀번호 입력 정규식 사용
    	validateInput: function() {
    	    var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()-_+=]).{8,16}$/;
    	},
    	//비밀번호 확인시 실행문
    	fnList: function() {
            var self = this;
            if(self.userId == ""){
          		alert("로그인 후 입장 가능합니다.");
          		window.opener.location.href = "/user-login.do";
          		window.close();
          	}
        	if(self.userPw == ""){
        		alert("비밀번호를 입력해 주세요.");
        		return;
        	}
            var nparmap = {
            	userId : self.userId,
            	userPw : self.userPw
            };
            $.ajax({
                url:"user-mypage.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data);
                	if(self.userPw === data.user.userPw){
                		 window.opener.location.href = "/user-myPageView.do";	// 메인 페이지 URL로 변경
			             window.close();
                	}else{
                		alert("비밀번호가 틀립니다.");
                		location.reload(true);
                		return;
                	}
                }
            });
        },
        //취소버튼 클릭시 팝업창 닫음
        fnclose : function(){
        	var self = this;
        	 window.close();
        }
    }
    , created: function() {
    	var self = this;
    	  if(self.user.userId == ""){
      		alert("로그인 후 입장 가능합니다.");
      		window.opener.location.href = "/user-myPageView.do";	// 메인 페이지 URL로 변경
      		window.close();
      		
      	}

	}
});
</script>