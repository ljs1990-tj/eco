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
						{{user.userId}}
					</li>
					<li>
						<span>이름 : </span> 
						{{user.name}}
					</li>
					<li>
						<span>닉네임 : </span> 
						{{user.nickName}}
					</li>
					<li>
						<span>성별 : </span>
						{{user.gender}}
					</li>
					<li>
						<span>핸드폰 번호 : </span>
						{{user.phone1}} - {{user.phone2}} - {{user.phone3}}
					</li>
					<li>
						<span>이메일 : </span>
						{{user.email}}
					</li>
					<li>
						<span>생년월일 : </span>
						{{user.birth}}
					</li>
				</ul>
				<div>
					<button @click="fnUsermodify()">정보수정</button>
				</div>
			</fieldset>
		</div>
	</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
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
				gender : "",
				phone1 : "",
				phone2 : "",
				phone3 : "",
				email : "",
				birth : ""
			}
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
					}
				});
			},
			/* 개인정보 수정하기 */
			fnUsermodify : function() {
				var self = this;
				if(self.user.userId != ""){
					//$.pageChange("/user-myPageList.do", {"userId" : userId});
					 window.location.href = "/user-myPageList.do?userId=" + self.user.userId;
				}else{
					alert("로그인 후 입장 가능합니다.");
					 window.location.href = "/user-login.do";
					//$.pageChange("/user-login.do",{});
				}
			}
		},
		created: function() {
			  var self = this;
			  self.information();
			}
	});
</script>