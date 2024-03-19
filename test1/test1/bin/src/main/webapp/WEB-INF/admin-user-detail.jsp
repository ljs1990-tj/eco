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
            	<option value="U">U</option>
            	<option value="F">F</option>
            	<option value="A">A</option>
            </select>
            <button @click="fnUserTypeEdit">변경</button>
        </div>
        <button @click="fnMoveAdminMain">돌아가기</button>
    </div>
		
	
</body>
<script type="text/javascript">
	var app = new Vue({
	    el: '#app',
	    data: {
	    	userId :  "${map.userId}",
	    	userInfo : {},
	    	
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
	                	self.userInfo = data.userInfo;
	                }
	            });
	        },
	        fnMoveAdminMain : function(){
	        	location.href="AdminUserList.do";
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