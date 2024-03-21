<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap-min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&display=swap"
	rel="stylesheet">
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
.temp div {
	text-align: center;
}

.temp table {
	border-collapse: collapse;
	width: 80%;
	margin: 10px auto;
}

.temp th, td {
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

.temp tr:hover {
	background-color: #f5f5f5;
}

.temp tr {
	border: top 1px solid black;
	border-bottom: 1px solid black;
}

.temp th {
	background-color: #f2f2f2;
}

.temp button {
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

.temp button:hover {
	background-color: #45a049;
}

.temp li {
	display: inline-block;
}

.temp ul {
	padding: 5px 10px;
	cursor: default;
	color: black;
	border-radius: 4px;
	display: inline-block;
	margin-right: 10px;
	font-size: 30px;
}


.temp td {
	height: 70px;
}

.temp a {
	text-decoration: none;
}

.pagination {
	display: flex;
    justify-content: center;
    align-items: center;
}

.pagination a {
    margin: 0 5px; /* 페이지 링크 간격 조절 */
}

.page-num {
	font-weight: bold;
	font-size: 30px;
}

.write-button {
	float: right;
	margin-right: 190px;
	font-size: 20px;
	font-family: "Orbit", sans-serif;
}

.clear-both {
	clear: both;
	margin-bottom: 10px;
}

.blog__item-box {
	/* background-color: lightgrey; */
	padding: 10px;
	border: 1px solid rgb(179, 211, 179);
	width: 400px; /* 원하는 너비 값으로 조정 */
	margin: 60px; /* 원하는 마진 값으로 조정 */
	border-radius: 10px;
	color: #02662A;
}

.tab-button:focus, .tab-button:hover {
	color: green;
}

.box {
	width: 100%;
	height: 40%;
	/* background-color: #cccccc; */
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.box .horizontal-list {
	display: inline-block;
	list-style: none;
	padding: 0;
}

.box .horizontal-list li {
	display: inline-block;
	margin: 0 100px;
}

/* .accordion_body {
		display: none;
	}
	
	.accordion_container.active .accordion_body {
		display: block;
	}
	
	.accordion_body ul {
		list-style-type: none;
		padding: 0;
	} */
.point {
	font-size: 20px;
	font-family: "Orbit", sans-serif;
}

.select-tab {
	color: green;
	font-weight: bold;
	font-family: "Orbit", sans-serif;
}

.keyword {
	font-family: "Orbit", sans-serif;
}

.horizontal-list {
	cursor: default;
}
</style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<div id="app">
		<div class="temp">
			<div class="box">
				<li>
					<ul v-if="item.code != 3" v-for="item in boardList"
						:class="[kind == item.code ? 'select-tab' : 'tab']"
						@click="fnList(item.code); fnResetPage()" style="margin: 10px;"
						class="tab-button">{{item.name}}
					</ul>
				</li>
				<ul class="horizontal-list">
					<li class="review_event_item">
						<div class="item_icon">
							<i class="fas fa-clipboard" style="font-size: 50px;"></i>
						</div>
						<p class="large_txt" style="font-family: 'Orbit', sans-serif;">일반
							리뷰</p>
						<div class="point_txt">
							<span class="point">500P 적립</span>
						</div>
					</li>
					<li class="review_event_item">
						<div class="item_icon">
							<i class="fas fa-camera-retro" style="font-size: 50px;"></i>
						</div>
						<p class="large_txt" style="font-family: 'Orbit', sans-serif;">포토
							리뷰</p>
						<div class="point_txt">
							<span class="point">1000P 적립</span>

						</div>
					</li>
					<li class="review_event_item">
						<div class="item_icon">
							<i class="fas fa-thumbs-up" style="font-size: 50px;"></i>
						</div>
						<p class="large_txt" style="font-family: 'Orbit', sans-serif;">베스트
							리뷰어</p>
						<div class="point_txt">
							<span class="point">5000P 적립</span>

						</div>
					</li>
				</ul>

				<!--		<div class="accordion_container">
					<div class="accordion_header">
						<a href="javascript:;" @click="fnReview()" style="width: 250px;">리뷰 가이드 보기</a>					
					</div>
	 				<div class="accordion_body">
						<div id="r_policy_dt" style="overflow: hidden; display: block;">
							<div class="caution_box">
								<span class="ding"><i class="fas fa-star"
									style="font-size: 15px;"></i></span> <span class="ttl large_txt">꼭
									알아두세요<i class="fas fa-star" style="font-size: 15px;"></i>
								</span>
								<div class="lst_type dot">
									<ul class="dot_style">
										<li class="normal_txt">리뷰 작성은 에코 마켓 회원, 실 구매자만 가능합니다.
											(네이버페이 구매 비회원은 리뷰작성가능)</li>
										<li class="normal_txt">배송완료 후 30일 이내 작성된 리뷰만 포인트 지급이 되는점
											유의해주세요.</li>
										<li class="normal_txt">본인이 작성하지 않은 리뷰(타 사이트 포함)의 무단전제 또는
											운영취지에 어긋나는 게시물은 별도의 통보 없이 삭제 됩니다.</li>
										<li class="normal_txt">리뷰는 내용의 충실성, 등록된 이미지에 대한 평가를 통해
											운영자가 승인한 게시물에 대해서만 게시 및 포인트가 적립됩니다.</li>
										<li class="normal_txt">게시물이 타인의 저작권 및 초상권을 침해할 경우 이와 관련된
											법적 책임은 게시물을 작성한 회원님에게 있습니다.</li>
										<li class="normal_txt">작성 리뷰는 별도의 공지 없이 에코 마켓의 마케팅 채널에 활용될
											수 있습니다.</li>
									</ul>
								</div>
							</div>
							<div class="caution_box">
								<span class="ding">X</span> <span class="ttl large_txt">공개가
									보류될 수 있는 리뷰</span>
								<div class="lst_type dot">
									<ul class="dot_style">
										<li class="normal_txt">실제 사용에 대해서는 알 수 없는 상품 사진만 올린 경우
											(택배샷포함)</li>
										<li class="normal_txt">제품에 대한 리뷰내용이 아닐 시 (배송, 택배박스, 파손, 누락
											등)</li>
										<li class="normal_txt">타 블로그에 포스팅한 리뷰에 대해서 이미지와 텍스트를 이미지로
											합쳐서 캡쳐한 걸 업로드시</li>
										<li class="normal_txt">이미지가 보이지 않거나 해상도가 현저히 떨어지는 경우 (엑박이
											존재하는 경우, 네이버 블로그에서 복사 &amp; 붙여넣기 한 경우)</li>
									</ul>
								</div>
							</div>
							<div class="caution_box">
								<span class="ding">√</span> <span class="ttl large_txt">예시를
									통해 적립금 지급 방법을 확인해보세요!</span>
								<div class="lst_type dot">
									<ul class="dot_style">
										<li class="normal_txt">[포토 후기]</li>
										<li class="normal_txt">음식을 요리하는 과정을 담고 있는 사진 또는 음식이 담긴 사진과
											함께 리뷰 등록 → <b>1,000원 적립</b>
										</li>
										<li class="normal_txt">샐러드와 같은 야채 제품이라면 야채의 싱싱함을 표현할 수 있는
											장면을 사진과 함께 리뷰 등록 → <b>1,000원 적립</b>
										</li>
										<li class="normal_txt">직접 요리해서 드시는 사진이나 실생활에서 식사하는 사진과 함께
											리뷰 등록 → <b>1,000원 적립</b>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div> 
				</div> -->
			</div>
			<div>
				<select v-model="keywordType">
					<option value="title">제목</option>
					<option value="user">작성자</option>
				</select> 
				검색: <input type="text" v-model="keyword"
					@keyup.enter="fnList(kind)">
				<button @click="fnList(kind)">검색</button>
			</div>


			<table v-if="kind==1">
				<tr>
					<th>번호</th>
					<th style="width: 50%;">제목</th>
					<th>사용자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
				<tr v-if="list.length == 0">
					<td colspan="5">검색 결과가 없습니다.</td>
				</tr>
				<tr v-for="(item, index) in list">
					<td>{{ item.boardNo }}</td>
					<td><a href="javascript:;" @click="fnView(item.boardNo, kind)"
						v-html="item.title" style="color: #02662A; font-weight: 600;"></a></td>
					<td><a href="javascript:;" @click="fnUser(item.userId)"
						style="color: #02662A; font-weight: bold;">{{item.userId}}</a></td>
					<td>{{ item.hits }}</td>
					<td>{{ item.cDate }}</td>
				</tr>
			</table>
			<div v-if="kind==2" style="display: flex; flex-wrap: wrap;">
				<div v-if="list.length == 0" class="box"
					style="font-weight: bold; margin-top: 10px;">검색 결과가 없습니다.</div>
				<div class="col-lg-3 col-md-3 col-sm-3 blog__item-box"
					v-for="item in list" style="color: #02662A;">
					<div class="blog__item">
						<div class="blog__item__pic">
							<template v-for="item2 in fileList"
								v-if="item.boardNo == item2.boardNo">
								<template v-if="item2.kind == 1">
									<img :src="item2.path" alt="" width="350px" height="250px">
								</template>
							</template>
						</div>
						<div class="blog__item__text">
							<div>
								<i class="fa fa-calendar"></i> {{item.cDate}}
							</div>
							<div>
								<i class="fa fa-eye"></i> {{item.hits}}
							</div>
							<h5>
								<a @click="fnView(item.boardNo, kind)" href="javascript:;"
									style="font-size: 35px; color: #2C9D59; font-family: 'Orbit', sans-serif;">
									{{truncateText(item.title, 10)}}</a>
							</h5>
							<p>
								<span v-html="truncateText(item.contents, 50)"
									style="color: #02662A;"></span>
							</p>
							<div>
								<i class="fa fa-user"></i> <a href="javascript:;"
									@click="fnUser(item.userId)"
									style="color: #2C9D59; font-size: 20px; font-weight: bold;">
									{{item.userId}}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div v-if="userId != '' && userId != undefined">
				<button class="write-button" @click="fnWrite"
					v-if="userType == 'A' || kind != 1">글쓰기</button>

			</div>
			<div class="pagination">
				<template v-for="n in pageCount">
					<a href="javascript:;" @click="fnPageList(n)"> <span
						:class="[selectPage == n ? 'page-num' : '']">{{n}}</span>
					</a>
				</template>
			</div>
		</div>
	</div>
	<div class="clear-both"></div>
	<%@ include file="layout/footer.jsp"%>
</body>

<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            list: [],
            userId: "${userId}",
            userType : "${userType}",
			keyword : "${map.keyword}",
			keywordType : "${map.keywordType}",
			kind : "${map.code}",
            boardList: ${boardList},
			pageCount : 1,
			selectPage : 1,
            searchCnt : 10, //디폴트 10으로 설정
            fileList : [],
			type : "CDATE",
			offset: 1, // 페이지 오프셋 초기값
			limit: 9, 
        },
       
        methods: {
			fnList : function(kind) {
				var self = this;
				self.kind = kind;
				var nparmap = {
						keyword : self.keyword,
						keywordType : self.keywordType,
						kind : kind,
						startNum : 1,
						lastNum : 10,
						type : self.type,
						order : self.order,
						offset : 0,
						limit : 9
				};
				$.ajax({
					url : "boardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
						self.pageCount = Math.ceil(data.cnt/10);//self.pageCount최대값

					}
				});
			},
			fnResetPage: function() {
			    var self = this;
			    this.selectPage = 1;
			    this.keyword = "";
			    this.fnList(this.kind); 
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
                    $.pageChange("/boardInsert.do", {
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
            fnPageList: function(num) {
                var self = this;
                self.selectPage = num;
                var offset = (num - 1) * self.limit; // 오프셋 계산
                var nparmap = {
                    keyword: self.keyword,
                    keywordType: self.keywordType,
                    kind: self.kind,
                    offset: offset, // 오프셋 전달
                    limit: self.limit, // 리미트 전달
                    type: self.type,
                    order: self.order
                };
                $.ajax({
                    url: "boardList.dox",
                    dataType: "json",
                    type: "POST",
                    data: nparmap,
                    success: function(data) {
                        console.log(data.cnt);
                        self.list = data.list;
                        self.pageCount = Math.ceil(data.cnt / self.limit); // 전체 페이지 수 계산
                    }
                });
            },
            fnUser: function(userId) {
                var url = "/boardUser.do?userId=" + userId;
                window.open(url, "_blank", "width=500,height=600");
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
            self.fnList(self.kind);
            self.fnFileList();
        },
        updated: function () {
            window.scrollTo(0, 0); // 페이지 상단으로 스크롤
        },
        
    });
</script>
</html>
