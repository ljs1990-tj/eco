<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		<input type="button" @click="execDaumPostcode()" value="우편번호 찾기">
		<div class="margin-bottom-10px"></div>
		<input type="text" class="join-input" v-model="user.addr"
			placeholder="주소">
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
			user:{
				userId : "${userId}",
				zipCode : "",
				add : "",
				addrDetail :"",
				name : "",
				phone : "",
				addrRequest : null,
				addrName : ""
			},
			addrDetail1 : "",
			addrDetail2 : ""
		},
		methods : {
			/* 주소록 기입 */
			execDaumPostcode : function() {
				      var self = this;
				      new daum.Postcode({
				        oncomplete: function(data) {
				          let addr = ''; // 주소 변수
				          let extraAddr = ''; // 참고항목 변수

				          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				            addr = data.roadAddress;
				          } else { // 사용자가 지번 주소를 선택했을 경우(J)
				            addr = data.jibunAddress;
				          }

				          if(data.userSelectedType === 'R'){
				            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				              extraAddr += data.bname;
				            }
				            if(data.buildingName !== '' && data.apartment === 'Y'){
				              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				            }
				            if(extraAddr !== ''){
				              extraAddr = ' (' + extraAddr + ')';
				            }
				            self.addrDetail2 = extraAddr;
				          } else {
				            self.addrDetail2 = '';
				          }

				          self.user.zipCode = data.zonecode;
				          self.user.addr = addr;
				          self.$nextTick(() => {
				            self.$refs.addrDetail1.focus();
				          });
				        }
				      }).open();
				    },
			/* 주소록 추가히기 */			
			fnGetList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "test.dox",
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
			//self.fnGetList();
		}
	});
</script>