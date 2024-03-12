<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="js/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <title>마이 페이지 - 수정</title>
</head>
<style>
</style>
<body>
    <div id="app">
        <div>
    		<fieldset class="container-join">
    			<div class="join-title">회원정보 수정</div>
                <ul>
                	<div class="under-line"></div>
                    <li>
                        <div class="join-divide">아이디</div>
                        <input type="text" class="join-input" v-model="user.userId" disabled>
                    </li>
                    <li>
                        <div class="join-divide">비밀번호</div>
                        <input type="password" class="join-input" v-model="user.userPw" maxlength="16" @input="validatePassword($event, 'userPw')" >
                        <div>
                            <span v-if="!checkPasswordMatch" style="color: red;">{{ passwordErrorMessage }}</span>
                        </div>
                    </li>
                    <li>
                        <div class="join-divide">비밀번호 확인</div>
                        <input type="password" class="join-input" v-model="user.userPw2" maxlength="16" @input="validatePassword($event, 'userPw2')">
                        <div>
                            <span v-if="!checkPassword2Match" style="color: red;">{{ passwordConfirmErrorMessage }}</span>
                        </div>
	                    <div>
	                		<span v-if="!checkPassword"style="color: red;">비밀번호랑 비밀번호 확인이 다릅니다.</span>
	                    </div>
                    </li>
                    <li>
                        <div class="join-divide">이름</div>
                        <input type="text" class="join-input" v-model="user.name" maxlength="30">
                    </li>
                    <li>
                        <div class="join-divide">닉네임</div>
                        <input type="text" class="join-input" v-model="user.nickName" maxlength="30">
                    </li>
                  	<li>
						<div class="join-divide">성별</div>
						<div>
							<input type="radio" name="gender" value="남성" v-model="user.gender">남 
							<input type="radio"name="gender" value="여성" v-model="user.gender">여
							<input type="radio" name="gender" value="기타" v-model="user.gender">기타
						</div>
					</li>
					<li>
						<div class="join-divide">핸드폰 번호</div>
						<div>
							<input type="text" class="join-input phone-input" v-model="user.phone1"  maxlength="3" @input="allowOnlyNumbers($event, 'phone1')">-
       						<input type="text" class="join-input phone-input" v-model="user.phone2"  maxlength="4" @input="allowOnlyNumbers($event, 'phone2')">-
        					<input type="text" class="join-input phone-input" v-model="user.phone3"  maxlength="4" @input="allowOnlyNumbers($event, 'phone3')">    
						</div>
					</li>
                    <li>
                        <div class="join-divide">이메일</div>
                        <span>
                        <input type="text" class="join-input email-input" v-model="email1" placeholder="이메일 아이디 입력">
                        <span>@</span>
                        <input type="text" class="join-input email-input" v-model="email2" placeholder="직접 입력">
                        <select v-model="email3" @change="selectEmail">
                            <option value="">직접 입력</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="kakao.com">kakao.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                        </select>
                    </span>
                </ul>
                <div class="text-center">
                    <button @click="fnModify()" class="join-button" @keydown.enter="fnModify()">수정하기</button>
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
                userId: "${userId}",
                userPw: "",
                userPw2: "",
                name: "",
                nickName: "",
                gender: "",
                phone1: "",
                phone2: "",
                phone3: "",
                email: "",
            },
            checkPassword : true,
            checkPasswordMatch: true,
            checkPassword2Match: true,
            passwordErrorMessage: "",
        },
        methods: {
            information: function () {
                var self = this;
                var nparmap = self.user;
                $.ajax({
                    url: "user-mypage.dox",
                    dataType: "json",
                    type: "POST",
                    data: nparmap,
                    success: function (data) {
                        self.user = data.user;
                        self.user.userPw = '';
                        self.user.userPw2 = '';
                        var atIdx = data.user.email.indexOf('@');
                        self.email1 = data.user.email.substring(0, atIdx);
                        self.email2 = data.user.email.substring(atIdx + 1);
                    }
                });
            },
           
         	 // 핸드폰 번호 입력 정규식 - 숫자만 허용
			allowOnlyNumbers: function (event, field) {
				var self = this;
				self.user[field] = event.target.value.replace(/[^0-9]/g, '');
			},
            //생일 입력 정규식
            formatBirthDate: function () {
                var formattedDate = moment(this.user.birth, "YYYYMMDD").format("YYYY-MM-DD");
                this.user.birth = formattedDate;
            },
        	//비밀번호 정규식 유효성 검사
            validatePassword: function (event, field) {
                var self = this;
                var regex =  /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
                self.validateInput(event, field, regex, "비밀번호는 최소 8글자, 최대 16글자이어야 하며 하나 이상의 숫자, 영문자 및 특수문자를 각각 포함하여야 합니다!");
            },
            // 비밀번호 입력 필드 정규식 유효성 검사
            validateInput: function (event, field, validationRegex, errorMessage) {
                var self = this;
                var inputValue = event.target.value;
                console.log("validateInput 메소드 호출"); // 디버깅 문
                if (validationRegex.test(inputValue)) {
                    console.log("유효성 검사 성공:", inputValue); // 디버깅 문
                    self.checkPasswordMatch = true;
                    self.passwordErrorMessage = "";
                } 
                else {
                    console.error("유효성 검사 실패:", inputValue); // 디버깅 문
                    self.checkPasswordMatch = false;
                    self.passwordErrorMessage = errorMessage;
                }
            },
            // 비밀번호 확인 입력 필드 정규식 유효성 검사
           validateInput2: function (event, field, validationRegex, errorMessage) {
			    var self = this;
			    var inputValue = event.target.value;
			    // 나머지는 유효성 검사
			    if (validationRegex.test(inputValue)) {
			        console.log("유효성 검사 성공:", inputValue);
			        self.checkPassword2Match = true;
			        self.passwordConfirmErrorMessage = "";
			    } else {
			        console.error("유효성 검사 실패:", inputValue);
			        self.checkPassword2Match = false;
			        self.passwordConfirmErrorMessage = errorMessage;
			    }
			},
			fnPwdCheck : function(){
			    if (self.user.userPw !== self.user.userPw2) {
		            self.checkPassword2Match = true;
		            self.checkPasswordMatch = true;
		            self.checkPassword = false;
		            alert("비밀번호랑 비밀번호확인이 다릅니다.");
		        }else if(self.user.userPw == "" || self.user.userPw2 == ""){
		        	alert("비밀번호랑 비밀번호확인을 입력해 주세요");
		        } 
			    else {
		            self.checkPassword = true;
		        }
			},
            //정보수정하기
            fnModify: function () {
                var self = this;
                if(self.user.userId == ""){
            		alert("로그인 후 입장 가능합니다.");
            		window.location.href = "/user-login.do";
            	}
                if ((!self.user.userPw || !self.user.userPw.trim()) && (!self.user.userPw2 || !self.user.userPw2.trim())) {
                    alert("비밀번호와 비밀번호 확인을 모두 기입해 주세요.");
                    return;
                }
                if (self.user.userPw == "") {
                    alert("비밀번호를 기입해 주세요.");
                    return;
                }
                if (self.user.userPw2 == "") {
                    alert("비밀번호 확인 기입해 주세요.");
                    return;
                }
                if (self.user.userPw != self.user.userPw2) {
                    alert("비밀번호랑 비밀번호 확인이 다릅니다.");
                    return;
                }
                if (self.user.name == "") {
                    alert("이름을 입력해 주세요");
                    return;
                }
                if (self.user.nickName == "") {
                    alert("별명을 입력해 주세요");
                    return;
                }
                if (self.user.phone1 == "" || self.user.phone2 == "" || self.user.phone3 == "") {
                    alert("핸드폰 번호를 입력해 주세요");
                    return;
                }
                if (self.email1 == "" || self.email2 == "") {
                    alert("이메일을 입력해 주세요");
                    return;
                }
                if (self.user.birth == "") {
                    alert("생년월일을 입력해 주세요");
                    return;
                }
                self.user.email = self.email1 + "@" + self.email2;
                if (!confirm("정보를 수정하겠습니까?")) {
					return;
				}
                var nparmap = self.user;
                $.ajax({
                    url: "user-modify.dox",
                    dataType: "json",
                    type: "POST",
                    data: nparmap,
                    success: function (data) {
                    	//성공시 부모창 새로고침후 팝업창 닫기
						if (data.result == "success") {
							window.location.href = "/user-myPageView.do";
						} else {
							alert("다시 시도해주세요");
							location.reload(true);
							return;
						}
                    	
                });
            },
            selectEmail: function() {
            	var self = this;
    			self.email2 = self.email3;
    		},
        },
        created: function () {
            var self = this;
            if(self.user.userId == ""){
        		alert("로그인 후 입장 가능합니다.");
        		window.location.href = "/user-login.do";
        	}
            self.information();
        }
    });
</script>