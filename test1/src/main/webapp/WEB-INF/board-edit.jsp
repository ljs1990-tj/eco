<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
	<%@ include file="layout/header.jsp"%>
	<div id="app">
		<tr>
			<th>게시판 선택</th>
			<td><select v-model="kind">
					<option value="1">공지사항</option>
					<option value="2">레시피게시판</option>
			</select></td>
		</tr>
		<div>
			제목 : <input type="text" v-model="title">
		</div>
		<div v-if="kind == '2'" class="fileImage">
			<tr>
				<td width="30%">메인 이미지 :</td>
				<td width="70%"><input type="file" id="file1" name="file1"
					accept=".jpg,.png,.gif"></td>
			</tr>
			<div>
				<tr>
					<td width="30%">설명에 들어갈 이미지 :</td>
					<td width="70%"><input type="file" id="file2" name="file2"
						accept=".jpg,.png,.gif" multiple></td>
				</tr>
			</div>
		</div>
		<div>
			내용 :
			<div id="editor" v-model="contents" style="height: 300px;"></div>
		</div>
		<div class="editButton" style="text-align: center; margin: 20px;">
			<button @click="fnEdit">수정완료</button>
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
					        quill.root.innerHTML = data.info.contents;
						}
					});
			},
			fnEdit : function() {
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
							alert("수정되었습니다");
							
						if(self.kind == 2) {
	                		var files = $("#file1")[0].files;
                			var formMain = new FormData();
                			formMain.append( "file1",  files[0]);
                            formMain.append("boardNo", data.boardNo);
                            self.uploadMain(formMain);
	                		
	                		var files2 = $("#file2")[0].files;
	                        for(var y =0 ; y<files2.length;y++){
	                        	var formContents = new FormData();
	                        	 formContents.append("file2",files2[y]);
	                        	 formContents.append("boardNo", data.boardNo);
	                             self.uploadContents(formContents);
	                        }
						}
	                        
	                        setTimeout(() => {
	                        	$.pageChange("/boardList.do", {kind: self.kind});
	                        }, 1000);
	                        
						} else {
							alert("다시 시도해주세요");
						}
					}
				});
			},
			uploadMain : function(form){
		    	var self = this;
		         $.ajax({
		             url : "/boardFileUploadMain.dox"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) { 
		        	   
		           }	           
		       });
			},
			
			uploadContents : function(form){
		    	var self = this;
		         $.ajax({
		             url : "/boardFileUploadContents.dox"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) { 
		        	   
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