<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->
	<script src="payment.js"></script>
    <title>결제하기 버튼</title>
</head>
<style>
</style>
<body>
	<div id="app">
    <button id="payment" @click="fnPay">카카오페이</button> <!-- 결제하기 버튼 생성 -->

	</div>
</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    }   
    , methods: {
    	list : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"cartList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                }
            }); 
        },
        fnPay : function(){
            var self = this;
            var nparmap = {
            		name: self.name,
            		email: self.email
            };
            $.ajax({
                url:"payment.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                }
            }); 
        } 
        
    }   
    , created: function () {
    	var self = this;
		
	}
});
</script>

