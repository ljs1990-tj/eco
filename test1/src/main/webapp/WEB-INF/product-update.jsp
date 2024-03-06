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
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<body>
	<div id="app">
		<div>
			상품 카테고리 : 
			<select v-model="code">
				<option value="gluten">글루텐프리</option>
				<option value="local">로컬푸드</option>
				<option value="org">유기농</option>
				<option value="vegan">비건</option>
				
			</select>
			
		</div>
	
		<div>
			상품명 : <input type="text" v-model="name">
		</div>
		<div>
			가격 : <input type="text" v-model="price">
		</div>
		<div>
			할인율 : <input type="text" v-model="Srate">
		</div>
		<div>
			적립율 : <input type="text" v-model="Prate">
		</div>
		
		<div>
			
			내용 : <vue-editor v-model="contents"></vue-editor>
			
		</div>
		
		<div>
			배송정보 :
			<select v-model="trans">
				<option value="무료배송">무료배송</option>
				<option value="유료배송">유료배송</option>
			</select>

		</div>
		<div>
			품절 여부 : 
			<select v-mode="sellYN">
				<option value="Y">재고있음</option>
				<option value="N">재고없음</option>
				
			
			</select>
		</div><div>
			재고 갯수 : <input type="text" v-model="cnt">
		</div>
	
	<button @click="fnAdd">등록하기</button>
	</div>
</body>
</html>
<script type="text/javascript">
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
var app = new Vue({
    el: '#app',
    data: {
    	code:"org",
    	name:"",
    	price:"",
    	Srate:"",
    	Prate:"",
    	contents:"",
    	trans:"무료배송",
    	sellYN:"N",
    	cnt:""
    	
    	
    }
	, components: {VueEditor}
    , methods: {
    	fnAdd: function() {
            var self = this;
            var nparmap = {
            		code : self.code,
            		name : self.name,
            		price : self.price,
            		Srate : self.Srate,
            		Prate : self.Prate,
            		contents : self.contents,
            		trans : self.trans,
            		sellYN : self.sellYN,
            		cnt : self.cnt
            		
            		
            };
            $.ajax({
                url:"productAdd.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	if(data.result=="success"){
                		alert("등록완료");
                	}else{
                		alert("등록실패");
                	}
                	
                }
            });
        }
    }
    , created: function() {
    	var self = this;
	
	}
});
</script>