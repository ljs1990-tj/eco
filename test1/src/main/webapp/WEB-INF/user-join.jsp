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
						<input type="text" v-model="user.userId" @keyup="fnIdCheck" required maxlength="20">
					</span>
		        	<div v-if="user.userId != ''">
				       	<div v-if="idCheckFlg" style="color: blue;">사용 가능한 아이디입니다.</div>
				       	<div v-else style="color: red;">중복된 아이디입니다.</div>
		        	</div>
				</li>
				<li>
					<div>비밀번호</div>
					<span>
						<input type="password" v-model="user.userPw" @keyup="fnPwCheck" required maxlength="16">
					</span>
					<div v-if="user.userPw != ''">
						<div v-if="!pwCheckFlg" style="color: red;">비밀번호는 최소 8글자, 최대 16글자이고 하나 이상의 숫자, 영문자 및 특수문자를 각각 포함되어야 합니다!</div>
					</div>
				</li>
				<li>
					<div>비밀번호 확인</div>
					<span>
						<input type="password" v-model="user.userPw2" required maxlength="16">
					</span>
					<div v-if="user.userPw2 != ''">
						<div></div>
					</div>
				</li>
				<li>
					<div>이름</div>
					<span>
						<input type="text" v-model="user.name" required maxlength="30">
					</span>
				</li>
				<li>
					<div>닉네임</div>
					<span>
						<input type="text" v-model="user.nickName" required maxlength="30">
					</span>
				</li>
				<li>
					<div>성별</div>
					<span>
			            <input type="radio" name="gender" value="남성" v-model="user.gender">남
			            <input type="radio" name="gender" value="여성" v-model="user.gender">여
			            <input type="radio" name="gender" value="기타" v-model="user.gender">기타
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
						<input type="text" v-model="email1" placeholder="이메일 아이디 입력" required>
						<span>@</span>
						<input type="text" v-model="email2" placeholder="직접 입력">
						<select v-model="email3" @change="selectEmail">
							<option value="" selected>직접 입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="kakao.com">kakao.com</option>
							<option value="hanmail.net">hanmail.net</option>
						</select>
					</span>
				</li>
				<li>
					<div>생년월일</div>
					<span>
						<input type="text" v-model="user.birth" placeholder="ex)19910101" required maxlength="8">
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
    	email1: "",
    	email2: "",
    	email3: "",
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
    	idCheckFlg: false,
    	idCheckFlg2: false,
    	pwCheckFlg: false
    }
    , methods: {
    	fnJoin: function() {
            var self = this;
            var num = /^[0-9]*$/;
            var engNum = /^[a-zA-Z0-9]*$/;
            if(self.user.userId != engNum) {
            	alert("아이디는 영어와 숫자만 입력하세요!");
                return;            	
            }
            if(self.user.userPw != self.user.pwd2){
                alert("비밀번호를 같게 쓰세요!");
                return;
            }
            if(self.user.phone1 == "" && self.user.phone2 == "" && self.user.phone3 == ""){
                alert("핸드폰 번호를 입력하세요!");
                return;
            }
            if(self.email1 == "" && self.email2== ""){
                alert("이메일을 입력하세요!");
                return;
            }
            if(self.user.birth == ""){
                alert("생년월일을 입력하세요!");
                return;
            }
            if(self.user.birth != num){
                alert("생년월일엔 숫자만 입력하세요!");
                return;
            }
            self.user.email = self.email1 + self.email2;
            console.log(self.user.email);
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
        fnIdCheck: function(){
        	var self = this;
        	var nparmap = {userId : self.user.userId};
	        $.ajax({
	            url:"check.dox",
	            dataType:"json",
	            type: "POST", 
	            data: nparmap,
	            success: function(data) {
	            	if(data.result == "success") {
	            		self.idCheckFlg = true;
	            	} else {
	            		self.idCheckFlg = false;
	            	}
	            }
	        });
        },
        fnPwCheck: function() {
			var self = this;
			var regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
            if(regPwd.test(self.user.userPw)) {
				self.pwCheckFlg = true;
            } else {
            	self.pwCheckFlg = false;
            }
		},
        selectEmail: function() {
        	var self = this;
			self.email2 = self.email3;
		}
    }
    , created: function() {
    	var self = this;
	}
});
</script>