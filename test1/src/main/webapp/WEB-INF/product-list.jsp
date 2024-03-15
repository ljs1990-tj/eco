<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>상품 페이지</title>
</head>
<style>
    .container {
        margin: 0 auto; 
        padding: 20px; 
        max-width: 1200px; 
        border-style: none;
        background-color: #ffffff;
    }

    .banner {
        width: 100%; 
        margin-bottom: 20px; 
    }
    .banner img{
        width: 100%;
        height: 300px;

    }

    .product-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start; /* flex-start로 변경하여 좌측 정렬 */
        gap: 10px;
    }

    .product-item {
        width: calc(25% - 10px); /* 4개의 상품이 한 줄에 표시되도록 설정 */
        display: flex; /* flexbox를 사용 */
        flex-direction: column; /* 세로 방향으로 항목 정렬 */
        margin-bottom: 20px;
        background-color: #fff;
        border-style: none;
        cursor: pointer;
        overflow: hidden;
    }

    .product-item:hover {
        box-shadow: 0 2px 4px rgba(0,0,0,0.1); 
    }

    .product-item img {
        width: 100%; 
        height: auto; 
        object-fit: cover; 
        aspect-ratio: 1 / 1; /* 이미지 비율을 1:1로 설정 */
        transition: transform 0.2s ease-in-out;
    }

    .product-item:hover img {
        transform: scale(1.05); 
    }

    .product-item button {
        display: block;
        width: 100%; 
        padding: 10px 0; 
        margin: 15px 0; 
        background-color: #5cb85c;
        color: white; 
        border-style: none;
        border-radius: 3px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .product-item button:hover {
        background-color: #3e993e;
    }

    .product-info {
        padding: 10px;
        text-align: center;
        margin-top: auto; /* 마진 상단 자동 조정으로 항상 하단에 위치 */
    }

    .product-name {
        margin: 10px 0;
        font-weight: bold;
    }

    .product-price {
        color: #E44D26;
        font-weight: bold;
    }
    
    .admin-btn {
	    display: flex;
	    justify-content: flex-start; /* 버튼들을 가로로 정렬 */
	    gap: 10px; /* 버튼 사이 간격 */
	}
    
    .controls {
        display: flex;
        justify-content: space-between; /* 좌우 정렬 */
        align-items: center;
        padding: 10px 0;
    }

    .buttons-container {
        display: flex;
        margin-bottom: 30px;
    }

    .buttons-container button {
        margin-right: 10px; /* 버튼 사이 간격 */
        color: #5cb85c;
        border: 1px solid #5cb85c;
        background-color: white;
        border-radius: 3px;
        width: 100px;
        height: 30px;
        cursor: pointer;
    }
    
    .buttons-container button:hover {
    	color : white;
    	 background-color: #5cb85c;
    }

    .dropdown-container {
        margin-left: auto; /* 왼쪽 마진 자동으로 주어 오른쪽에 붙임 */
    }

    .dropdown-container select {
        padding: 5px;
        cursor: pointer;
    }
    
    .button-selected {
	    background-color: #4CAF50; /* 선택된 버튼의 배경색 */
	    color: white; /* 선택된 버튼의 글자색 */
	}
    

</style>
<body>
<!-- Header Section -->
<%@ include file="layout/header.jsp" %>
	<div id="app">
		{{userId}}
	    {{userType}}
		<div class="container">
            <div class="banner">
              <!-- 배너 이미지 영역 -->
              <img src="/img/vegetable.jpg" alt="상단 배너 이미지">
            </div>

            <div class="buttons-container">
                <button type="button" @click="fnList('org')">유기농</button>
                <button type="button" @click="fnList('vegan')">비건</button>
                <button type="button" @click="fnList('gluten')">글루텐프리</button>
                <button type="button" @click="fnList('local')">로컬푸드</button>

                <div class="dropdown-container">
                    <!-- 드롭박스를 오른쪽에 배치 -->
                    <template v-if="userType == 'A' ">
                    	<button @click="fnAdd">상품추가</button>
                    </template>
                    <select>
                      <option value="option1">옵션 1</option>
                      <option value="option2">옵션 2</option>
                      <option value="option3">옵션 3</option>
                      <option value="option4">옵션 4</option>
                    </select>
                </div>
            </div>

            <div class="product-list">
		   		<div class="product-item" v-for="item in list" :key="item.id">
			    	<template  v-for="item2 in filelist" v-if="item.itemNo == item2.itemNo">
						<img :src="item2.filePath+item2.fileName" alt="" @click="fnDetailView(item.itemNo, userId)">
				    </template>
			    	
			      	<button type="button" href="javascript:;" @click="fnAddCart(item.itemNo, userId)">장바구니에 담기</button>
			      	
			      	<div class="product-info" @click="fnDetailView(item.itemNo)">
			        	<div class="product-name">{{item.itemName}}</div>
			        	<div class="product-price">
			        		<del>₩{{item.price}}</del>
			        		<br>할인가₩{{(item.price)*((100-item.sRate)/100)}}
			        		<br> 할인율{{item.sRate}}%
			        	</div>
			      	</div>
			      	
			      	<div class="admin-btn">
			      		<template v-if="userType == 'A' ">
				      		<button @click="fnRemove(item.itemNo)">상품삭제</button>
				      		<button @click="fnEdit(item.itemNo)">상품수정</button>			      		
			      		</template>
			      	</div>	      	
			    </div>
			</div> 
		</div>
	</div>
<!-- Footer Section -->
<%@ include file="layout/footer.jsp" %>	
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	list : [],
    	filelist : [],
    	userId : "${userId}",
		userType : "${userType}",
    	code : "${map.code}"
    }
    , methods: {
    	fnList: function(code) {
            var self = this;
            self.code = code;
            var nparmap = {
            		code: code
            };
            $.ajax({
                url:"cordList.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	self.list = data.list;
                	self.filelist = data.filelist;
                }
            });
        },
        fnRemove: function(itemNo) {
            var self = this;
            if(confirm("정말 삭제할까요?")) {
	            var nparmap = {
	            		itemNo : itemNo
	            };
	            $.ajax({
	                url:"productRemove.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success: function(data) {
	                	if(data.result == "success") {
	                		alert("삭제되었습니다!");
	                		self.fnList('org');
	                	} else {
	                		alert("삭제 실패 오류 발생!");
	                	}
	                }
	            });            	
            } else {
            	return;
            }
        },
        /* 제품 상세 페이지  */
        fnDetailView: function(itemNo, userId) {
			var self = this;
			$.pageChange("/productView.do", {itemNo: itemNo, userId: self.userId});
		},
		/* 상품 추가 페이지 */
		fnAdd: function(){
			$.pageChange("/productAddFarmer.do", {});
		},
		/* 상품 수정 페이지  */
		fnEdit : function(itemNo){
        	$.pageChange("/ProductUpdate.do", {itemNo : itemNo});
        },
        /* 상품 장바구니 추가  */
		fnAddCart: function(itemNo, userId) {
            var self = this;
            var nparmap = {
				itemNo: itemNo,
				userId: self.userId
            };
            $.ajax({
                url:"addCart.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(itemNo);
                	console.log(userId);
                	if(data.result=="success"){
                		alert("장바구니에 담았습니다.");
                	}else{
                		alert("예기지 못한 오류가 발생했습니다. 다시 시도해주세요");
                	}
                }
            });
        }
    }
    , created: function() {
    	var self = this;
    	self.fnList(self.code);
	}
});
</script>