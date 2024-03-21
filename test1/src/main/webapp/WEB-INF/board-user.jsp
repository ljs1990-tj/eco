<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap-min.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap"
    rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
    href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Gaegu&family=IBM+Plex+Sans+KR&family=Orbit&family=Sunflower:wght@300&display=swap"
    rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>목록 페이지</title>
<style>
button {
    margin-top: 10px;
    padding: 10px 20px;
    
    cursor: pointer;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    transition: background-color 0.3s;
}

body {
    font-family: "Orbit", sans-serif;
    
}

li, ul {
    font-size: 20px;
    list-style-type :none;
}

button:hover {
    background-color: #45a049;
}

.info-table {
    border-collapse: collapse;
    width: 80%;
    
}

.info-table th, .info-table td {
    border: 1px solid #dddddd;
    text-align: center;
    padding: 8px;
}

.info-table th {
    background-color: #4CAF50;
    color: white;
}

</style>
</head>
<body>
    <div id="app">
        <table class="info-table">
            <tr>
                <th>항목</th>
                <th>정보</th>
            </tr>
            <tr>
                <td>이름</td>
                <td>{{user.name}}</td>
            </tr>
            <tr>
                <td>아이디</td>
                <td>{{user.userId}}</td>
            </tr>
            <tr>
                <td>성별</td>
                <td>{{user.gender}}</td>
            </tr>
            <tr>
                <td>폰번호</td>
                <td>{{user.phone1}} - {{user.phone2}} - {{user.phone3}}</td>
            </tr>
        </table>
        <h2>작성한 글 목록</h2>
        <table class="info-table">
            <tr>
                <th>번호</th>
                <th>제목</th>
            </tr>
            <tr v-for="(item, index) in list">
                <td>{{index + 1}}</td>
                <td>{{item.title}}</td>
            </tr>
        </table>
        <!-- <button @click="fnGetList">목록가기</button> -->
    </div>
</body>
</html>
<script type="text/javascript">
    var app = new Vue({
        el : '#app',
        data : {
            userId : "${map.userId}",//map = resultMap, controller의 boardUser의 map의 userId
            user : {},
            list : []
        },
        methods : {
            fnList : function() {
                var self = this;
                var nparmap = {
                    userId : self.userId
                };
                $.ajax({
                    url : "boardUser.dox",
                    dataType : "json",
                    type : "POST",
                    data : nparmap,
                    success : function(data) {
                        console.log(data.list);
                        self.user = data.user;
                        self.list = data.list;
                    }
                });
            },
            fnGetList : function() {
                var self = this;
                $.pageChange("/boardList.do", {});
            }

        },
        created : function() {
            var self = this;
            self.fnList();
        }
    });
</script>