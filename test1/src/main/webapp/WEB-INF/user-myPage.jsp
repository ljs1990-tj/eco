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
					    <input type="text" v-model="user.userPw" @input="validatePassword($event, 'userPw')" required >
					    <div>
					        <span v-if="!checkPasswordMatch" style="color: red;">{{ passwordErrorMessage }}</span>
					    </div>
					</li>
					<li>
					    <span>비밀번호 확인 : </span> 
					    <input type="text" v-model="user.userPw2" @input="validatePassword($event, 'userPw2')" required >
					    <div>
					        <span v-if="!checkPasswordMatch" style="color: red;">{{ passwordConfirmErrorMessage }}</span>
					    </div>
					</li>
					
					<li>
						<span>이름 : </span> 
						<input type="text" v-model="user.name">
					</li>
					<li>
						<span>닉네임 : </span> 
						<input type="text" v-model="user.nickName">
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
							 <input type="text" v-model="user.phone1" required maxlength="3" @input="allowOnlyNumbers($event, 'phone1')">
        					-
       						<input type="text" v-model="user.phone2" required maxlength="4" @input="allowOnlyNumbers($event, 'phone2')">
       						-
        					<input type="text" v-model="user.phone3" required maxlength="4" @input="allowOnlyNumbers($event, 'phone3')">    
  
						</div>
					</li>
					<li>
						<span>이메일 : </span>
						<input type="text" v-model="user.email" placeholder="전부 다 적어주세요" required>
					</li>
					<li>
						<span>생년월일 : </span>
						 <input type="text" v-model="user.birth" placeholder="ex)19910101" @input="formatBirthDate" required>
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
				gender : "기타",
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
			//핸드폰 번호 숫자만 입력하기
			allowOnlyNumbers: function (event, field) {
		        // 입력된 값에서 숫자 이외의 모든 문자 제거
		        this.user[field] = event.target.value.replace(/[^0-9]/g, '');
		    },
		    //생년월일 예)1996-01-15표시
			 formatBirthDate: function () {
		         // 생년월일 형식 유도를 위한 로직
		        var birthDate = this.user.birth.replace(/[^0-9]/g, '');
		        var formattedBirthDate = birthDate.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
		        this.user.birth = formattedBirthDate;
		        },
		        //비밀번호 
		        validatePassword: function (event, field) {
			    var regex = /^[a-zA-Z0-9!@#$%^&*()-_+=]+$/;
			    this.user[field] = event.target.value.replace(/[^a-zA-Z0-9!@#$%^&*()-_+=]+/g, '');
			
			    if (!regex.test(this.user[field])) {
			        this.checkPasswordMatch = false;
			        if (field === 'userPw') {
			            this.passwordErrorMessage = "비밀번호는 특수 문자, 영어, 숫자만을 포함해야 합니다.";
			            this.passwordConfirmErrorMessage = "";
			        }else {
			        this.checkPasswordMatch = true;
			        this.passwordErrorMessage = "";
			        this.passwordConfirmErrorMessage = "";
			    }
			        if (field === 'userPw2') {
			            this.passwordConfirmErrorMessage = "비밀번호 확인은 특수 문자, 영어, 숫자만을 포함해야 합니다.";
			            this.passwordErrorMessage = "";
			        }else {
				        this.checkPasswordMatch = true;
				        this.passwordErrorMessage = "";
				        this.passwordConfirmErrorMessage = "";
				    }
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
					        // 예: window.location.reload();
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