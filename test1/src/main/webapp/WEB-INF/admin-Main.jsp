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
button{
	background-color: red; 
}
</style>
<body>
	<%@ include file="../layout/header.jsp"%>
	<div id="app">

		<div>
			<button @click="fnProdutList">상품 관리</button>
		</div>
		<div>
			<button @click="fnChart">판매통계</button>
		</div>
		<div>
			<button>리뷰관리</button>
		</div>
		<div>
			<button>문의관리</button>
		</div>
		<div>
			<button>공유 레시피 관리</button>
		</div>
		<div>
			<button>배송관리</button>
		</div>
		<div>
			<button @click="fnUserList">고객관리</button>
		</div>
		<div>
			<button>판매자관리</button>
		</div>
	
	<div>
		<button>카카오페이</button>
	</div>

	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {},
		methods : {

			fnProdutList : function() {
				location.href = "AdminProductList.do"
			},
			fnChart : function(){
				location.href="AdminProductChart.do"
			},
			fnUserList : function(){
				location.href="AdminUserList.do"
			}

		},
		created : function() {
			var self = this;

		}
	});
</script>