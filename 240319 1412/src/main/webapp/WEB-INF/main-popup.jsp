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
 #layer_popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid #ccc;
            z-index: 1000;
        }
</style>
</head>
<body>
	<div id="app">
	 <div id="layer_popup">
        <h2>팝업 내용</h2>
        <p>이 부분에 팝업 내용을 추가하세요.</p>
        <button @click="closePop">닫기</button>
    </div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url : "check.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						 self.openPopup();
					}
				});
			},
			 openPopup: function() {
                 // 팝업 열기
                 document.getElementById('layer_popup').style.display = 'block';
             },
             closePop: function() {
                 // 팝업 닫기
                 document.getElementById('layer_popup').style.display = 'none';
             }
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>