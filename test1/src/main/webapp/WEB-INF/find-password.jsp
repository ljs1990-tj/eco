<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>비밀번호 찾기</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>아이디 입력:
			<input type="text" v-model="inputId" :disabled="checkIdFlg">
			<button @click="fnSearchId">확인</button>
		</div>
		<div v-if="checkIdFlg">
			<input type="text" v-model="inputPhone" :disabled="checkArthFlg">
			<button @click="fnArth">전송</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	checkIdFlg: false,
    	checkArthFlg: false,
    	inputId: "",
    	phoneNum: ""
    }
    , methods: {
        fnSearchId: function() {
            var self = this;
	        var nparmap = {id : self.inputId};
	        $.ajax({
	            url:"check.dox",
	            dataType:"json",
	            type: "POST", 
	            data: nparmap,
	            success: function(data) {
	            	if(data.result == "success") {
	            		alert("없는 아이디입니다!");
	            		self.checkIdFlg = false;
	            	} else {
	            		alert("있는 아이디입니다!");
	            		self.checkIdFlg = true;
	            		console.log(data);
	            		//self.phoneNum = data.phone;
	            	}
	            }
	        });
		},
		fnArth: function() {
			var self = this;
	        var nparmap = {};
	        $.ajax({
	            url:"send-one",
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