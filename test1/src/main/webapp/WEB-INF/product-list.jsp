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
    .prodcut-container {
        margin: 0 auto; 
        padding: 20px; 
        max-width: 1200px; 
        border-style: none;
        background-color: #ffffff;
        
        flex-direction: column; /* 세로 방향으로 내부 요소 정렬 */
    	align-items: center; /* 가로 방향 중앙 정렬 */  
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
        box-shadow: 0 2px 4px rgba(0,0,0,0.5); 
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
        margin: 1px 10px;
        font-weight: bold;
        font-size: 15px;
    }

    .product-price {
        color: #E44D26;
        font-weight: bold;
        font-size: 14px;
    }
    .product-price del{
        font-size: 12px; 
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
    	align-items: center;
	    justify-content: center;
	    gap: 0.5px;
	    width: 100%;
	    margin: auto;
    
        /* display: flex; */
       /*  margin-bottom: 30px;
        margin-right: 5px;
        color: #5cb85c;
        border: 1px solid #5cb85c;
        background-color: white;
        border-radius: 5px;
        width: 100px;
        height: 30px;
        cursor: pointer; */
    }
    
    .buttons-container img{
    	width: 120px; 
   		height: 120px; 
    	cursor: pointer;   	
    }
    

    .buttons-container button:hover {
    	color : white;
    	background-color: #5cb85c;
    }

    .order-container {
        margin-left: auto; /* 왼쪽 마진 자동으로 주어 오른쪽에 붙임 */
    }

    .dropdown-container select {
        padding: 5px;
        cursor: pointer;
    }
    
    .button-selected {
    	display: flex;
    	align-items: center;
	    justify-content: center; 
	    gap: 0.5px;
	    width: 100%;
	    margin: auto;
	   /* 	background-color: #4CAF50;
	    color: white; 
	    margin-bottom: 30px;
	    margin-right: 5px;
        border: 1px solid #5cb85c;
        border-radius: 5px;
        width: 100px;
        height: 30px;
        cursor: pointer; */
	}
	
	.button-selected img{
		width: 150px; 
   		height: 150px; 
    	cursor: pointer;
	}
	
	.searchArea {
	    width: 100%; 
	    display: flex; 
	    justify-content: center; 
	    margin: 20px 0; 
	}

	.searchArea input[type="text"] {
	    width: 400px; 
	    padding: 10px; 
	    border: 1px solid #5cb85c; 
	    border-radius: 10px; 
	}
	
	.control-wrapper {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    width: 100%; 
	}
	.search {
		margin: 5px;
		cursor: pointer;
		/* text-align: center; */
	}
	
	.message-container {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    width: 100%;
	    height: 100px; /* 메시지 영역의 높이. 필요에 따라 조절합니다. */
	}
	
	.no-results-message {
	    text-align: center;
	    margin-top: 20px;
	    font-size: 20px;
	    color: #888;
	    width: 100%; /* 너비를 100%로 설정하여 부모 컨테이너의 전체 너비를 차지하도록 합니다. */
	    display: flex; /* Flexbox 모델 적용 */
	    justify-content: center; /* 내용을 중앙에 배치 */
	    align-items: center; /* 항목들을 가운데 정렬 */
	}
	.buttonArea {
		display: flex;
    	align-items: center;
	    justify-content: center;
	    gap: 0.5px;
	    width: 70%;
	    margin-left: 150px;
	    margin-bottom: 100px;
	}

