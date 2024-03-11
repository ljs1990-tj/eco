<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>주소록 추가</title>
</head>
<style>
</style>
<body>
	<div id="app">

		<div class="join-divide">
			주소<span class="required-star">*</span>
		</div>
		<input type="text" v-model="user.zipCode" placeholder="우편번호">
		<input type="button"  @click="execDaumPostcode" value="우편번호 찾기">
		<div class="margin-bottom-10px"></div>
		<input type="text" class="join-input" v-model="user.addr" placeholder="주소">
		<div class="join-divide margin-bottom-10px"></div>
		<input type="text" v-model="addrDetail1" placeholder="상세주소">
		<div style="margin-bottom: 10px;"></div>
		<div class="join-divide margin-bottom-10px"></div>
		<input type="text" v-model="addrDetail2" placeholder="참고항목">
		<div style="margin-bottom: 10px;"></div>
		<div style="padding-left: 110px; font-size: 10px;">※└현재 주소는 집
			주소로 기본 저장되며, 후에 마이페이지에서 수정이 가능합니다.</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			
			user : {
				userId: "${userId}",
				zipCode : "",
				addr : "",
				addrDetail : "",
				addrName : "집"
			}
		},
		methods : {
			fnGetList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "user-addr-add.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function() {
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnGetList();
		}
	});
</script>