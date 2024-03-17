<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	
	<title>유저 관리 페이지</title>
</head>
<style>
table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
             text-align: center;
        }

        th {
            background-color: #4285f4;
            color: #fff;
            text-align: center;
        }
</style>
<body>

	<div id="app">
	<select v-model="selectNum" @click="fnPageList(1)">
			<option value="5">5개</option>
			<option value="10">10개</option>
			<option value="20">20개 </option>
			<option value="30">30개 </option>
		</select>
	<select v-model ="keywordType">
		<option value="id">아이디</option>
		<option value="name">닉네임</option>
	</select>
	<input type="text" v-model="keyword" @keyup="fnList()"><button @click="fnList()">검색</button>
		<table>
			
			<tr>
				<th>아이디</th>
                <th>이름</th>
                <th>생년 월 일</th>
                <th>성별</th>
                <th>이메일</th>
                <th>닉네임</th>
                <th>휴대폰번호</th>
                <th>로그인 실패</th>
                <th>유저 등급</th>
                <th>유저 타입</th>
                <th>상세보기</th>
			</tr>
			<tr v-if="list.length ==0">
			<td colspan="11">검색결과 없슴</td>
			</tr>
		<tr v-for="item in list" v-if="list.length !=0">
			<td>{{item.userId}}</td>
			<td>{{item.name}}</td>
			<td>{{item.birth}}</td>
			<td>{{item.gender}}</td>
			<td>{{item.email}}</td>
			<td>{{item.nickName}}</td>
			<td>{{item.phone1}} - {{item.phone2}} - {{item.phone3}}</td>
			<td>{{item.loginCnt}}</td>
			<td>{{item.userGrade}}</td>
			<td>{{item.userType}}</td>
			<td><button @click="fnMoveUserDetail(item.userId)">상세보기</button></td>
		</tr>
		
		
		
		</table>
		<a href="javascript:;" @click="fnPageMove(1)">◀</a>
	<template v-for="n in pageCount">
		
		<a  href="javascript:;" @click="fnPageList(n)" style="color : red;"  :class="selectPage == n ? 'select-tab' : 'tab'"v-if > ({{n}}) </a>
		
	</template >
		<a href="javascript:;" @click="fnPageMove(2)"> ▶</a>
		<a href="javascript:;" @click="fnPageMove(3)"> ≥</a>
		<div><button @click="fnMoveAdminPage">관리자페이지로 돌아가기</button></div>
		
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	list : [],
    	keyword : "",
    	pageCount : 1,
    	selectPage : 1,
    	selectNum : 10,
    	selectType : "id",
    	startNum :1,
		lastNum : 10,
		type : "id",
		order : "DESC",
		keywordType : "id",
    }
    , methods: {
    	
    	fnList: function() {
            var self = this;
            
            var nparmap = {
            		keyword : self.keyword,
            		startNum : self.startNum,
                	lastNum : self.lastNum,
                	keywordType : self.keywordType,
                	type : self.type,
                	order : self.order
                	
            };
            $.ajax({
                url:"AdminUserList.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data);
                	self.list = data.userList;
                	self.pageCount = Math.ceil(data.cnt/self.selectNum);
                }
            });
        },
        fnOrder : function(type,order){
    		var self = this;
            self.selectList = [];
            self.type=type;
            self.order = order;
            
            var startNum = ((self.selectPage-1)*self.selectNum)+1;
            var lastNum =self.selectPage *self.selectNum; 
            self.selectPage =self.selectPage;
            var nparmap = {keyword : self.keyword, keywordType : self.keywordType , 
            	startNum : startNum,
            	lastNum : lastNum,
            	kind : self.kind,
            	type : type,
            	order : order
            };
            $.ajax({
                url:"AdminUserList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	self.pageCount = Math.ceil(data.cnt/self.selectNum);
                }	
            }); 
        
    	},
        fnPageList : function(num){
            var self = this;
            
            var startNum = ((num-1)*self.selectNum)+1;
            var lastNum =num *self.selectNum;
            self.selectPage = num;
            var nparmap = {keyword : self.keyword, keywordType : self.keywordType , 
            	startNum : startNum,
            	lastNum : lastNum,
            	kind : self.kind,
            	type: self.type,
            	order : self.order
            };
            $.ajax({
                url:"AdminUserList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.userList;
                	self.pageCount = Math.ceil(data.cnt/self.selectNum);
                }	
            }); 
        },
        fnPageMove : function(num){
    		var self = this;
    		if(num ==1){
    			if(self.selectPage ==1){
    				self.selectPage = 1;
    			}else{
    				self.selectPage = self.selectPage-1;
                	console.log(self.selectPage);
    			}
            	
            }else if(num ==2){
            	if(self.selectPage >= self.pageCount){
            		self.selectPage = self.pageCount;
            	}else{
            		self.selectPage = self.selectPage +1;
            		console.log(self.selectPage);
            	}
            }
            else if(num ==3){
        		self.selectPage = self.pageCount;
        	}
    		self.fnPageList(self.selectPage);
    	},
        fnMoveUserDetail : function(userId){
        	
        	$.pageChange("/adminUserDetail.do", { userId : userId });
        },
        fnMoveAdminPage : function(){location.href="/admin-main.do"}
        
    	
    }
    , created: function() {
    	var self = this;
    	self.fnList();
		
	}
});
</script>