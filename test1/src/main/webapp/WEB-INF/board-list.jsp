<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/team_project_style.css">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>첫번째 페이지</title>
<style>
body {
    font-family: Arial, sans-serif;
}

table {
    margin: 10px;
    border-collapse: collapse;
    width: 100%;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
    font-size: 14px;
    font-family: Arial, sans-serif;
}

th {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #f5f5f5;
}

button {
    margin-top: 10px;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    transition: background-color 0.3s;
    font-family: Arial, sans-serif;
}

button:hover {
    background-color: #45a049;
}

li {
    display: inline-block;
    margin-left: 10px;
}

ul {
    padding: 5px 10px;
    cursor: pointer;
    background-color: #4CAF50;
    color: white;
    border-radius: 4px;
    display: inline-block;
    margin-right: 10px;
    font-size: 16px;
}

ul:hover {
    background-color: #45a049;
}

.page-num {
    font-weight: bold;
}

</style>
</head>
<body>
    <div id="app">
        <li>
            <ul v-for="item in boardList"
                :class="[kind == item.code ? 'select-tab' : 'tab']"
                @click="fnGetList(item.code)">{{item.name}}
            </ul>
        </li>
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>사용자</th>
                <th>조회수</th>
                <th>작성일</th>
                <th>칼로리</th>
            </tr>
            <tr v-for="(item, index) in displayedList">
                <td>{{ item.boardNo }}</td>
                <td><a href="javascript:;" @click="fnView(item.boardNo, kind)" v-html="item.title"></a></td>
                <td>{{ item.userId }}</td>
                <td>{{ item.hits }}</td>
                <td>{{ item.uDateTime }}</td>
                <td>{{ item.kCal }}</td>
            </tr>
        </table>
        <div id="pagination">
            <a href="#" @click="fnPre">＜</a>
            <template v-for="n in pageCount">
                <a href="#" @click="fnPageList(n)">
                    <span :class="[selectPage == n ? 'page-num' : '']">{{n}}</span>
                </a>
            </template>
            <a href="#" @click="fnNext">＞</a>
        </div>
        <div v-if="userId != '' && userId != undefined">
            <button @click="fnWrite">글쓰기</button>
            <!-- <button @click="fnDelete">삭제</button>  -->
            {{userId}}
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            list: [],
            userId: "${userId}",
            kind: 1,
            boardList: ${boardList},
            pageCount: 1,
            selectPage: 1,
            itemsPerPage: 10 
        },
        computed: {
            displayedList() {
                const start = (this.selectPage - 1) * this.itemsPerPage;
                const end = start + this.itemsPerPage;
                return this.list.slice(start, end);
            }
        },
        methods: {
            fnGetList: function(kind) {
                var self = this;
                self.kind = kind;
                var nparmap = {
                    kind: kind
                };
                $.ajax({
                    url: "boardList.dox",
                    dataType: "json",
                    type: "POST",
                    data: nparmap,
                    success: function(data) {
                        self.list = data.list.sort(function(a, b) {
                            return new Date(b.uDateTime) - new Date(a.uDateTime);
                        });
                        self.pageCount = Math.ceil(self.list.length / self.itemsPerPage);
                    }
                });
            },
            fnWrite: function() {
                var self = this;
                if (self.userId != "") {
                    $.pageChange("boardInsert.do", {
                        kind: self.kind
                    });
                } else {
                    alert("로그인 후 이용");
                    $.pageChange("/user-login.do", {});
                }
            },
            fnView: function(boardNo, kind) {
                var self = this;
                if (self.userId != "") {
                    $.pageChange("/boardView.do", {
                        boardNo: boardNo,
                        kind: kind
                    });
                } else {
                    alert("로그인 후 이용");
                    $.pageChange("/user-login.do", {});
                }
            },
            fnPre: function() {
                var self = this;
                if (self.selectPage != 1) {
                    self.selectPage = self.selectPage - 1;
                }
            },
            fnNext: function() {
                var self = this;
                if (self.selectPage != self.pageCount) {
                    self.selectPage = self.selectPage + 1;
                }
            },
            fnPageList: function(num) {
                var self = this;
                self.selectPage = num;
            }
        },
        created: function() {
            this.fnGetList(this.kind);
        }
    });
</script>