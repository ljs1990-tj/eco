<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/team_project_style.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Gaegu&family=IBM+Plex+Sans+KR&family=Orbit&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>목록 페이지</title>
<style>
button {
	margin-top: 10px;
	padding: 10px 20px;
	
	cursor: pointer;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	transition: background-color 0.3s;
}

body {
	font-family: "Gaegu", sans-serif;
}

li, ul {
	font-size: 24px;
}

button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div id="app">
		<ul>
			<li>이름: {{user.name}}</li>
			<li>아이디: {{user.userId}}</li>
			<li>성별: {{user.gender}}</li>
			<li>폰번호: {{user.phone1}} - {{user.phone2}} - {{user.phone3}}</li>
			<li v-for="item in list">작성한 글 내역 : {{item.title}}</li>
		</ul>
		<!-- <button @click="fnGetList">목록가기</button> -->
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			userId : "${map.userId}",//map = resultMap, controller의 boardUser의 map의 userId
			user : {},
			list : []
		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {
					userId : self.userId
				};
				$.ajax({
					url : "boardUser.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.user = data.user;
						self.list = data.list;
					}
				});
			},
			fnGetList : function() {
				var self = this;
				$.pageChange("/boardList.do", {});
			}

		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>