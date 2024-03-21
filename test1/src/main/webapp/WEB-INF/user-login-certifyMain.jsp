<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>본인인증 메인 페이지</title>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	text-align: center;
}

h2 {
	color: #333;
}

p {
	color: #777;
	margin-bottom: 20px;
}

a {
	color: #3498db;
	text-decoration: none;
	cursor: pointer; /* 변경된 부분: 마우스 커서를 포인터로 변경 */
}
</style>
<body>
	<div id="app">
		<div class="container">
			<h2>문자 본인인증 서비스</h2>
			<p>안전하고 신속한 본인인증 서비스를 경험하세요.</p>
			<a @click="openCertificationPopup">본인인증 시작하기</a>
			<div>
				<a @click="fnback">메인페이지 이동하기</a>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {},
		methods : {
			// 팝업 창을 여는 로직을 여기에 작성
			openCertificationPopup : function() {
				var self = this;
				var leftPosition = (window.screen.width - 400) / 2; // 화면의 가로 중앙 위치
		    	var topPosition = (window.screen.height - 400) / 2; // 화면의 세로 중앙 위치
				// 'width=900,height=900'으로 설정된 부분 수정
				var popup = window.open('/user-login-certifySms.do',
						'Certification Popup', 'width=900,height=900,left=' + leftPosition + ',top=' + topPosition);

				// 주기적으로 팝업 창이 닫혔는지 확인
				var interval = setInterval(function() {
					if (popup && popup.closed) {
						clearInterval(interval); // 인터벌 중단
						// 팝업 창이 닫혔을 때 부모 창으로 이동
						window.location.href = '/user-login-certifyMain.do';
					}
				}, 1000); // 1초마다 확인
			},
			fnback: function() {
			    var self = this;
			    alert("본인 인증시 사용이 가능합니다 다시 로그인하여 인증해주시기 바랍니다");
			    // 서버에 로그아웃 요청을 보냄
			    $.ajax({
			        url: "/logout", // 로그아웃을 처리하는 서버의 URL
			        type: "POST",
			        success: function(response) {
			            // 세션을 제거하고 로그인 페이지로 이동
			            window.location.href = '/main.do';
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