<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/team_project_style.css">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>회원가입 페이지</title>
</head>
<style>
</style>
<body>
    <div id="app">
        <fieldset class="container-join">
            <div class="join-title">회원가입</div>
            <div class="required-input"><span class="required-star">*</span>필수입력사항</div>
            <ul>
                <div class="under-line"></div>
                <li>
                    <div class="join-divide">아이디<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input" v-model="user.userId" @keyup="fnIdCheck" maxlength="20" autofocus>
                    </span>
                    <div v-if="user.userId != ''">
                        <template v-if="!idCheckFlg2">
                            <div style="color: red;">아이디는 영어와 숫자만 입력하세요!</div>
                        </template>
                        <template v-else>
                            <div v-if="idCheckFlg" style="color: blue;">사용 가능한 아이디입니다.</div>
                            <div v-else style="color: red;">중복된 아이디입니다.</div>
                        </template>
                    </div>
                </li>
                <li>
                    <div class="join-divide">비밀번호<span class="required-star">*</span></div>
                    <span>
                        <input type="password" class="join-input" v-model="user.userPw" @keyup="fnCheck('pw1')" maxlength="16">
                    </span>
                    <div v-if="user.userPw != ''">
                        <div v-if="!pwCheckFlg" style="color: red;">비밀번호는 최소 8글자, 최대 16글자이고 하나 이상의 숫자, 영문자 및 특수문자를 각각 포함되어야 합니다!</div>
                    </div>
                </li>
                <li>
                    <div class="join-divide">비밀번호 확인<span class="required-star">*</span></div>
                    <span>
                        <input type="password" class="join-input" v-model="user.userPw2" @keyup="fnCheck('pw2')" maxlength="16">
                    </span>
                    <div v-if="user.userPw2 != ''">
                        <div v-if="!pwCheckFlg2" style="color: red;">비밀번호와 똑같이 입력하세요!</div>
                    </div>
                </li>
                <li>
                    <div class="join-divide">이름<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input" v-model="user.name" maxlength="20">
                    </span>
                </li>
                <li>
                    <div class="join-divide">닉네임<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input" v-model="user.nickName" maxlength="20">
                    </span>
                </li>
                <li>
                    <div class="join-divide">성별<span class="required-star">*</span></div>
                    <span>
                        <input type="radio" name="gender" value="남성" v-model="user.gender">남
                        <input type="radio" name="gender" value="여성" v-model="user.gender">여
                        <input type="radio" name="gender" value="기타" v-model="user.gender">기타
                    </span>
                </li>
                <li>
                    <div class="join-divide">핸드폰 번호<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input phone-input" v-model="user.phone1" maxlength="3"> -
                        <input type="text" class="join-input phone-input" v-model="user.phone2" maxlength="4"> -
                        <input type="text" class="join-input phone-input" v-model="user.phone3" maxlength="4">
                    </span>
                </li>
                <li>
                    <div class="join-divide">이메일<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input email-input" v-model="email1" placeholder="이메일 아이디 입력">
                        <span>@</span>
                        <input type="text" class="join-input email-input" v-model="email2" placeholder="직접 입력">
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
                    <div class="join-divide">생년월일<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input" v-model="user.birth" placeholder="ex)19910101" maxlength="8" @keyup="fnDateCheck('birth')">
                    </span>
                    <div v-if="user.birth != ''">
                        <div v-if="!birthCheckFlg" style="color: red;">{{alertMessage}}</div>
                    </div>
                </li>
                <div class="under-line"></div>
                <li>
                    <div class="join-divide">이용약관 동의<span class="required-star">*</span></div>
                    <div><label for="check-all"><input type="checkbox" id="check-all">전체 동의합니다.</label></div>
                    <div class="join-divide">　</div>
                    <div style="padding-left: 125px; font-size: 10px;">선택항목에 동의하지 않더라도 회원가입은 가능합니다.</div>
                    <div><label for="check1"><input type="checkbox" id="check1">이용약관 동의 (필수)</label></div>
                    <div class="join-divide">　</div>
                    <div><label for="check2"><input type="checkbox" id="check2">개인정보 수집·이용 동의 (필수)</label></div>
                    <div class="join-divide">　</div>
                    <div><label for="check3"><input type="checkbox" id="check3">본인은 만 14세 이상입니다. (필수)</label></div>
                    <div class="join-divide">　</div>
                    <div><label for="check4"><input type="checkbox" id="check4" name="eventYn" v-model="isEventYn">이벤트 인증 (선택)</label></div>
                </li>
            </ul>
            <div class="text-center">
                <button class="join-button" @click="fnJoin">회원가입</button>
            </div>
        </fieldset>

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
						<input type="text" v-model="user.nickName" required>
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
    		birth: "",
    		eventYn: ""
    		
    	},
    	idCheckFlg: false,
    	idCheckFlg2: false,
    	pwCheckFlg: false,
    	pwCheckFlg2: false,
    	birthCheckFlg: false,
    	isEventYn: false,
    	alertMessage: ""
    }
    , methods: {
    	fnJoin: function() {
            var self = this;
            if(self.user.userId == "") {
            	alert("아이디를 입력하세요!");
            	return;
            }
            if(self.user.userPw == "") {
            	alert("비밀번호를 입력하세요!");
            	return;
            }
            if(self.user.name == "") {
            	alert("이름을 입력하세요!");
            	return;
            }
            if(self.user.nickName == "") {
            	alert("닉네임을 입력하세요!");
            	return;
            }
            if(self.user.userPw == "") {
            	alert("비밀번호를 입력하세요!");
            	return;
            }
            if(self.user.phone1 == "" || self.user.phone2 == "" || self.user.phone3 == ""){
                alert("핸드폰 번호를 입력하세요!");
                return;
            }
            if(self.email1 == "" || self.email2== ""){
                alert("이메일을 입력하세요!");
                return;
            }
            if(self.user.birth == ""){
                alert("생년월일을 입력하세요!");
                return;
            }
            self.user.email = self.email1 + "@" + self.email2;
            self.user.eventYn = self.isEventYn ? 'Y' : 'N';
            if(self.idCheckFlg && self.idCheckFlg2 && self.pwCheckFlg && self.pwCheckFlg2 && self.birthCheckFlg) {
	            var nparmap = self.user;
	            $.ajax({
	                url:"user-join.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success: function(data) {
	                	console.log(data);
	                	if(data.result == "success") {
		                	alert("가입됐습니다!");
		                	$.pageChange("/user-login.do",{});
	                	} else {
	                		alert("오류로 인한 가입 실패!");
	                	}
	                }
	            });
            }
        },
        fnIdCheck: function(){
        	var self = this;
        	var regId = /^[a-zA-Z0-9]*$/;
        	if(regId.test(self.user.userId)) {
        		self.idCheckFlg2 = true;
        	} else {
        		self.idCheckFlg2 = false;
        	}
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
        fnCheck: function(flg) {
			var self = this;
			var regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
           	if(flg == 'pw1') {
	            if(regPwd.test(self.user.userPw)) {
					self.pwCheckFlg = true;
	            } else {
	            	self.pwCheckFlg = false;
	            }
           	} else if(flg == 'pw2') {
	            if(self.user.userPw != self.user.userPw2) {
					self.pwCheckFlg2 = false;
	            } else {
	            	self.pwCheckFlg2 = true;
	            }
           	}
		},
		fnDateCheck: function() {
			var self = this;
			var vDate = self.user.birth;
			var regNum = /^[0-9]*$/;
			
			if(regNum.test(vDate)) {
				self.birthCheckFlg = true;
				self.alertMessage = "";
			} else {
				self.birthCheckFlg = false;
				self.alertMessage = "생년월일엔 숫자만 입력하세요!";
			}
			
			if(vDate.length == 8) {
				var vDatePattern = /^(\d{4})(\d{1,2})(\d{1,2})$/;
				var dtArray = vDate.match(vDatePattern);
	
				var dtYear = dtArray[1];
	            var dtMonth = dtArray[2];
	            var dtDay = dtArray[3];
	
	            if (dtMonth < 1 || dtMonth > 12) {
	            	self.birthCheckFlg = false;
	            	self.alertMessage = "알맞지 않은 날짜를 입력하셨습니다. 다시 한번 확인해 주세요!";
	            } else if (dtDay < 1 || dtDay > 31) {
	            	self.birthCheckFlg = false;
	            	self.alertMessage = "알맞지 않은 날짜를 입력하셨습니다. 다시 한번 확인해 주세요!";
	            } else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31) {
	            	self.birthCheckFlg = false;
	            	self.alertMessage = "알맞지 않은 날짜를 입력하셨습니다. 다시 한번 확인해 주세요!";
	            } else if (dtMonth == 2) {
	                var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
	                if (dtDay > 29 || (dtDay == 29 && !isleap)) {
	                	self.birthCheckFlg = false;
	                	self.alertMessage = "알맞지 않은 날짜를 입력하셨습니다. 다시 한번 확인해 주세요!";
	                }
	            } else {
	            	self.birthCheckFlg = true;
	            	self.alertMessage = "";
	            }
			} else {
				return;
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