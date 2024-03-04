<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>마이 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>
			<fieldset>
				<ul>
					<li>
						<span>아이디 : </span> 
						<input type="text" v-model="user.userId" disabled>
					</li>
					<li>
					    <span>비밀번호 : </span> 
					    <input type="text" v-model="user.userPw" maxlength="16" @input="validatePassword($event, 'userPw')" required >
					    <div>
					        <span v-if="!checkPasswordMatch" style="color: red;">{{ passwordErrorMessage }}</span>
					    </div>
					</li>
					<li>
					    <span>비밀번호 확인 : </span> 
					    <input type="password" v-model="user.userPw2" maxlength="16" @input="validatePassword($event, 'userPw2')" required >
					    <div>
					        <span v-if="!checkPasswordMatch" style="color: red;">{{ passwordConfirmErrorMessage }}</span>
					    </div>
					</li>
					
					<li>
						<span>이름 : </span> 
						<input type="text" v-model="user.name"  maxlength="30">
					</li>
					<li>
						<span>닉네임 : </span> 
						<input type="text" v-model="user.nickName"  maxlength="30">
					</li>
					<li>
						<span>성별 : </span>
						<div>
							<input type="radio" name="gender" value="남성" v-model="user.gender">남 
							<input type="radio"name="gender" value="여성" v-model="user.gender">여
							<input type="radio" name="gender" value="기타" v-model="user.gender">기타
						</div>
					</li>
					<li>
						<span>핸드폰 번호 : </span>
						<div>
							 <input type="text" v-model="user.phone1"  maxlength="3" @input="allowOnlyNumbers($event, 'phone1')">-
       						<input type="text" v-model="user.phone2"  maxlength="4" @input="allowOnlyNumbers($event, 'phone2')">-
        					<input type="text" v-model="user.phone3"  maxlength="4" @input="allowOnlyNumbers($event, 'phone3')">    
  
						</div>
					</li>
					<li>
						<span>이메일 : </span>
						<input type="text" v-model="user.email" placeholder="이메일 직접입력" >
					</li>
					<li>
						<span>생년월일 : </span>
						 <input type="text" v-model="user.birth" placeholder="ex)19910101" @input="formatBirthDate" >
					</li>
				</ul>
				<div>
					<button @click="fnmodify()">수정하기</button>
				</div>
			</fieldset>
		</div>
	</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			user : {
				userId : "test123",
				userPw : "",
				userPw2 : "",
				name : "",
				nickName : "",
				gender : "여성",
				phone1 : "",
				phone2 : "",
				phone3 : "",
				email : "",
				birth : ""
			},
			checkPasswordMatch: true,
	        passwordErrorMessage: "",
	        passwordConfirmErrorMessage: ""
		},
		methods : {
			/* 개인정보 가져오기 */
			information : function() {
				var self = this;
				
				var nparmap = self.user;
				$.ajax({
					url : "user-mypage.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.user = data.user;
						self.user.userPw = '';
						self.user.userPw2 = '';
					}
				});
			},
			// 핸드폰 번호 숫자만 입력하기
			allowOnlyNumbers: function (event, field) {
		        // 입력된 값에서 숫자 이외의 모든 문자 제거
		        this.user[field] = event.target.value.replace(/[^0-9]/g, '');
		    },
		    // 생년월일 예시: 1996-01-15 표시
			formatBirthDate: function () {
		        // moment.js를 사용하여 날짜 포맷팅
		        var formattedDate = moment(this.user.birth, "YYYYMMDD").format("YYYY-MM-DD");
		        this.user.birth = formattedDate;
		    },
		    // 비밀번호 검증
		    validatePassword: function (event, field) {
			    var regex = /^[a-zA-Z0-9!@#$%^&*()-_+=]+$/;
			    this.user[field] = event.target.value.replace(/[^a-zA-Z0-9!@#$%^&*()-_+=]+/g, '');
			
			    if (!regex.test(this.user[field])) {
			        this.checkPasswordMatch = false;
			        if (field === 'userPw') {
			            this.passwordErrorMessage = "비밀번호는 최소 8글자, 최대 16글자이고 하나 이상의 숫자, 영문자 및 특수문자를 각각 포함되어야 합니다!";
			            this.passwordConfirmErrorMessage = "";
			        }
			    } else {
			        this.checkPasswordMatch = true;
			        this.passwordErrorMessage = "";
			        this.passwordConfirmErrorMessage = "";
			    }
			},
			fnmodify : function() {
				var self = this;
			    // 추가된 유효성 검사
			    if ((!self.user.userPw || !self.user.userPw.trim()) && (!self.user.userPw2 || !self.user.userPw2.trim())) {
			        alert("비밀번호와 비밀번호 확인을 모두 기입해 주세요.");
			        return;
			    }
			    if(self.user.userPw == ""){
			    	alert("비밀번호를 기입해 주세요.");
			    	return;
			    }
			    if(self.user.userPw2 == ""){
			    	alert("비밀번호 확인 기입해 주세요.");
			    	return;
			    }
			    if(self.user.userPw != self.user.userPw2){
			    	alert("비밀번호랑 비밀번호 확인이 다릅니다.");
			    	return;
			    }
			
				var nparmap = self.user;
				$.ajax({
					url : "user-modify.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(self.user);
						   // 적절한 처리 추가
				        alert("사용자 정보가 수정되었습니다.");
				        // 또는 페이지 리로드 또는 다른 동작 수행
				       location.href = "main.do";
				    },
				    error: function (error) {
				        // 오류 처리 추가
				        alert("사용자 정보 수정에 실패했습니다. 다시 시도하세요.");
				    }
				});
		    }
		},
		created: function() {
			  var self = this;
			  self.information();
			}
	});
</script>