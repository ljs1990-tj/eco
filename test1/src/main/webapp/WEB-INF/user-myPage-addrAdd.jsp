<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="css/user-myPage.css" type="text/css">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>주소록 추가</title>
</head>
<style>

</style>
<body class="background">
	<div id="app">
		<div class="containerAddr">
			<div>
				<div>
					<span>받는 분 성함 : </span> <input type="text" v-model="user.name"
						placeholder="직접 입력">
				</div>
				<div>
					<span>받는 분 전화번호 : </span> <input type="text" v-model="user.phone"
						placeholder="직접 입력" @input="validateInput">
				</div>
				<div>
					<span>배송 요청 사항 : </span> <input type="text" v-model="user.addrRequest"
						placeholder="직접 입력">
				</div>
				<div>
					<span>배송지 위치 : </span> <input type="text" v-model="user.addrName"
						placeholder="직접 입력"> <select v-model="addrName2"
						@change="selectAddrName">
						<option value="" :selected="!addrName2">::직접입력::</option>
						<option value="집" :selected="addrName2 === '집'">집</option>
						<option value="회사" :selected="addrName2 === '회사'">회사</option>
						<option value="기타" :selected="addrName2 === '기타'">기타</option>
					</select>
				</div>
			</div>
			<div>
				<div>
					받는 분 주소 : <span style="color: red;">*</span>
				</div>
				<input type="text" v-model="user.zipCode" placeholder="우편번호">
				<input type="button" @click="execDaumPostcode()" value="우편번호 찾기">
				<div class="margin-bottom-10px"></div>
				<input type="text" v-model="user.addr" placeholder="주소">
				<div></div>
				<input type="text" v-model="addrDetail1" ref="addrDetail1" placeholder="상세주소"> 
				<input type="text" v-model="addrDetail2" placeholder="참고항목">
				<div style="margin-bottom: 10px;"></div>
				<div style="padding-left: 10px; font-size: 10px;">※ 현재 주소는 기본 저장되며, 
				후에 마이페이지에서 수정이 가능합니다.</div>
			</div>
			<div>
				<button @click="fnUserAddrAdd()">추가하기</button>
				<button @click="fnclose()">취소하기</button>
			</div>
		</div>
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
				addr : "",
				addrDetail :"",
				name : "",
				phone : "",
				addrRequest : "",
				addrName : ""
			},
			addrName2 : "",
			addrDetail1 : "",
			addrDetail2 : "",
		},
		methods : {
			//핸드폰 번호 입력 정규식
			validateInput : function(){
				var self = this;
				// 정규식을 사용하여 숫자만 허용
				self.user.phone = self.user.phone.replace(/\D/g, '');
				//숫자11자리만 사용 가능
				if(self.user.phone.length > 11){
					self.user.phone =  self.user.phone.slice(0, 11);
				}
			},
			/* 배송지 별칭 */
			selectAddrName : function(){
				var self = this;
				self.user.addrName = self.addrName2;
			},
			/* 주소 api */
			execDaumPostcode : function() {
				var self = this;
				 if(self.user.userId == ""){
		          		alert("로그인 후 입장 가능합니다.");
		          		window.opener.location.href = "/user-login.do";
		          		window.close();
		          	}
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
				       	// 주소 API 콜백 함수 내부에서 상세주소 필드로 커서 이동
				          self.$nextTick(() => {
				              const addrDetailField = self.$refs.addrDetail1;
				              if (addrDetailField) {
				                  addrDetailField.focus();
				              }
				          });
				        }
				      }).open();
				    },

			/* 주소록 추가하기 */
			fnUserAddrAdd: function() {
			   var self = this;
				  if(self.user.userId == ""){
		          		alert("로그인 후 입장 가능합니다.");
		          		window.close();
		          		window.opener.location.href = "/user-login.do";
		          	}
					if(self.user.name == ""){
				   		alert("받는분 성함을 입력해 주세요");
		            	return;
				   	}
				   	if(self.user.phone === ""){
				    	alert("받는 분 핸드폰 번호를 입력해 주세요");
				    	return;
				    }
				    if (self.user.phone.length !== 11) {
				        alert("핸드폰번호 11자리여야 합니다.");
				        return;
				    }
				    if(self.user.addrName === ""){
				    	alert("배송지 위치를 입력해 주세요");
				    	return;
				    }
		 			 if(self.user.zipCode == "" & self.user.addr == "" & self.addrDetail1 == "") {
		            	alert("우편번호 찾기를 주세요!");
		            	return;
				    }
		 			if(self.user.zipCode == "" ){
		 			  	alert("우편번호 입력해 주세요");
		            	return;
		 			}
		 			if(self.user.addr == "" ){
		 			  	alert("주소를 입력해 주세요");
		            	return;
		 			}
				    if(self.addrDetail1 == ""){
				    	alert("상세주소를 입력해 주세요");
				    	return;
				    }
			    if (!confirm("주소록을 추가하겠습니까?")) {
					return;
				}
			   self.user.addrDetail = self.addrDetail1 + " " + self.addrDetail2;
			   var nparmap = self.user;
			   $.ajax({
			    url:"user-addr-add.dox",
			    dataType:"json",
			    type: "POST",
			    data: nparmap,
			    success: function(data) {
			    	console.log(self.user);
			    	//성공시 부모창 새로고침후 팝업창 닫기
			    	if (data.result == "success") {
						alert("추가 되었습니다.");
					  	window.opener.location.reload();
						window.close();
						
					} else {
						alert("다시 시도해주세요");
						location.reload(true);
						return;
					}
			    },
			    error: function(xhr, status, error) {
                    // 에러 발생 시 처리
                    // 에러 페이지로 리다이렉션
                    window.opener.location.href = "/error-page"; // 에러 페이지의 URL로 리다이렉션
                }
			   });
		   },
		   //취소버튼 클릭시 팝업창 닫음
	        fnclose : function(){
	        	var self = this;
	        	 window.close();
	        }
		},
		created : function() {
			var self = this;
			  if(self.user.userId == ""){
	          		alert("로그인 후 입장 가능합니다.");
	          		window.opener.location.href = "/user-login.do";
	          		window.close();
	          	}
		}
	});
</script>