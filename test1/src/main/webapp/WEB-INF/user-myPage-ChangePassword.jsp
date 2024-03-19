<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>비밀번호 변경</title>
</head>
<body>
	<div id="app"
		style="max-width: 400px; margin: 50px auto; padding: 20px; border: 1px solid #ccc; border-radius: 8px; background-color: #f9f9f9;">
		<div style="margin-bottom: 20px;">
			<div style="margin-bottom: 10px;">
				<label for="currentPassword">기존 비밀번호:</label> 
				<input type="password" id="currentPassword" v-model="currentPassword" style="padding: 8px; width: 100%; box-sizing: border-box;">
			</div>
			<div style="margin-bottom: 10px;">
				<label for="newPassword">변경할 비밀번호:</label> 
				<input type="password" id="newPassword" v-model="newPassword" @input="validatePassword" style="padding: 8px; width: 100%; box-sizing: border-box;">
				<span v-if="!isPasswordValid && newPassword !== ''" style="color: red; font-size: 12px;">새 비밀번호는 8자 이상이어야 하며, 대문자, 소문자, 숫자, 특수문자를 모두 포함해야 합니다.</span>
			</div>
			<div style="margin-bottom: 10px;">
				<label for="confirmPassword">변경할 비밀번호 확인:</label>
				<input type="password" id="confirmPassword" v-model="confirmPassword" @input="validatePassword" style="padding: 8px; width: 100%; box-sizing: border-box;">
				<span v-if="!isPasswordMatch && confirmPassword !== ''" style="color: red; font-size: 12px;">비밀번호와 비밀번호 확인이 일치하지 않습니다.</span>
			</div>
			<div>
				<button @click="changePassword"  style="padding: 10px 20px; background-color: #007bff; color: #fff; border: none; border-radius: 4px; cursor: pointer;">변경하기</button>
				<button @click="closePopup" style="padding: 10px 20px; background-color: #ccc; color: #fff; border: none; border-radius: 4px; cursor: pointer;">창 닫기</button>
			</div>
		</div>
	
	</div>
</body>
<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            list: {},
            userId: "${userId}",
            currentPassword: "",
            newPassword: "",
            confirmPassword: "",
            isPasswordValid: true,
            isPasswordMatch: true
        },
        methods: {
        	 validatePassword: function() {
                 // 비밀번호 유효성을 검사하는 메서드
                 const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
                 this.isPasswordValid = passwordRegex.test(this.newPassword);
                 this.isPasswordMatch = this.newPassword === this.confirmPassword;
             },
             
        	fnUser: function() {
        	    var self = this;
        	    var nparmap = {
        	        userId: self.userId
        	    };
        	    $.ajax({
        	        url: "user-mypage.dox",
        	        dataType: "json",
        	        type: "POST",
        	        data: nparmap,
        	        success: function(data) {
        	            console.log(data);
        	            self.list = data.user;
        	            console.log(self.list.userPw);
        	        }
        	    });
        	},
        	changePassword: function() {
                // 비밀번호 변경을 처리하는 메서드
                var self = this;
                if(self.list.userPw != self.currentPassword){
                    alert("가입하신 비밀번호랑 틀립니다 다시 입력해 주세요");
                    self.userPw = "";
                    self.newPassword = "";
                    self.currentPassword = "";
                    return;
                }
                if(self.currentPassword == ""){
                    alert("기존 비밀번호를 입력해 주세요.");
                    return;
                }
                if(self.newPassword == ""){
                    alert("변경할 비밀번호를 입력해주세요.");
                    return;
                }
                if(self.confirmPassword == ""){
                    alert("변경할 비밀번호확인를 입력해주세요");
                    return;
                }
                var regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
				if (!regex.test(self.newPassword)) {
					alert("비밀번호는 최소 8글자, 최대 16글자이고 하나 이상의 숫자, 영문자 및 특수문자를 포함해야 합니다.");
					self.newPassword = "";
					return;
				}
				var regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
				if (!regex.test(self.currentPassword)) {
					alert("비밀번호는 최소 8글자, 최대 16글자이고 하나 이상의 숫자, 영문자 및 특수문자를 포함해야 합니다.");
					self.currentPassword = "";
					return;
				}
               if(self.newPassword != self.confirmPassword ){
            	   alert("변경할 비밀번호랑 비밀번호확인이 맞지 않습니다.");
            	   self.newPassword = "";
                   self.currentPassword = "";
                   confirmPassword = "";
                   return;
               }
               if (!confirm("비밀번호를 수정하겠습니까?")) {
   				return;
   				}
                // 변경된 비밀번호를 서버로 전송하는 AJAX 요청
                var nparmap = {
                    userId : self.userId,
                    userPw : self.newPassword
                };
                $.ajax({
                    url:"changePassword.dox",
                    dataType:"json",
                    type: "POST",
                    data: nparmap,
                    success: function(data) {
                        if(data.result == "success"){
                            // 비밀번호 변경 성공 시 처리
                            console.log(data);
                            alert("비밀번호가 변경되었습니다. 다시 로그인 부탁드립니다.");
                            // 변경 후 창을 닫음
                            window.opener.location.href = "/user-login.do";
                            self.closePopup();
                        }else{
                            alert("다시 시도해주세요");
                            location.reload(true);
                            return;
                        }
                    },
                    error: function(xhr, status, error) {
                        // 비밀번호 변경 실패 시 처리
                        console.error(error);
                        alert("비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
                    }
                });
            },
            closePopup: function() {
                // 팝업을 닫는 메서드
                window.opener.location.reload();
                window.close();
            }
        },
        created: function() {
            // 초기화 메서드
             var self = this;
             self.fnUser();
        },
        computed: {
            isFormValid: function() {
                // 폼 유효성을 검사하는 계산된 속성
                return this.isPasswordValid && this.isPasswordMatch;
            }
        }
    });
</script>
</html>