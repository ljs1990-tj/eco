<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>상품 문의</title>
</head>
<style>
	body, html {
		height: 100%;
		margin: 0;
		font-family: 'Arial', sans-serif;
	}
	
	#app {
		background-color: white;
		width: 850px;
		height: 650px;
		margin-left: auto;
		margin-right: auto;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		padding: 20px;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	
	.inquiry-form {
		background-color: white;
		border-radius: 5px;
		padding: 20px;
		margin-bottom: 20px;
	}
	
	.inquiry-form h2 {
		color: #333;
		margin-bottom: 15px;
	}
	
	.form-field {
		margin-bottom: 10px;
	}
	
	.form-field label {
		display: block;
		margin-bottom: 5px;
	}
	
	.form-field input, .form-field textarea, .form-field select {
		width: 100%;
		padding: 10px;
		border-radius: 5px;
		border: 1px solid #ddd;
	}
	
	.form-field textarea {
		resize: vertical;
		height: 300px;
        resize: none;
	}
	
	.submit-btn {
		background-color: #44c767;
		color: white;
		border: none;
		padding: 10px 20px;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
		transition: background-color 0.3s ease;
	}
	
	.submit-btn:hover {
		background-color: #39a857;
	}

    .cancle-btn {
		background-color: #ffffff;
		color: rgb(128, 128, 128);
		border: 1px solid rgb(184, 184, 184);
		padding: 10px 20px;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
		transition: background-color 0.3s ease;
	}
	
	.cancle-btn:hover {
		background-color: #e6e6e6;
	}
	
</style>
<body>
	<div id="app">
		<div class="inquiry-form">
			<h2>상품 문의하기</h2>
			<div class="form-field">
				<label for="product-title">제목</label>
				<input type="text" id="product-title" placeholder="제목 입력" v-model="title">
			</div>
			<div class="form-field">
				<label for="inquiry">문의 내용</label>
				<textarea id="inquiry" placeholder="문의하실 내용을 입력해주세요." v-model="qaContents"></textarea>
			</div>
			<button class="submit-btn" @click="fnInsertQa(itemNo, userId)">문의하기</button>
            <button class="cancle-btn" @click="cancleBtnClick">취소</button>
		</div>
		
	</div>
</body>
<script type="text/javascript">
	var app = new Vue({
	    el: '#app',
	    data: {
	    	itemNo: "${map.itemNo}",
	    	userId: "${map.userId}",
	    	title: "",
	    	qaContents: ""
	    }
	    , methods: {
	    	fnInsertQa: function(itemNo, userId) {
	            var self = this;
    
	            if (self.title.trim() === "") {
	                alert("제목을 입력해주세요.");
	                return;
	            } else if (self.qaContents.trim() === "") {
	                alert("문의 내용을 입력해주세요.");
	                return;
	            }
	            
	            if(confirm("등록하시겠습니까?")){
		            var nparmap = {
		            	title: self.title,
		            	qaContents: self.qaContents,
		            	itemNo : self.itemNo,
		            	userId : self.userId
		            };
		            $.ajax({
		                url:"addQa.dox",
		                dataType:"json",
		                type: "POST",
		                data: nparmap,
		                success: function(data) {
		                	if(data.result == "success"){
		                		alert("문의가 등록됐습니다.");
		                	} else{
		                		alert("오류가 발생했습니다 다시 등록해주세요.");
		                	} 
		                }
		            });
	        	}
	    	},
	    	/* 취소 버튼 누를 떄 닫히게 하기 */
	    	cancleBtnClick: function() {
	            try {
	                window.close();
	            } catch (e) {
	                alert("이 페이지는 스크립트로 닫을 수 없습니다. 브라우저에서 직접 창을 닫아주세요.");
	            }
	        }
	    }
	    , created: function() {
	    	var self = this;
		}
	});
</script>
</html>