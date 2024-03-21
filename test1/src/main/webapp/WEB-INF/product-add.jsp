<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>상품 등록</title>
</head>
<style>
.form-container {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
}

/* Form group styling */
.form-group {
	margin-bottom: 15px;
}

/* Label styling */
.form-group label {
	display: block;
	margin-bottom: 5px;
}

/* Form control styling */
.form-control {
	padding: 8px;
	width: 100%;
	box-sizing: border-box;
}

/* Button styling */
.btn-submit {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn-submit:hover {
	background-color: #0056b3;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>

<!-- Quill CDN -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>

<body>
	<div id="app" class="form-container">
		<div class="form-group">
			<label for="category">상품 카테고리:</label> <select id="category"
				class="form-control" v-model="code">
				<option value="All">선택</option>
				<option value="gluten">글루텐프리</option>
				<option value="local">로컬푸드</option>
				<option value="org">유기농</option>
				<option value="vegan">비건</option>
			</select>
		</div>

		<div class="form-group">
			<label for="productName">상품명:</label> <input type="text"
				id="productName" class="form-control" v-model="name">
		</div>
		<div class="form-group">
			<label for="productName">가격 :</label> <input type="text"
				id="productName" class="form-control" v-model="price">
		</div>
		<div class="form-group">
			<label for="productName">할인율 :</label> <input type="text"
				id="productName" class="form-control" v-model="Srate">
		</div>
		<div class="form-group">
			<label for="productName">적립율 :</label> <input type="text"
				id="productName" class="form-control" v-model="Prate">
		</div>

		<div>
			<tr>
				<td width="30%">메인 이미지<span style="color: red;">(*리스트에서
						썸네일에서 보일 이미지를 넣어주세요)</span> :
				</td>
				<td width="70%"><input type="file" id="file1" name="file1"
					accept=".jpg,.png,.gif"></td>
			</tr>
		</div>
		<div>
			<tr>
				<td width="30%">상세보기 제품 이미지<span style="color: red;">(*상세보기
						제품 이미지)</span><br> :
				</td>
				<td width="70%"><input type="file" id="file2" name="file2"
					accept=".jpg,.png,.gif" multiple></td>
			</tr>
		</div>
		<div>
			<tr>
				<td width="30%">상세보기 설명란에 들어갈 이미지<span style="color: red;">(*하단
						설명에 보일 이미지를 넣어주세요)</span> :
				</td>
				<td width="70%"><input type="file" id="file3" name="file3"
					accept=".jpg,.png,.gif" multiple></td>
			</tr>
		</div>


		<div>

			내용 :
			<div id="editor" style="height: 300px;"></div>

		</div>

		<div>
			배송정보 : <select v-model="trans">
				<option value="무료배송">무료배송</option>
				<option value="유료배송">유료배송</option>
			</select>

		</div>
		<div>
			품절 여부 : <select v-mode="sellYN">
				<option value="Y">재고있음</option>
				<option value="N">재고없음</option>


			</select>
		</div>
		<div>
			재고 갯수 : <input type="text" v-model="cnt">
		</div>

		<button @click="fnAdd">등록하기</button>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			code : "${map.code}",
			name : "",
			price : "",
			Srate : "",
			Prate : "",
			contents : "",
			trans : "무료배송",
			sellYN : "N",
			cnt : "",

		},
		methods : {
			fnAdd : function() {
				var self = this;
				if (self.code == "All") {
					alert("상품 카테고리를 선택해주세요.");
					return;
				}
				var nparmap = {
					code : self.code,
					name : self.name,
					price : self.price,
					Srate : self.Srate,
					Prate : self.Prate,
					contents : self.contents,
					trans : self.trans,
					sellYN : self.sellYN,
					cnt : self.cnt,
					kind : 1

				};
				$.ajax({
					url : "productAdd.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("등록완료");

							var files = $("#file1")[0].files;
							for (var i = 0; i < files.length; i++) {
								var formMain = new FormData();
								formMain.append("file1", files[i]);
								formMain.append("itemNo", data.itemNo);
								self.uploadMain(formMain);
							}

							var files2 = $("#file2")[0].files;

							for (var y = 0; y < files2.length; y++) {
								var formContents = new FormData();
								formContents.append("file2", files2[y]);
								formContents.append("itemNo", data.itemNo);
								self.uploadContents(formContents);
							}

							var files3 = $("#file3")[0].files;

							for (var z = 0; z < files3.length; z++) {
								var formContents = new FormData();
								formContents.append("file3", files3[z]);
								formContents.append("itemNo", data.itemNo);
								self.uploadDetailFile(formContents);
							}

							/*    location.href="AdminProductList.do"; */

						} else {
							alert("등록실패");
							var files = $("#file1")[0].files;
							var files2 = $("#file2")[0].files;
							var files3 = $("#file3")[0].files;
							for (var i = 0; i < files2.length; i++) {
								console.log(i + "번째 파일");
								console.log(files2[i]);
							}

						}

					}
				});
			}
			//파일 업로드
			,
			uploadMain : function(form) {
				var self = this;
				$.ajax({
					url : "/fileUploadMain.dox",
					type : "POST",
					processData : false,
					contentType : false,
					data : form,
					success : function(response) {

					}
				});
			},

			uploadContents : function(form) {
				var self = this;
				$.ajax({
					url : "/fileUploadContents.dox",
					type : "POST",
					processData : false,
					contentType : false,
					data : form,
					success : function(response) {

					}
				});
			},
			uploadDetailFile : function(form) {
				var self = this;
				$.ajax({
					url : "/fileUploadDetail.dox",
					type : "POST",
					processData : false,
					contentType : false,
					data : form,
					success : function(response) {

					}
				});
			}

		},
		mounted : function() {
			// Quill 에디터 초기화
			var quill = new Quill('#editor', {
				theme : 'snow',
				modules : {
					toolbar : [ [ {
						'header' : [ 1, 2, 3, 4, 5, 6, false ]
					} ], [ 'bold', 'italic', 'underline' ], [ {
						'list' : 'ordered'
					}, {
						'list' : 'bullet'
					} ], [ 'link', 'image' ], [ 'clean' ] ]
				}
			});

			// 에디터 내용이 변경될 때마다 Vue 데이터를 업데이트
			quill.on('text-change', function() {
				app.contents = quill.root.innerHTML;
			});
		},
		created : function() {
			var self = this;

		}
	});
</script>