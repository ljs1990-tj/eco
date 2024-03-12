<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/team_project_style.css">
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

li {
	display: inline-block;
	margin-left: 10px;
}

ul {
	padding: 5px 10px;
	cursor: pointer;
	background-color: #4CAF50;
	color: white;
	border-radius: 4px;
	display: inline-block;
	margin-right: 10px;
	font-size: 16px;
}

ul:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div id="app">
		<li>
			<ul v-for="item in boardList"
				:class="[kind==item.code ? 'select-tab' : 'tab']"
				@click="fnGetList(item.code)">{{item.name}}
			</ul>
		</li>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>사용자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>칼로리</th>
			</tr>
			<tr v-for="item in list">
				<td>{{ item.boardNo }}</td>
				<td><a href="javascript:;" @click="fnView(item.boardNo)"
					v-html="item.title"></a></td>
				<td>{{ item.userId }}</td>
				<td>{{ item.hits }}</td>
				<td>{{ item.cDateTime }}</td>
				<td>{{ item.uDateTime }}</td>
				<td>{{ item.kCal }}</td>
			</tr>
		</table>
		<button @click="fnWrite">글쓰기</button>
		<!-- <button @click="fnDelete">삭제</button> -->
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({ 
		el: '#app',
		data: {
			list: [],
			userId : "${userId}",
			kind : 1,
			boardList : ${boardList}
		},
		methods: {
			fnGetList: function(kind) {
				var self = this;
				self.kind = kind;
				var nparmap = {
							kind : kind
							};
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
				var self = this;
				$.pageChange("boardInsert.do", { kind : self.kind });
			},
			fnView: function(boardNo) {
				$.pageChange("boardView.do", { boardNo : boardNo });
			},
			fnDelete : function() {
				var self = this;
				if (!confirm("삭제할거냐")) {
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
		},
		created: function() {
			this.fnGetList(1);
			
		}
	});
</script>