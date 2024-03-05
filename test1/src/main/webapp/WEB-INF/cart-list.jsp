<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>메인화면</title>
</head>
<style>
/* add style */
</style>
</head>
<body>
<!-- div -->
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			isPopupOpen : true
		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {
					userId : "test"
				};
				$.ajax({
					url : "cart.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
					}
				});
			},
			closePopup : function() {
				this.isPopupOpen = false;
			}
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>