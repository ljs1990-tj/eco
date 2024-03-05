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
</style>
<body>
	<div id="app">
		<div>
			<span>문자를 보내보자</span>
			<button @click="fnSmsTest()">문자 테스트</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {},
		methods : {
			fnSmsTest : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "send-one",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						if (data.statusCode == "2000") {
							alert("문자전송완료");

						} else {
							alert("문자전송실패");
						}
					}
				});
			}
		},
		created : function() {
			var self = this;

		}
	});
</script>