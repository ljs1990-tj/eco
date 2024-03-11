<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	
	<title>유기농 제품 페이지</title>
</head>
<style>
  	body {
	    margin: 0;
	    font-family: 'Arial', sans-serif;
	    background-color: #f8f8f8;
	}
	.container {
		width: 80%; 
		max-width: 1200px; 
		margin: 0 auto; 
		background-color: white; 
		padding: 20px; 
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
	}	
	  
	.title {
	    background-color: #4CAF50;
	    color: white;
	    padding: 10px 20px;
	    text-align: center;
	}
  	.title h1 {
    	margin: 0;
  	}
  	.description {
	   	 margin: 10px 20px;
	   	 text-align: center;
	     color: #666;
  	}
    .nav {
	    display: flex;
	    justify-content: center;
	    padding: 0;
	    background: #e2e2e2;
    }
  	.nav li {
   		list-style: none;
    	padding: 10px 20px;
    	cursor: pointer;
  	}
  	.nav li:hover {
    	background: #d4d4d4;
  	}
 	.product-grid {
		display: flex;
		flex-wrap: wrap;
		padding: 20px;
		justify-content: flex-start;
	}

	.product {
		background: #fff;
	    margin: 10px;
	    width: calc(25% - 22px); /* 4개의 상품이 한 줄에 들어가도록 계산 (20px은 마진, 2px은 보더 고려) */
	    box-sizing: border-box; /* 패딩과 보더가 너비에 포함되도록 설정 */
	    text-align: center;
	}
	.product img {
    	max-width: 100%;
    	height: auto;
  	}
  	.product p {
    	margin: 10px 0 0;
    	color: #333;
  	}
  	.price {
    	color: #2a8f2a;
    	font-weight: bold;
  	}
  	.filter {
    	float: right;
    	margin: 20px;
  	}
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="title">
			  <h1>Shop Organic’s</h1>
			</div>
			
			<div class="description">
			  <p>Revamp your style with the latest designer trends in men's clothing or achieve a perfectly curated wardrobe thanks to our line-up of timeless pieces.</p>
			</div>
			
			<ul class="nav">
			  <li @click="fnOrganic">유기농</li>
			  <li @click="fnVegan">비건</li>
			  <li @click="fnGluten">글루텐프리</li>
			  <li @click="fnLocal">로컬푸드</li>
			</ul>
			<div>
			<input type="text" v-model="keyword"> <button @click="fnList">검색</button>
			</div>
			<div class="filter">
			  <select name="items" id="items">
			    <option >인기 순</option>
			    <option >추천 수</option>
			    <option >???</option>
			  </select>
			</div>
			
			<div class="product-grid">
				 <div class="product" v-for="item in list">
				    <img src="" alt="">
				    <p><a href="javascript:;" @click="fnDetailView(item.itemNo)">{{item.itemName}}</a></p>
				    <p class="price">{{item.price}}</p>
				  	<button @click="fnRemove(item.itemNo)">상품삭제</button>
				  </div>
			</div>
		
		</div>
			
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	list : [],
    	keyword : "",
    	code : "org"
    	
    }
    , methods: {
    	fnList: function() {
            var self = this;
            var nparmap = {
            		keyword : self.keyword,
            		code : self.code
            		
            };
            $.ajax({
                url:"productList.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	self.list = data.list;
                }
            });
        },
        /* 제품 삭제 실행 */
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
	                		self.fnList();
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
        fnDetailView: function(itemNo) {
			var self = this;
			$.pageChange("/productView.do", {itemNo: itemNo});
		},
        /* 오가닉 제품 페이지 이동  */
        fnOrganic: function() {
        	$.pageChange("/productOrganic.do", {});
        },
        /* 비건 제품 페이지 이동  */
        fnVegan: function() {
        	$.pageChange("/productVegan.do", {});
        },
        /* 글루텐 프리 제품 페이지 이동  */
        fnGluten: function() {
        	$.pageChange("/productGlutenFree.do", {});
        },
        /* 로컬 제품 페이지 이동  */
        fnLocal: function() {
        	$.pageChange("/productLocalFood.do", {});
        }
    }
    , created: function() {
    	var self = this;
		self.fnList('org');
	}
});
</script>