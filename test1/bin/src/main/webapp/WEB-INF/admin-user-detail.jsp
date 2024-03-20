<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>유저 조회</title>
</head>
<style>
 #app {
            text-align: center; /* 가운데 정렬 */
            border: 2px solid #ccc; /* 박스 모양 */
            padding: 20px; /* 내부 여백 */
            width: 400px; /* 가로 너비 */
            margin: 0 auto; /* 화면 중앙에 정렬 */
        }
        #app div {
            margin-bottom: 10px; /* 각 요소 아래 여백 */
        }
</style>
<body>
	<div id="app">
		<div>
            아이디: {{ userInfo.userId }}
        </div>
        <div>
            이름: {{ userInfo.name }}
        </div>
        <div>
            휴대폰 번호: {{ userInfo.phone1 }} - {{ userInfo.phone2 }} - {{ userInfo.phone3 }}
        </div>
        <div>
            이메일: {{ userInfo.email }}
        </div>
        <div>
            성별: {{ userInfo.gender }}
        </div>
        <div>
            생년월일: {{ userInfo.birth }}
        </div>
        <div>
        	가입일 : {{userInfo.cDateTime}}
        </div>
        <div>
        	마지막 수정날짜 : {{userInfo.uDateTime}}
        </div>
        <div>
            등급 시작일: {{ userInfo.StartDate }}
        </div>
        <div>
            등급 만료일: {{ userInfo.EndDate }}
        </div>
        <div>
            인증 여부: {{ userInfo.authYn }}
        </div>
        <div>
            총 결제금액 : {{ userInfo.totalPay.toLocaleString('ko-KR') }} 원
        </div>
        <div>
            포인트: {{ userInfo.point.toLocaleString('ko-KR') }} 포인트
        </div>
        
        <div>
            이벤트 참여 여부: {{ userInfo.eventYn }}
        </div>
        <div>
            로그인 횟수: {{ userInfo.loginCnt }}
            <button @click="fnResetLoginCnt">초기화</button>
        </div>
        <div>
            회원 등급: {{userInfo.userGrade}}
          
        </div>
        <div>
            회원 유형:
            <select v-model="userInfo.userType">
            	<option value="U">일반유저</option>
            	<option value="F">판매자</option>
            	<option value="A">어드민</option>
            	<option value="D">삭제대기</option>
            </select>
            <button @click="fnUserTypeEdit">변경</button>
        </div>
        <button v-if="popupFlg=='no'" @click="fnMoveAdminMain">돌아가기</button>
          <button v-if="popupFlg=='yes'" @click="fnMoveAdminMain">닫기</button>
        
    </div>
		
	
</body>
<script type="text/javascript">
	var app = new Vue({
	    el: '#app',
	    data: {
	    	userId :"${map.userId}",
	    	userInfo : {},
	    	popupFlg : "${map.popupFlg}"
	    	
	    }
	    , methods: {
	    	fnList: function() {
	            var self = this;
	            var nparmap = {
	            		userId : self.userId,
	            };
	            $.ajax({
	                url:"AdminUserDetail.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success: function(data) {
	                	console.log(data);
	                	if(data.result == "success"){
	                		self.userInfo = data.userInfo;
	                	}else{
	                		alert("아이디를 확인해주세요.");
	                		if(self.popupFlg == "yes"){
	        	        		window.close();
	        	        	}else{
	        	        		history.back();
	        	        	}
	                		
	                	}
	                	
	                }
	            });
	        },
	        fnMoveAdminMain : function(){
	        	var self = this;
	        	if(self.popupFlg == "yes"){
	        		window.close();
	        	}else{
	        		location.href="AdminUserList.do";
	        	}
	        	
	        	
	        },
	        
	        fnUserTypeEdit: function() {
	            var self = this;
	            var nparmap = {
	            		userId : self.userId,
	            		userType : self.userInfo.userType
	            		
	            		
	            };
	            $.ajax({
	                url:"AdminUserTypeEdit.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success: function(data) {
	                	if(data.result == "success"){
	                		alert("변경되었습니다");
		                	self.fnList();
	                	}
	                	
	                	
	                }
	            });
	        },
	       
	        fnResetLoginCnt: function() {
	            var self = this;
	            
	            var nparmap = {
	            		userId : self.userId,
	            };
	            $.ajax({
	                url:"AdminUserLoginCntZero.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success: function(data) {
	                	if(data.result == "success"){
	                		alert("변경되었습니다");
		                	self.fnList();
	                	}
	                	
	                	
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
</html>