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
  /*   body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f4;
        color: #333;
        margin: 0;
        padding: 20px;
    } */

    #app {
        max-width: 800px;
        margin: auto;
        background: white;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    h2 {
        color: #2c3e50;
        margin-bottom: 20px;
    }

    div {
        margin-bottom: 10px;
    }

    input[type=text],
    select,
    .vue-editor {
        width: 100%;
        padding: 8px;
        margin: 4px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type=file] {
        padding: 8px;
        margin: 4px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    button {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    button:hover {
        background-color: #45a049;
    }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<body>
	<div id="app">
		<div>
			<h2>상품 등록</h2>
			상품 카테고리 : 
			<select v-model="code">
				<option value="gluten">글루텐프리</option>
				<option value="local">로컬푸드</option>
				<option value="org">유기농</option>
				<option value="vegan">비건</option>
			</select>
			
		</div>
	
		<div>
			상품명 : <input type="text" v-model="name">
		</div>
		<div>
			가격 : <input type="text" v-model="price">
		</div>
		<div>
			할인율 : <input type="text" v-model="Srate">
		</div>
		<div>
			적립율 : <input type="text" v-model="Prate">
		</div>
		<tr>
			<td width="30%">메인 이미지 : </td>
			<td width="70%"><input type="file" id="file1" name="file1" accept=".jpg,.png,.gif" multiple></td>
		</tr>
		<div>
		<tr>
			<td width="30%">설명에 들어갈 이미지 : </td>
			<td width="70%"><input type="file" id="file2" name="file2" accept=".jpg,.png,.gif" multiple></td>
		</tr>
		</div>
		<tr>
			<td width="30%">상세보기 내용에 들어갈 이미지 : </td>
			<td width="70%"><input type="file" id="file3" name="file3" accept=".jpg,.png,.gif" multiple></td>
		</tr>
		<div>
			
			내용 : <vue-editor v-model="contents"></vue-editor>
			
		</div>
		
		<div>
			배송정보 :
			<select v-model="trans">
				<option value="무료배송">무료배송</option>
				<option value="유료배송">유료배송</option>
			</select>

		</div>
		<div>
			품절 여부 : 
			<select v-mode="sellYN">
				<option value="Y">재고있음</option>
				<option value="N">재고없음</option>
				
			
			</select>
		</div><div>
			재고 갯수 : <input type="text" v-model="cnt">
		</div>
		
	<button @click="fnAdd">등록하기</button>
	</div>
</body>
</html>
<script type="text/javascript">
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
var app = new Vue({
    el: '#app',
    data: {
    	code:"${map.code}",
    	name:"",
    	price:"",
    	Srate:"",
    	Prate:"",
    	contents:"",
    	trans:"무료배송",
    	sellYN:"N",
    	cnt:"",
    	
    	
    }
	, components: {VueEditor}
    , methods: {
    	fnAdd: function() {
            var self = this;
            if(self.code =="All"){
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
            		kind : 2
            		
            		
            };
            $.ajax({
                url:"productAdd.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	if(data.result=="success"){
                		alert("등록완료");
                		
                		var files = $("#file1")[0].files;
                		for(var i =0 ; i<files.length;i++){
                			var formMain = new FormData();
                			formMain.append( "file1",  files[i]);
                            formMain.append("itemNo", data.itemNo);
                            self.uploadMain(formMain);
                		}
                		
                		var files2 = $("#file2")[0].files;
                		
                        for(var y =0 ; y<files2.length;y++){
                        	var formContents = new FormData();
                        	 formContents.append("file2",files2[y]);
                        	 formContents.append("itemNo", data.itemNo);
                             self.uploadContents(formContents);
                        }
                        
                        var files3 = $("#file3")[0].files;
                        
                        for(var z =0 ; z<files3.length;z++){
                        	var formContents = new FormData();
                        	 formContents.append("file3",files3[z]);
                        	 formContents.append("itemNo", data.itemNo);
                             self.uploadDetailFile(formContents);
                        }
                		
                	}else{
                		alert("등록실패");
                		var files = $("#file1")[0].files;
                		var files2 = $("#file2")[0].files;
                		var files3 = $("#file3")[0].files;
                		for (var i =0;i<files2.length;i++){
                			console.log(i+"번째 파일");
                			console.log(files2[i]);
                		}
                	}
                	
                }
            });
        }
    //파일 업로드
    , uploadMain : function(form){
    	var self = this;
         $.ajax({
             url : "/fileUploadMain.dox"
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
             url : "/fileUploadContents.dox"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) { 
        	   
           }	           
       });
	},
	
	uploadDetailFile : function(form){
    	var self = this;
         $.ajax({
             url : "/fileUploadDetail.dox"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) { 
        	   
           }	           
       });
	}
	
	
    }
    , created: function() {
    	var self = this;
	
	}
});
</script>