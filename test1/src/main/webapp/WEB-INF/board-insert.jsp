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
table, div {
	margin: 10px;
}

table, tr, th {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: center;
}
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>사용자</th>
				<th>조회수</th>
				<th>cdate</th>
				<th>udate</th>
				<th>칼로리</th>
			</tr>
			<tr v-for="item in list">
				<th>{{item.boardNo}}</th>
				<th a href="#" @click="fnView(item.boardNo)">{{item.title}}</th>
				<th>{{item.contents}}</th>
				<th>{{item.userId}}</th>
				<th>{{item.hits}}</th>
				<th>{{item.cDateTime}}</th>
				<th>{{item.uDateTime}}</th>
				<th>{{item.kCal}}</th>
			</tr>
		</table>
		<button @click="fnWrite">글쓰기</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		list : []
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"boardInsert.dox",//이 주소를 호출하고 있음
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
	                self.list = data.list;
                }
            }); 
        },
        fnWrite : function(userId){
        	$.pageChange("boardInsert.do", {userId : userId});
        },
        
        fnView : function(boardNo){
        	$.pageChange("boardView.do", {boardNo : boardNo});
        }
    }   
    , created: function () {  //created -> 페이지 로드되었을때 최초로 실행되는 함수 즉 여기선 fnGetList() 함수 호출
    	var self = this;
    	self.fnGetList();
	}
});
</script>