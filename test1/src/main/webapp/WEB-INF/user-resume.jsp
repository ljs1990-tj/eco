<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>회원 복구 페이지</title>
</head>
<body>
	<div id="app">
		<div>
			<div style="margin-bottom: 10px;">
				<div>
					<span style="font-weight: bold;">아이디:</span> 
					<input type="text" v-model="userId" @keyup.enter="fnUser" style="padding: 5px; margin-left: 10px;">
				</div>
				<div>
				<span style="font-weight: bold;">비밀번호 :</span>
				<input type="text" v-model="userPw" @keyup.enter="fnUser" style="padding: 5px; margin-left: 10px;">
				</div>
				<button @click="fnUser()" style="padding: 5px; background-color: #4CAF50; color: white; border: none; border-radius: 3px; cursor: pointer;">회원 복구</button>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			userId : "",
			userPw : ""
		},
		methods : {
			fnUser : function() {
				var self = this;
				if (self.userId === "") {
					alert("아이디를 입력해 주세요");
					return;
				}
				if (self.userPw === "") {
					alert("아이디를 입력해 주세요");
					return;
				}
				var nparmap = {
					userId : self.userId
				};
				$.ajax({
					url : "user-resume.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result === "success") {
							if (data.user && data.user.userId !== null) {
								if (self.userId === data.user.userId) {
									alert("아이디가 있습니다");
								} else {
									alert("다시 시도해주세요");
								}
							} else {
								alert("아이디가 없거나 잘못 기입했습니다");
							}
						} else {
							alert("오류 발생");
						}
					},
					error: function(xhr, status, error) {
	                    // 에러 발생 시 처리
	                    // 에러 페이지로 리다이렉션
	                    window.location.href = "/error-page"; // 에러 페이지의 URL로 리다이렉션
	                }

				});
			}
		},
		created : function() {
			var self = this;
		}
	});
</script>