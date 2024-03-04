<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>회원가입 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<fieldset>
			<legend>회원가입</legend>
			<ul>
				<li>
					<div>아이디</div>
					<span>
						<input type="text" v-model="user.userId" @keyup="fnCheck" maxlength="20">
					</span>
		        	<div v-if="user.userId != ''">
				       	<div v-if="checkFlg" style="color: blue;">사용 가능한 아이디입니다.</div>
				       	<div v-else style="color: red;">중복된 아이디입니다.</div>
		        	</div>
				</li>
				<li>
					<div>비밀번호</div>
					<span>
						<input type="password" v-model="user.userPw" required maxlength="16">
					</span>
				</li>
				<li>
					<div>비밀번호 확인</div>
					<span>
						<input type="password" v-model="user.userPw2" required maxlength="16">
					</span>
				</li>
				<li>
					<div>이름</div>
					<span>
						<input type="text" v-model="user.name" required maxlength="30">
					</span>
				</li>
				<li>
					<div>닉네임</div>
						<input type="text" v-model="user.nickName" required>

						<input type="text" v-model="user.nickName" required maxlength="30">
					</span>
				</li>
				<li>
					<div>성별</div>
					<span>
			            <input type="radio" name="gender" value="남성" v-model="user.gender">남
			            <input type="radio" name="gender" value="여성" v-model="user.gender">여
					</span>
				</li>
				<li>
					<div>핸드폰 번호</div>
					<span>
						<input type="text" v-model="user.phone1" required maxlength="3">-
						<input type="text" v-model="user.phone2" required maxlength="4">-
						<input type="text" v-model="user.phone3" required maxlength="4">
					</span>
				</li>
				<li>
					<div>이메일</div>
					<span>
						<input type="text" v-model="user.email" placeholder="전부 다 적어주세요" required>
					</span>
				</li>
				<li>
					<div>생년월일</div>
					<span>
						<input type="text" v-model="user.birth" placeholder="ex)19910101" required>
					</span>
				</li>
				<li>
					<div></div>
				</li>
			</ul>
			<div>
				<button @click="fnJoin">회원가입</button>
			</div>
		</fieldset>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	user: {
    		userId: "",
    		userPw: "",
    		userPw2: "",
    		name: "",
    		nickName: "",
    		gender: "남성",
            phone1: "010",
            phone2: "",
            phone3: "",
            email: "",
    		birth: ""
    	},
    	checkFlg: false
    }
    , methods: {
    	fnJoin: function() {
            var self = this;
            var engNum = /^[a-zA-Z0-9]*$/;
            if(!self.checkFlg) {
            	alert("중복체크 후 누르세요!");
            	return;
            }
            if(self.user.id == "") {
            	alert("아이디를 입력하세요!");
                return;
            }
            if(self.user.id != engNum) {
            	alert("아이디는 영어와 숫자만 입력하세요!");
                return;            	
            }
            if(self.user.pwd == "") {
            	alert("비밀번호를 입력하세요!");
                return;
            }
            if(self.user.pwd != engNum) {
            	alert("영어와 숫자만 입력하세요!");
                return;            	
            }
            if(self.user.pwd != self.user.pwd2){
                alert("비밀번호를 같게 쓰세요!");
                return;
            }
            var nparmap = self.user;
            $.ajax({
                url:"user-join.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	if(data.result == "success") {
	                	alert("가입됐습니다!");
	                	$.pageChange("/login.do",{});
                	} else {
                		alert("오류로 인한 가입 실패!");
                	}
                }
            });
        },
        fnCheck: function(){
        	var self = this;
        	var nparmap = {userId : self.user.userId};
	        $.ajax({
	            url:"check.dox",
	            dataType:"json",
	            type: "POST", 
	            data: nparmap,
	            success: function(data) {
	            	if(data.result == "success") {
	            		self.checkFlg = true;
	            	} else {
	            		self.checkFlg = false;
	            	}
	            }
	        });
        }
    }
    , created: function() {
    	var self = this;
	}
});
</script>