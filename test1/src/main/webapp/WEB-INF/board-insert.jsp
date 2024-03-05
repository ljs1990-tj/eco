<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/team_project_style.css">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<title>boardInsert 페이지</title>
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
		<!-- <tr>
			<th>파일 선택 :</th>
			<td><input type="file" id="file1" name="file1" accept=".jpg, .png, .gif"></td>
		</tr> -->
		<div>
			내용 :
			<!-- <textarea row="30" cols="60" v-model="contents"></textarea> 대신 vue-editor 코드 작성 가능-->
			<vue-editor v-model="contents"></vue-editor>
		</div>
		<button @click="fnWrite">작성완료</button>
	</div>

</body>
</html>
<script type="text/javascript">
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			userId : "",//변수선언
			//kind : "${map.kind}",//컨트롤러에서 가져온 map꺼내서 위에서 사용
			title : "",
			contents : ""
		}
		,
		components: {VueEditor}
		,
		methods : {
			fnWrite : function() {
				var self = this;
				var nparmap = {
					userId : self.userId,
					title : self.title,
					contents : self.contents,
					//kind : self.kind
					
				};
				$.ajax({
					url : "boardInsert.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("작성되었습니다");
							
							//게시글 작성하되 pk값 리턴 받기 data.boardNo = pk
							//console.log(data.boardNo);
							
/* 							var form = new FormData();
   	        				form.append( "file1",  $("#file1")[0].files[0] );
   	     					form.append( "boardNo",  data.boardNo); // 임시 pk
       						self.upload(form);   */
       						
							$.pageChange("/boardList.do", {});
							//location.href = "/boardList.do"
							
						} else {
							alert("다시 시도해주세요");
						}
					}
				});
			}/* ,
			upload : function(form) {
				var self = this;
				console.log(form);
				$.ajax({
					url : "/fileUpload.dox" //get 방식으로 담겨서 넘김 ?file1=file&idx=12324
					,
					type : "POST",
					processData : false,
					contentType : false,
					data : form,
					success : function(response) {

					}
				});
			} */
		},
		created : function() {
			var self = this;
		}
	});
</script>