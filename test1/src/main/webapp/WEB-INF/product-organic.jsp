<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>오가닉 제품 페이지</title>
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
    justify-content: space-around;
    flex-wrap: wrap;
    padding: 20px;
  }
  .product {
    background: #fff;
    margin: 10px;
    padding: 20px;
    width: 200px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
		  <h1>Shop Organic’s</h1>
		</div>
		
		<div class="description">
		  <p>Revamp your style with the latest designer trends in men's clothing or achieve a perfectly curated wardrobe thanks to our line-up of timeless pieces.</p>
		</div>
		
		<ul class="nav">
		  <li>유기농</li>
		  <li>비건</li>
		  <li>글루텐프리</li>
		  <li>로컬푸드</li>
		</ul>
		
		<div class="filter">
		  <select name="items" id="items">
		    <option >인기 순</option>
		    <option >추천 수</option>
		    <option >???</option>
		  </select>
		</div>
		
		<div class="product-grid">
			 <div class="product" v-for="item">
			    <img src="" alt="">
			    <p>GAP인증 원예상추 1kg</p>
			    <p class="price">₩10,750</p>
			  </div>
		</div>
		
		<div class="product-grid">
			 <div class="product" v-for="item">
			    <img src="" alt="">
			    <p>GAP인증 원예상추 1kg</p>
			    <p class="price">₩10,750</p>
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