</style>
<body>
<!-- Header Section -->
<%@ include file="layout/header.jsp" %>
	<div id="app">
		<div class="prodcut-container">
           <!--  <div class="banner">
              배너 이미지 영역
              <img src="/img/vegetable.jpg" alt="상단 배너 이미지">
            </div> -->
			<div class="searchArea">
				<input type="text" placeholder="검색어를 입력해주세요" v-model="keyword" @keyup.enter="fnList(code)">
				<img class="search" src="/img/search.jpeg" @click="fnList(code)" style="width: 35px; height: 35px;">
			</div>
			
            <div class="control-wrapper">
            	<div class="buttonArea">
	            	<a :class="[selected == '' ? 'button-selected' : 'buttons-container']" @click="fnList('')"><img src="img/categories/cat-5.jpg"></a>
	                <a :class="[selected == 'org' ? 'button-selected' : 'buttons-container']" @click="fnList('org')"><img src="img/categories/cat-1.jpg"></a>
					<a :class="[selected == 'vegan' ? 'button-selected' : 'buttons-container']" @click="fnList('vegan')"><img src="img/categories/cat-2.jpg"></a>
					<a :class="[selected == 'gluten' ? 'button-selected' : 'buttons-container']" @click="fnList('gluten')"><img src="img/categories/cat-3.jpg"></a>
					<a :class="[selected == 'local' ? 'button-selected' : 'buttons-container']" @click="fnList('local')"><img src="img/categories/cat-4.jpg"></a>                 	
            	</div>
            	
            	<!-- <button type="button" :class="[selected == '' ? 'button-selected' : 'buttons-container']" @click="fnList('')">전체</button>
                <button type="button" :class="[selected == 'org' ? 'button-selected' : 'buttons-container']" @click="fnList('org')">유기농</button>
				<button type="button" :class="[selected == 'vegan' ? 'button-selected' : 'buttons-container']" @click="fnList('vegan')">비건</button>
				<button type="button" :class="[selected == 'gluten' ? 'button-selected' : 'buttons-container']" @click="fnList('gluten')">글루텐프리</button>
				<button type="button" :class="[selected == 'local' ? 'button-selected' : 'buttons-container']" @click="fnList('local')">로컬푸드</button> -->

                <div class="order-container">     
                    <select v-model="selectedOption" @change="updateSelected">
					    <option value="new">신상품 순</option>
					    <option value="old">구상품 순</option>
					    <option value="high">높은 가격순</option>
					    <option value="low">낮은 가격순</option>
					</select>
                </div>
            </div>
            

            <div class="product-list">
		   		<div class="product-item" v-for="item in list" :key="item.id">
			    	<template v-for="item2 in fileList" v-if="item.itemNo == item2.itemNo">
						<img :src="item2.filePath+item2.fileName" alt="" @click="fnDetailView(item.itemNo, userId)">
				    	
				      	<button type="button" href="javascript:;" @click="fnAddCart(item.itemNo)">장바구니에 담기</button>
				      	
				      	<div class="product-info" @click="fnDetailView(item.itemNo)">
				        	<div class="product-name">{{item.itemName}}</div>
				        	<div class="product-price">
				        		<template v-if="item.sRate > 0">
					        		<del>{{item.price.toLocaleString('ko-KR')}}원</del>
					        		<br>{{item.sRate}}% {{DiscountPrice(item.price, item.sRate)}}원		        		
				        		</template>
				        		<template v-else>
				        			<br>{{item.price.toLocaleString('ko-KR')}}원
				        		</template>
				        	</div>
				      	</div>
				    </template>
			    </div>
			    <div class="message-container" v-if="list.length === 0">
				    <div class="no-results-message">
				        등록된 상품이 없습니다. 다시 검색해 주세요.
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
    	fileList : [],
    	userId : "${userId}",
		userType : "${userType}",
    	code : "${map.code}",
    	keyword : "${map.keyword}",
    	selected : "",
    	type: "CDATE",
    	order: "DESC",
    	selectedOption: 'new'
    	
    }
    , methods: {
    	fnList: function(code) {
            var self = this;
            self.selected = code;
            if(self.code != code){
            	self.keyword = "";
            }
            self.code = code;
            var nparmap = {
            	code: code,
            	keyword : self.keyword,
            	type : self.type,
            	order : self.order,
            	kind : 1
            };
            $.ajax({
                url:"codeList.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data);
                	self.list = data.list;
                	self.fileList = data.fileList;
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
	                		self.fnList('');
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
		fnAddCart: function(itemNo) {
            var self = this;
            if(self.userId == ""){
            	alert("로그인 후 이용 가능합니다.");
            	return;
            }
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
                	
                	if(data.result=="success"){
                		alert("장바구니에 담았습니다.");
                		appHeader.fnLogin();
                	}else{
                		alert("예기치 못한 오류가 발생했습니다. 다시 시도해 주세요.");
                	}
                }
            });
        },
        /* 정렬 기능  */
        updateSelected: function() {
        	var self = this;
            switch (self.selectedOption) {
                case 'new':
                	self.type = 'CDATE';
                	self.order = 'DESC';
                    break;
                case 'old':
                	self.type = 'CDATE';
                	self.order = 'ASC';
                    break;
                case 'high':
                	self.type = 'PRICE';
                	self.order = 'DESC';
                    break;
                case 'low':
                	self.type = 'PRICE';
                	self.order = 'ASC';
                    break;
            }
            self.fnList(self.code);
        },
        /* kr통화 표시 */
        DiscountPrice: function(price, sRate) {
            const disPrice = price * ((100 - sRate) / 100);
            return disPrice.toLocaleString('ko-KR');
        }
       
        
    }
    , created: function() {
    	var self = this;
    	self.fnList(self.code);
	}
});
</script>