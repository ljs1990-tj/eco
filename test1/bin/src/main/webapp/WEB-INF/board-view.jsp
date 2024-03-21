<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap-min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Gaegu&family=IBM+Plex+Sans+KR&family=Orbit&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>첫번째 페이지</title>
</head>
<style>
div#app {
	text-align: center;
}

body, button {
	font-family: "Gaegu", sans-serif;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin: 10px auto;
}

th, td {
	border-top: none;
	border-bottom: 1px solid #ddd;
	border-right: none;
	padding: 8px;
	text-align: center;
	font-size: 14px;
	font-family: "Orbit", sans-serif;
	font-weight: 400;
	cursor: default;
}

tr:hover {
	background-color: #f5f5f5;
}

tr {
	border: top 1px solid black;
	border-bottom: 1px solid black;
}

button {
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	transition: background-color 0.3s;
	
}

button:hover {
	background-color: #45a049;
}

li {
	display: inline-block;
}

td {
	height: 70px;
}

a {
	text-decoration: none;
}
.buttons {
    text-align: center;
    margin: 30px;
    font-family: "Orbit", sans-serif;    
}

</style>
<body>
	<%@ include file="layout/header.jsp"%>
	<div id="app">
		<table style="width: 60%;">
			<tr>
				<th width="20%">제목</th>
				<td width="80%">{{info.title}}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>{{info.nickName}}</td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td>{{info.cDateTime}}</td>
			</tr>
			<tr>
				<th>수정날짜</th>
				<td>{{info.uDateTime}}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>{{info.hits}}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<template v-if="kind == '2'">
						<template v-for="item in fileList">
							<template v-if="item.kind == 2">
								<img :src="item.path" alt="">
							</template>
						</template>
					</template> <span v-html="info.contents"> {{info.contents}} </span>
				</td>
			</tr>
		</table>
		<div class="buttons" v-if="info.userId == userId || userType == 'A'">
			<button @click="fnDelete">삭제</button>
			<button @click="fnEdit">수정</button>
			<button @click="fnList(kind)">목록으로 가기</button>
		</div>

	</div>
	<%@ include file="layout/footer.jsp"%>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			boardNo : "${map.boardNo}",
			info : {},
			userId : "${userId}",
			kind : "${map.kind}",
			userType : "${userType}",
			fileList : []
		},
		methods : {
			fnView : function() {
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
						console.log(data);
						self.info = data.info;
						// 3. self.fileList에 data에 있는 fileList를 넣기
						self.fileList = data.fileList;
					}
				});
			},
			fnDelete : function() {
				var self = this;
				if (!confirm("삭제하겠습니까")) {
					return;
				}
				var nparmap = {
					boardNo : self.boardNo
				};
				$.ajax({
					url : "boardDelete.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						/* self.info = data.info; */
						if (data.result == "success") {
							alert("삭제되었습니다");
							$.pageChange("/boardList.do", {});
							//location.href = "/boardList.do"
						} else {
							alert("다시 시도해주세요");
						}
					}
				});
			},
			fnList : function(kind) {
				$.pageChange("/boardList.do", {
					code : kind
				});
			},
			fnEdit : function() {
				var self = this;
				$.pageChange("/boardEdit.do", {
					boardNo : self.boardNo,
					kind : self.kind
				});
			}
		
		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});
</script>