<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/team_project_style.css">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>게시글 수정 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
}

table {
	margin: 10px;
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
	font-size: 14px;
	font-family: Arial, sans-serif;
}

th {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #f5f5f5;
}

button {
	margin-top: 10px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	transition: background-color 0.3s;
	font-family: Arial, sans-serif;
}

button:hover {
	background-color: #45a049;
}
</style>
</head>

<body>
	<div id="app">
		<div>
			제목 : <input type="text" v-model="title">
		</div>
		<div>
			내용 :
			<textarea row="30" cols="60" v-model="contents"></textarea>		
		</div>		
		<button @click="fnWrite">수정완료</button>
		{{boardNo}}
	</div>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			boardNo : "${map.boardNo}",
			title : "",
			contents : "",
		},
		methods : {
			fnSelectBoard: function(){
				var self = this;
				var nparmap = {
						boardNo : self.boardNo
					};
					$.ajax({
						url : "boardView.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.title = data.info.title;
							self.contents= data.info.contents;
						}
					});
			},
			fnWrite : function() {
				var self = this;
				var nparmap = {
					title : self.title,
					contents : self.contents,
					boardNo : self.boardNo
				};
				$.ajax({
					url : "boardEdit.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("작성되었습니다");
							$.pageChange("/boardList.do", {});
							//location.href = "/boardList.do"
						} else {
							alert("다시 시도해주세요");
						}
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnSelectBoard();
		}
	});
</script>