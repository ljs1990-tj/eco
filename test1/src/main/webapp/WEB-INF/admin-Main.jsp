<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>관리자 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		 <button>상품등록</button>
		 <button>상품조회/수정</button>
		 <button>상품관리</button>
		 <button>판매통계</button>
		 <button>리뷰관리</button>
		 <button>문의관리</button>
		 <button>공유 레시피 관리</button>
		 <button>배송관리</button>		 
		 <button>고객관리</button>
		 <button>판매자관리</button>

		 
		 
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
            var nparmap = {};
            $.ajax({
                url:"test.dox",
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
			
	}
});
</script>