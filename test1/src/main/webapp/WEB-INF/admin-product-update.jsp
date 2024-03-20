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
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<body>
	<div id="app" class="form-container"> 
		<div class="form-group">
        <label for="category">상품 카테고리:</label>
        <select id="category" class="form-control" v-model="code">
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
			<div  style="height: 300px;" type="text" id="editor"></div>

		</div>

		
		<div>
		현재 리스트 썸네일 이미지 : 
		<div>
		
		<template v-for="item in mainFile">
		<img :src="item.filePath+item.fileName" alt="썸네일" style="width: 150px;height: 150px">
		<button @click="fnFileDelete(item.fileNo)">◀X</button>
		</template>
		</div>
		</div>
		
		
		<div>
		현재 컨텐츠 썸네일 이미지 : 
		<div>
		<template v-for="item in contentsFile">
		<img :src="item.filePath+item.fileName" style="width: 150px;height: 150px">
		<button @click="fnFileDelete(item.fileNo)">◀X</button>
		</template>
		</div>
		
	
	<button @click="ProductUpdate()">등록하기</button>
	<button @click="fnReturn">돌아가기</button>
	</div>
</body>
</html>
<script type="text/javascript">


var app = new Vue({
    el: '#app',
    data: {
    	itemNo : "${map.itemNo}",
    	code:"",
    	name:"",
    	price:"",
    	Srate:"",
    	Prate:"",
    	contents:"",
    	trans:"",
    	sellYN:"",
    	cnt:"",
    	mainFile : [],
    	contentsFile : []
    	
    	
    }
	
    , methods: {
    	fnView: function() {
            var self = this;
            var nparmap = {
            		itemNo : self.itemNo
            };
            $.ajax({
                url:"AdminProductView.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data);
                	if(data.result=="success"){
                		self.code = data.item.code;
                		self.name = data.item.itemName;
                		self.price = data.item.price;
                		self.Srate = data.item.sRate;
                		self.Prate = data.item.pRate;
                		self.contents = data.item.contents;
                		self.trans = data.item.transInfo;
                		self.sellYN = data.item.sellYn;
                		self.cnt = data.item.cnt;
                		var mainCnt = 0;
                		var contentsCnt = 0;
                		for(var i=0 ; i<data.filelist.length;i++){
                			if(data.filelist[i].kind == "1"){
                				self.mainFile[mainCnt] = data.filelist[i];
                				mainCnt++;
                			}if(data.filelist[i].kind =="2"){
                				self.contentsFile[contentsCnt] = data.filelist[i];
                				contentsCnt++;
                			}
                		}console.log(self.mainFile);
                		console.log(self.contentsFile);
                	}
                	
                }
            });
        },
        ProductUpdate : function(){
                var self = this;
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
                		itemNo : self.itemNo	
                };
                $.ajax({
                    url:"AdminProductUpdate.dox",
                    dataType:"json",
                    type: "POST",
                    data: nparmap,
                    success: function(data) {
                    	if(data.result=="success"){
                    		alert("등록완료");
                    		
                    		var files = $("#file1")[0].files;
							for (var i = 0; i < files.length; i++) {
								var formMain = new FormData();
								formMain.append("file1", files[i]);
								formMain.append("itemNo", self.itemNo);
								self.uploadMain(formMain);
							}

							var files2 = $("#file2")[0].files;

							for (var y = 0; y < files2.length; y++) {
								var formContents = new FormData();
								formContents.append("file2", files2[y]);
								formContents.append("itemNo", self.itemNo);
								self.uploadContents(formContents);
							}

							var files3 = $("#file3")[0].files;

							for (var z = 0; z < files3.length; z++) {
								var formContents = new FormData();
								formContents.append("file3", files3[z]);
								formContents.append("itemNo", self.itemNo);
								self.uploadDetailFile(formContents);
							}
                    		
                    		/* 이 부분에 이미지를 수정하는 작업을 해줄것임 */
                            
                           /*  location.href="AdminProductList.do"; */
                            
                    	}else{
                    		alert("등록실패");
                    	}
                    	
                    }
                });
        }
       
	    , //파일 업로드
		
		uploadMain : function(form) {
			var self = this;
			$.ajax({
				url : "/fileUploadMain.dox",
				type : "POST",
				processData : false,
				contentType : false,
				data : form,
				success : function(response) {
						console.log(response);
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
					console.log(response);
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
					console.log(response);
				}
			});
		},

	
		fnFileDelete : function(fileNo){
            var self = this;
            var nparmap = {
            		
            		fileNo : fileNo	
            };
            $.ajax({
                url:"fileDelete.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	if(data.result=="success"){
                		alert("삭제완료");
                		$.pageChange("/AdminProductUpdate.do",{itemNo : self.itemNo});
                        
                	}
                	
                }
            });
    },
    fnReturn : function(){
    	var self = this;
    		$.pageChange("/AdminProductList.do", {code : self.code});
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
     created: function() {
    	var self = this;
		self.fnView();
	}
});
</script>