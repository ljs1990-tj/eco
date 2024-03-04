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
</style>
<body>
	<div id="app">
		<div>
			<a href="javascript:;" @click="fnOrganic"> 오가닉</a>
			<a href="javascript:;" @click="fnVegan"> 비건</a>
			<a href="javascript:;" @click="fnGluten"> 글루텐프리</a>
			<a href="javascript:;" @click="fnLocal"> 로컬푸드</a>		
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
		self.fnList();
	}
});
</script>