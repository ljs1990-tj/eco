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
        body { margin: 300px; margin-top:0px; font-family: Arial, sans-serif; }
        .header { background-color: #4CAF50; color: white; padding: 10px 20px; display: flex; justify-content: space-between; align-items: center; }
        .promo-bar { background-color: #367c39; padding: 5px 20px; text-align: center; font-size: 0.9em; }
        .nav { display: flex; gap: 30px; }
        .nav a { color: white; text-decoration: none; }
        .search-bar { display: flex; align-items: center;   }
        .search-bar input { padding: 5px; background-color:#4CAF50; border: 0px solid;}
        .user-info { display: flex; gap: 5px; align-items: center;}
        .user-info div { cursor: pointer; }
        .icon { width: 24px; height: 24px; background: white; border-radius: 50%; display: inline-block; }
   		
    </style>
</head>
<body>
    <!-- 프로모션 바-->
    <div class="promo-bar">오늘 19시부터 20분간 전 상품 20% 할인!</div>

	<div id="app" class="header">
        <div class="nav">
            <a href="#">A조 마켓</a>
            <a href="#">카테고리</a>
            <a href="#">1:1 매칭</a>
            <a href="#">식단관리</a>
            <a href="#">커뮤니티</a>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="검색">
        </div>
        <div class="user-info">
            <div class="icon"></div> <!-- 장바구니 icon -->
            <div>마이페이지</div>
            <div>장바구니</div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    }
    , methods: {
    	fnList: function() {
            var self = this;
            var nparmap = {userId : "test"};
            $.ajax({
                url:"check.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                }
            });
        }
    }
    , created: function() {
    	var self = this;
    	self.fnList();
	}
});
</script>