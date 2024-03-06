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
body {
	background-color: rgb(229, 229, 229);
}

ul, li {
	list-style: none;
	margin-top: 10px;
	font-size: 13px;
}

.section-box1 {
	position: relative;
	width: 400px;
	height: 250px;
	background-color: #f0f0f0;
	border: 2px solid #ccc;
	border-radius: 10px;
	padding: 20px;
	margin: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.section-box2 {
 	position: relative;
    top: 20px; /* 원하는 위치로 조절 (상단 여백) */
    right: 0px; /* 원하는 위치로 조절 (우측 여백) */
    width: 400px;
    height: 250px;
    background-color: #f0f0f0;
    border: 2px solid #ccc;
    border-radius: 10px;
    padding: 20px;
    margin: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.section-box3 {
 	position: relative;
    top: 20px; /* 원하는 위치로 조절 (상단 여백) */
    right: 0px; /* 원하는 위치로 조절 (우측 여백) */
    width: 400px;
    height: 250px;
    background-color: #f0f0f0;
    border: 2px solid #ccc;
    border-radius: 10px;
    padding: 20px;
    margin: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.section-box4 {
 	position: relative;
    top: 20px; /* 원하는 위치로 조절 (상단 여백) */
    right: 0px; /* 원하는 위치로 조절 (우측 여백) */
    width: 400px;
    height: 250px;
    background-color: #f0f0f0;
    border: 2px solid #ccc;
    border-radius: 10px;
    padding: 20px;
    margin: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.button-container {
	position: relative;
	width: 440px;
	height: 40px;
	border: 2px solid #ccc;
	bottom: 15px;
	right: -20px;
}

/* .button-container button {
	width: 140px;
	height: 40px;
	cursor: pointer;
	border: none;
	border-radius: 3px;
	color: white;
	background-color: rgb(137, 200, 57);
}

.button-container button:hover {
	background-color: rgb(107, 170, 27);
} */
</style>
<body>
	<div id="app">
		<header> </header>
		<section>
		<!-- 첫번째 -->
			<div class="section-box1">
				<fieldset>
					<legend>개인 정보</legend>
					<ul>
						<li><span>아이디 : </span>{{user.userId}}</li>
						<li><span>이름 : </span>{{user.name}}</li>
						<li><span>닉네임 : </span>{{user.nickName}}</li>
						<li><span>성별 : </span>{{user.gender}}</li>
						<li><span>핸드폰 번호 : </span>{{user.phone1}} - {{user.phone2}} - {{user.phone3}}</li>
						<li><span>이메일 : </span>{{user.email}}</li>
						<li><span>생년월일 : </span>{{user.birth}}</li>
					</ul>
				</fieldset>
				<div>
					<span>내등급 : </span><span>{{user.userGrade}}</span> <span>포인트
						: </span><span>{{user.point}}</span>
				</div>
			</div>
			<div class="button-container">
				<button @click="">등급혜택</button>
				<button @click="fnUsermodify()">정보수정</button>
			</div>
			<!-- 두번째 -->
			<div class="section-box2">
				
			</div>
			<div class="button-container">
				<button @click="">기본주소추가</button>
				<button @click="">기본주소확정</button>
				<button @click="">기본주소수정</button>
				<button @click="">기본주소삭제</button>
			</div>
			<!-- 세번째 -->
			<div class="section-box3">
				<span>내가 쓴 레시피</span>
				<button>더보기?</button>
			</div>
			<!-- 네번째 -->
			<div class="section-box4">
				<span>내주문 내여</span>
				<button>더보기?</button>
			</div>
		</section>

	</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			user : {
				userId : "${userId}",
				userPw : "",
				userPw2 : "",
				name : "",
				nickName : "",
				gender : "",
				phone1 : "",
				phone2 : "",
				phone3 : "",
				email : "",
				birth : "",
				userGrade : "",
				point : ""

			}
		},
		methods : {
			/* 개인정보 가져오기 */
			information : function() {
				var self = this;
				// 세션 값이 없을 경우 로그인 페이지로 이동
				if (!self.user.userId) {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
					return;
				}
				var nparmap = self.user;
				$.ajax({
					url : "user-mypage.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.user = data.user;
					}
				});
			},
			/* 개인정보 수정 페이지 이동 */
			fnUsermodify : function() {
				var self = this;
				// 세션 값이 없을 경우 로그인 페이지로 이동
				if (!self.user.userId) {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
					return;
				}
				//패스워드 확인하는 팝업창
				var popup = window.open('user-myPage-Password.do',
						'Password Popup', 'width=500,height=500');

			}
		},
		created : function() {
			var self = this;
			self.information();
		}
	});
</script>