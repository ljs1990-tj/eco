<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>첫번째 페이지</title>
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
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>사용자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>칼로리</th>
			</tr>
			<tr v-for="item in list" @click="fnView(item.boardNo)">
				<td>{{ item.boardNo }}</td>
				<td>{{ item.title }}</td>
				<td>{{ item.contents }}</td>
				<td>{{ item.userId }}</td>
				<td>{{ item.hits }}</td>
				<td>{{ item.cDateTime }}</td>
				<td>{{ item.uDateTime }}</td>
				<td>{{ item.kCal }}</td>
			</tr>
		</table>
		<button @click="fnWrite">글쓰기</button>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({ 
		el: '#app',
		data: {
			list: []
		},
		methods: {
			fnGetList: function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url: "boardList.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function(data) { 
						console.log(data);
						self.list = data.list;
					}
				}); 
			},
			fnWrite: function() {
				$.pageChange("boardInsert.do", { userId: userId });
			},
			fnView: function(boardNo) {
				$.pageChange("boardView.do", { boardNo: boardNo });
			}
		},
		created: function() {
			this.fnGetList();
		}
	});
</script>