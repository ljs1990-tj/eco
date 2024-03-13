<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/team_project_style.css">
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
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
		<tr>
			<th>게시판 선택</th>
				<td><select v-model="kind">
					<option value="1">공지사항</option>
					<option value="2">레시피게시판</option>
					<option value="3">문의게시판</option>
				</select></td>
		</tr>
		<div>
			제목 : <input type="text" v-model="title">
		</div>
		<div>
			내용 :
			<div id="editor" v-model="contents" style="height: 300px; "></div>
			<!-- v-model="contents" 이거 안먹힘 -->
		</div>		
		<button @click="fnWrite">수정완료</button>
		{{kind}}
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
			kind : "${map.kind}"
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
					boardNo : self.boardNo,
					kind : self.kind
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
		mounted: function () {
	        // Quill 에디터 초기화
	        var quill = new Quill('#editor', {
	            theme: 'snow',
	            modules: {
	                toolbar: [
	                    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
	                    ['bold', 'italic', 'underline'],
	                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
	                    ['link', 'image'],
	                    ['clean']
	                ]
	            }
	        });

	        // 에디터 내용이 변경될 때마다 Vue 데이터를 업데이트
	        quill.on('text-change', function() {
	            app.contents = quill.root.innerHTML;
	        });
	    },
		created : function() {
			var self = this;
			self.fnSelectBoard();
		}
	});
</script>