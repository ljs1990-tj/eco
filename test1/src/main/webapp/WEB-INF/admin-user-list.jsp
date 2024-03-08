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
	
	<input type="text" v-model="keyword" @keyup="fnList()"> <button @click="fnList()">검색</button>
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
			<td><button>눌러보던가</button></td>
		</tr>
		
		
		
		</table>
	
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	list : [],
    	keyword : ""
    }
    , methods: {
    	
    	fnList: function() {
            var self = this;
            var nparmap = {
            		keyword : self.keyword
            };
            $.ajax({
                url:"AdminUserList.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data);
                	self.list = data.userList;
                	
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