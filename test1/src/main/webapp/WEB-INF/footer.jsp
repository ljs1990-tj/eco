<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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