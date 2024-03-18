<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap-min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Gaegu&family=IBM+Plex+Sans+KR&family=Orbit&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
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


td {
	height: 70px;
}

a {
	text-decoration: none;
}

.pagination {
	text-align: center;
	font-size: 20px;
}


.page-num {
	font-weight: bold;
	font-size: 30px;
}

.write-button {
	margin-left: 1000px;
	font-size: 20px;
}

.blog__item-box {
	background-color: lightgrey;
	padding: 10px;
	/* border: 1px solid rgb(179, 211, 179); */
	width: 400px; /* 원하는 너비 값으로 조정 */
	margin: 60px; /* 원하는 마진 값으로 조정 */
	border-radius: 10px;
}
</style>
</head>
<body>
<%@ include file="layout/header.jsp" %>
	<div id="app">
		<li>
			<ul v-if="item.code != 3" v-for="item in boardList"
				:class="[kind == item.code ? 'select-tab' : 'tab']"
				@click="fnList(item.code); fnResetPage()" style="margin: 10px;">{{item.name}}
			</ul>
		</li>
		<div>
			<select v-model="keywordType">
				<option value="title">제목</option>
				<option value="user">작성자</option>
			</select>
			검색: 
			<input type="text" v-model="keyword" @keyup.enter="fnList(kind)">
			<button @click="fnList(kind)">검색</button>
			<!-- <input style="margin-right: 1500px;" type="text" v-model="searchQuery" placeholder="검색어를 입력하세요"> -->
			<!-- <button @click="search">검색</button> -->
		</div>
		
		<table v-if="kind==1">
			<tr>
				<th>번호</th>
				<th style="width: 40%;">제목</th>
				<th>사용자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<tr v-for="(item, index) in list">
				<td>{{ item.boardNo }}</td>
				<td><a href="javascript:;" @click="fnView(item.boardNo, kind)"
					v-html="item.title"></a></td>

				<td><a href="javascript:;" @click="fnUser(item.userId)">{{item.userId}}</a>
				</td>
				<td>{{ item.hits }}</td>
				<td>{{ item.uDateTime }}</td>
			</tr>
		</table>
		<div v-if="kind==2" style="display: flex; flex-wrap: wrap;">
			<div class="col-lg-3 col-md-3 col-sm-3 blog__item-box" v-for="item in list">
				<div class="blog__item">
					<div class="blog__item__pic">
						<template v-for="item2 in fileList" v-if="item.boardNo == item2.boardNo">
							<template v-if="item2.kind == 1">
								<img :src="item2.path" alt="" width="350px" height="250px">
							</template>
						</template>
					</div>
					<div class="blog__item__text">
						<div><i class="fa fa-calendar"></i> {{item.uDateTime}}</div>
						<div><i class="fa fa-thumbs-up"></i> {{item.hits}}</div>
						<h5>
							<a @click="fnView(item.boardNo, kind)" href="javascript:;" style="font-size: 30px;">
							{{truncateText(item.title, 10)}}</a>
						</h5>
						<p><span v-html="truncateText(item.contents, 50)"></span></p>
					</div>
				</div>
			</div>
		</div>
		<div v-if="userId != '' && userId != undefined">
			<button class="write-button" @click="fnWrite"
				v-if="userType == 'A' || kind != 1">글쓰기</button>
		</div>
		<div class="pagination">
			<a href="javascript:;" @click="fnPre">＜</a>
			<template v-for="n in pageCount">
				<a href="javascript:;" @click="fnPageList(n)"> <span
					:class="[selectPage == n ? 'page-num' : '']">{{n}}</span>
				</a>
			</template>
			<a href="javascript:;" @click="fnNext">＞</a>
		</div>
	</div>
<%@ include file="layout/footer.jsp" %>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            list: [],
            userId: "${userId}",
            userType : "${userType}",
			keyword : "",
			keywordType : "title",
            kind: 1,
            boardList: ${boardList},
			pageCount : 1,
			selectPage : 1,
            /* itemsPerPage: 9, */
            fileList : [],
            /* searchQuery: '' */
        },
        /* computed: {
            displayedList() {
            	 if (this.searchQuery) {
                 	return this.list.filter(item => item.title.includes(this.searchQuery));
                 } 
                const start = (this.selectPage - 1) * this.itemsPerPage;
                const end = start + this.itemsPerPage;
                return this.list.slice(start, end);
            }
        }, */
        methods: {
			fnList : function(kind) {
				var self = this;
				self.kind = kind;
				self.selectList = [];
				var nparmap = {
						keyword : self.keyword,
						keywordType : self.keywordType,
						kind : kind,
						startNum : 1,
						lastNum : 10,
						type : self.type,
						order : self.order
				};
				$.ajax({
					url : "boardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
					//	self.pageCount = Math.ceil(data.cnt/10);//self.pageCount최대값
					}
				});
			},
            fnResetPage: function() {
                this.selectPage = 1;
            },
            /* fnGetList: function(kind) {
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
            }, */
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
            fnUser: function(userId) {
                var url = "/boardUser.do?userId=" + userId;
                window.open(url, "_blank", "width=600,height=600");
            },
            truncateText(text, maxLength) {
                if (text.length > maxLength) {
                    return text.slice(0, maxLength) + '...';
                } else {
                    return text;
                }
            },
        },
        created: function() {
        	var self = this;
            /* this.fnGetList(this.kind); */
            self.fnList(2);
            self.fnFileList();
        }
    });
</script>
</html>
