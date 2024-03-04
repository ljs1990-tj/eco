<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>비건 제품 페이지</title>
</head>
<style>
  	body {
	    margin: 0;
	    font-family: 'Arial', sans-serif;
	    background-color: #f8f8f8;
	  }
	.header {
	    background-color: #333;
	    color: white;
	    padding: 10px 20px;
	    text-align: center;
	}
  	.header h1 {
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
		<div class="header">
		  <h1>Shop Vegan’s</h1>
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
			    <p>{{item.itemName}}</p>
			    <p class="price">₩{{item.price}}</p>
			  </div>
		</div>
			
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	list : []
    }
    , methods: {
    	fnList: function() {
            var self = this;
            var nparmap = {};
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
        
        fnOrganic: function() {
        	$.pageChange("/productOrganic.do", {});
        },
        
        fnVegan: function() {
        	$.pageChange("/productVegan.do", {});
        },
        
        fnGluten: function() {
        	$.pageChange("/productGlutenFree.do", {});
        },
        
        fnLocal: function() {
        	$.pageChange("/productLocalFood.do", {});
        }
    }
    , created: function() {
    	var self = this;
		self.fnList();
	}
});
</script>