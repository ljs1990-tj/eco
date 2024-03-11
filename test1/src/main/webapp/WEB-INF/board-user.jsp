<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>목록 페이지</title>
</head>
<body>
	<div id="app">
		<ul>
			<li>이름: {{user.userName}}</li>
			<li>아이디: {{user.userId}}</li>
			<li>성별: {{user.gender}}</li>
			<li>폰번호: {{user.phone}}</li>
		</ul>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	userId : "${map.userId}",//map = resultMap, controller의 boardUser의 map의 userId
    	user : {}
    }   
    , methods: {
    	fnList : function(){    		
            var self = this;
            var nparmap = {id : self.userId};
            $.ajax({
                url:"boardUser.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	//console.log(data);
                	self.user = data.user;
                }
            }); 
        }
    }   
    , created: function () {
    	var self = this;
		self.fnList();
	}
});
</script>