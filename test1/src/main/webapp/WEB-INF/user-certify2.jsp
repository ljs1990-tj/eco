<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>첫번째 페이지</title>
</head>
<style>
#header {
    padding-top: constant(safe-area-inset-top);
    padding-top: env(safe-area-inset-top);
    background-color: #f8f8f8;
    text-align: center;
}
</style>
<body>
	<div id="app">
		<header>
			<div>
				<h1>핸드폰 본인인증</h1>
			</div>
		</header>
		<section>
			
		</section>
		
		<footer>
		
		</footer>
		<hr>
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

		}
	});
</script>