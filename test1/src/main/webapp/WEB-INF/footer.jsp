<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">  <!-- 아이콘 라이브러리 -->
	<title>푸터</title>
</head>
<style>
	.site-footer {
		background-color: #f1f1f1;
		color: #333; 
		padding: 20px 0; 
	}
	
	.container {
		width: 80%; 
		margin: 0 auto; 
		display: flex; 
		justify-content: space-between; 
	}
	
	.footer-service-center h3 {
		margin: 0 0 10px; 
	}
	
	.footer-service-center p, .footer-extra-info p {
		margin: 5px 0;
	}
	p {
		font-size: 12px;
	}
	
	.social-icons {
		text-align: center;
		margin-top: 20px;
	}
	
	.social-icons a {
		color: #333;
		margin: 0 10px;
		font-size: 24px; 
	}
	
	.social-icons a:hover {
		color: #e44d26;
	}
</style>
<body>
	<div id="app">
		<footer class="site-footer">
			<div class="container">
				<div class="footer-service-center">
					<h3>고객행복센터</h3>
					<h2>1644-1107</h2>
					<h4>월-금요일 오전 7시 - 오후 6시</h4>
				</div>
				<div class="footer-extra-info">
					<span>
						기타문의 <strong>help@corp.com</strong>					
					</span>
					
					<p>법인명(상호):주식회사 | 사업자등록번호:261-81-23557</p>
					<p>주소:인천 부평 엄청 큰 빌딩 7층 | 대표이사: 없어요</p>
					<p>채용문의 : recruit@anhalae.com</p>
					
					<!-- 소셜 미디어 아이콘 -->
					<div class="social-icons">
						<a href="https://instagram.com" target="_blank" title="인스타그램"><i class="fab fa-instagram"></i></a>
						<a href="https://youtube.com" target="_blank" title="유튜브"><i class="fab fa-youtube"></i></a>
						<a href="https://line.me/ko/" target="_blank" title="라인"><i class="fab fa-line"></i></a>
						<a href="https://www.facebook.com/" target="_blank" title="페이스북"><i class="fab fa-facebook-messenger"></i></a>
					</div>
				</div>
				<!-- 추가적인 정보를 넣을 예정 -->
			</div>
		</footer>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "test.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>