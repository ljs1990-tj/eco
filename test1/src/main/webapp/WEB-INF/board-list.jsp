<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/team_project_style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Gaegu&family=IBM+Plex+Sans+KR&family=Orbit&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>게시판 목록 페이지</title>
<style>
div#app {
    text-align: center;
    
}

body, button {
	font-family: "Gaegu", sans-serif;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin: 10px auto;
}

caption {
	font-weight: bold;
	font-size: 24px;
	color: #000000;
	text-align: center;
	padding: 10px 0;
}

th, td {
	border-top: none;
	border-bottom: 1px solid #ddd;
	border-right: none;
	padding: 8px;
	text-align: center;
	font-size: 14px;
	font-family: "Orbit", sans-serif;
	font-weight: 400;
	font-style: normal;
	cursor: default;
}

tr:hover {
	background-color: #f5f5f5;
}

tr {
	border: top 1px solid black;
	border-bottom: 1px solid black;
}

th {
	background-color: #f2f2f2;
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
	display: inline-block;
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
	color: black;
	border-radius: 4px;
	display: inline-block;
	margin-right: 10px;
	font-size: 30px;
}

ul:hover {
	background-color: #fff;
}

.page-num {
	font-weight: bold;
}

td {
	height: 70px;
}

.page-num {
	font-weight: bold;
	font-size: 30px;
}
.pagination{
	 text-align: center;
	 font-size: 20px;
}
.write-button {
    margin-left: 1000px;
    font-size: 20px;
}

</style>
</head>
<body>
	<div id="app">
		<li>
			<ul v-for="item in boardList"
				:class="[kind == item.code ? 'select-tab' : 'tab']"
				@click="fnGetList(item.code); fnResetPage()">{{item.name}}
			</ul>
		</li>
		<table>
			<tr>
				<th>번호</th>
				<th style="width: 40%;">제목</th>
				<th v-if="kind == '2'">이미지</th>
				<th>사용자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>칼로리</th>
			</tr>
			<tr v-for="(item, index) in displayedList">
				<td>{{ item.boardNo }}</td>
				<td><a href="javascript:;" @click="fnView(item.boardNo, kind)"
					v-html="item.title"></a></td>
				<td v-if="kind == '2'">
					<template v-for="item2 in fileList"
						v-if="item.boardNo == item2.boardNo">
						<template v-if="item2.kind == 1">
							<img :src="item2.path" alt="" width="100px">
						</template>
					</template>
				</td>

				<td><a href="javascript:;" @click="fnUser(item.userId)">{{item.userId}}</a>
				</td>
				<td>{{ item.hits }}</td>
				<td>{{ item.uDateTime }}</td>
				<td>{{ item.kCal }}</td>
			</tr>
		</table>
		<div v-if="userId != '' && userId != undefined">
			<button class="write-button" @click="fnWrite" v-if="userType == 'A' || kind != 1">글쓰기</button>
		</div>
		<div class="pagination">
			<a href="#" @click="fnPre">＜</a>
			<template v-for="n in pageCount">
				<a href="#" @click="fnPageList(n)"> <span
					:class="[selectPage == n ? 'page-num' : '']">{{n}}</span>
				</a>
			</template>
			<a href="#" @click="fnNext">＞</a>
		</div>
		
	</div>
</body>
<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            list: [],
            userId: "${userId}",
            userType : "${userType}",
            kind: 2,
            boardList: ${boardList},
            pageCount: 1,
            selectPage: 1,
            itemsPerPage: 10,
            fileList : []
        },
        computed: {
            displayedList() {
                const start = (this.selectPage - 1) * this.itemsPerPage;
                const end = start + this.itemsPerPage;
                return this.list.slice(start, end);
            }
        },
        methods: {
            fnResetPage: function() {
                this.selectPage = 1;
            },
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
                        if (self.selectPage > self.pageCount) {
                            self.selectPage = 1;
                        }
                    }
                    
                });
            },
            fnFileList: function() {
            	var self = this;
            	var nparmap = {
            			kind: self.kind
                    };
                    $.ajax({
                        url: "boardFile.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function(data) {
                        	console.log(data);
                        	self.fileList= data.boardFile;
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
/*                     if (kind == 2) {
                    	$.pageChange("/boardRecipe.do", {});
                    } else {
                        $.pageChange("/boardView.do", {
                            boardNo: boardNo,
                            kind: kind
                        });
                    } */
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
            },
			fnUser : function(userId) {
				$.pageChange("/boardUser.do", {userId : userId});
			},
	var app = new Vue({ 
		el: '#app',
		data: {
			list: [],
			userId : "${userId}",
			kind : 1,
			boardList : ${boardList}
		},
		methods: {
			fnGetList: function(kind) {
				var self = this;
				self.kind = kind;
				var nparmap = {
							kind : kind
							};
				$.ajax({
					url: "boardList.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function(data) { 
						console.log(data);
						self.list = data.list;
						
					}
				}); 
			},
			fnWrite: function() {
				var self = this;
				$.pageChange("boardInsert.do", { kind : self.kind });
			},
			fnView: function(boardNo) {
				$.pageChange("boardView.do", { boardNo : boardNo });
			},
			fnDelete : function() {
				var self = this;
				if (!confirm("삭제할거냐")) {
					return;
				}
				var nparmap = {
					boardNo : self.boardNo
				};
				$.ajax({
					url : "boardDelete.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						/* self.info = data.info; */
						if (data.result == "success") {
							alert("삭제되었습니다");
							$.pageChange("/boardList.do", {});
							//location.href = "/boardList.do"
						} else {
							alert("다시 시도해주세요");
						}
					}
				$.pageChange("/boardUser.do", {//user 상세보기
					userId : userId
				});
			},
        },
        created: function() {
            this.fnGetList(this.kind);
            this.fnFileList();
        }
    });
</script>
</html>