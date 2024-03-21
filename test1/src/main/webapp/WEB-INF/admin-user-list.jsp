<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<title>유저 관리 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles-admin.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<style>
.myContents table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.myContents th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: left;
	text-align: center;
}

.myContents th {
	background-color: rgb(247, 187, 7);
	color: #fff;
	text-align: center;
}
</style>
<body>

	<div id="app">
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand ps-3" href="/admin-main.do">관리자 페이지</a>
			<!-- Sidebar Toggle-->
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
				id="sidebarToggle" href="#!">
				<i class="fas fa-bars"></i>
			</button>
			<!-- Navbar Search-->
			<form @submit.prevent="handleFormSubmit"
				class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
				<div class="input-group">
					<input @keyup.enter="fnMoveUserDetail" class="form-control"
						type="text" placeholder="유저 아이디로 검색..." aria-label="유저 아이디로 검색..."
						aria-describedby="btnNavbarSearch" v-model="keywordId" autofocus />
					<button class="btn btn-primary" id="btnNavbarSearch" type="button"
						@click="fnMoveUserDetail">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</form>


			<!-- Navbar-->
			<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
						class="fas fa-user fa-fw"></i></a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#">아이디 : {{userId}}</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#" @click="fnLogout">Logout</a></li>
					</ul></li>
				<li><a href="main.do" class="nav-link dropdown"> <i
						class="bi bi-house-door-fill"></i>
				</a></li>
			</ul>

		</nav>
		<div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark"
					id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<div class="sb-sidenav-menu-heading">링크</div>
							<a class="nav-link" href="/admin-main.do">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> 관리자 페이지
							</a> <a class="nav-link" href="/main.do">
								<div class="sb-nav-link-icon">
									<i class="bi bi-house-door-fill"></i>
								</div> 메인 페이지
							</a>
							<div class="sb-sidenav-menu-heading">상품관리</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapseLayouts" aria-expanded="false"
								aria-controls="collapseLayouts">
								<div class="sb-nav-link-icon">
									<i class="fas fa-columns"></i>
								</div> 상품리스트
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>

							<div class="collapse" id="collapseLayouts"
								aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="#"
										@click="fnMoveProductList('gluten')">글루텐프리</a> <a
										class="nav-link" href="#" @click="fnMoveProductList('local')">로컬</a>
									<a class="nav-link" href="#"
										@click="fnMoveProductList('vegan')">비건</a> <a class="nav-link"
										href="#" @click="fnMoveProductList('org')">유기농</a>

								</nav>
							</div>

							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapsePages" aria-expanded="false"
								aria-controls="collapsePages">
								<div class="sb-nav-link-icon">
									<i class="fas fa-book-open"></i>
								</div> 작성 기능
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>

							<div class="collapse" id="collapsePages"
								aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav accordion"
									id="sidenavAccordionPages">
									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth"
										aria-expanded="false" aria-controls="pagesCollapseAuth">
										상품등록
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="pagesCollapseAuth"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordionPages">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="#" @click="handleAddProduct('gluten')">글루텐프리</a> 
											<a class="nav-link" href="#" @click="handleAddProduct('local')">로컬</a> 
											<a class="nav-link" href="#" @click="handleAddProduct('vegan')">비건</a> 
											<a class="nav-link" href="#" @click="handleAddProduct('org')" >유기농</a>
										</nav>
									</div>
									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse" data-bs-target="#pagesCollapseError"
										aria-expanded="false" aria-controls="pagesCollapseError">
										게시판 컨트롤
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="pagesCollapseError"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordionPages">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="javascript:;" @click="fnMoveBoardList(1)">공지게시판 이동</a>
											 <a class="nav-link" href="javascript:;" @click="fnMoveBoardList(2)">레시피게시판 이동</a>


										</nav>

									</div>

								</nav>

							</div>
							<div>
								<a class="nav-link collapsed" href="AdminUserList.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-people-fill"></i>
									</div>유저관리

								</a>
							</div>
							<div class="sb-sidenav-menu-heading">차트분석</div>
							<a class="nav-link" href="/AdminProductChart.do">
								<div class="sb-nav-link-icon">
									<i class="fas fa-chart-area"></i>
								</div> 월 매출 차트
							</a>
							<div class="sb-sidenav-menu-heading">결제로그</div>
							<a class="nav-link" href="AdminPaymentList.do">
								<div class="sb-nav-link-icon">
									<i class="bi bi-credit-card"></i>
								</div> 결제로그
							</a>
						</div>
					</div>
					<div class="sb-sidenav-footer">
						<div class="small">현재 로그인된 아이디:</div>
						{{userId}}
					</div>
				</nav>
			</div>
			<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid px-4">

<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 가입 유저 리스트
							</div>
							<div class="card-body">
						<div class="myContents">
							<select v-model="selectNum" @click="fnPageList(1)">
								<option value="5">5개</option>
								<option value="10">10개</option>
								<option value="20">20개</option>
								<option value="30">30개</option>
							</select> <select v-model="keywordType">
								<option value="id">아이디</option>
								<option value="name">닉네임</option>
							</select> <input type="text" v-model="keyword" @keyup="fnList()">
							<button @click="fnList()">검색</button>
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
									<th>총 결제금액</th>
									<th>포인트</th>
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
									<td v-if="item.userType=='A'">어드민</td>
									<td v-if="item.userType=='U'">유저</td>
									<td v-if="item.userType=='D'">삭제예정</td>
									<td v-if="item.userType=='F'">판매자</td>

									<td>{{item.totalPay.toLocaleString('ko-KR')}}원</td>
									<td>{{item.point.toLocaleString('ko-KR')}}포인트</td>
									<td><button @click="fnMoveUserDetail(item.userId)">상세보기</button></td>
								</tr>



							</table>
							<a href="javascript:;" @click="fnPageMove(1)">◀</a>
							<template v-for="n in pageCount">

								<a href="javascript:;" @click="fnPageList(n)"
									style="color: red;"
									:class="selectPage == n ? 'select-tab' : 'tab'" v-if>
									({{n}}) </a>

							</template>
							<a href="javascript:;" @click="fnPageMove(2)"> ▶</a> <a
								href="javascript:;" @click="fnPageMove(3)"> ≥</a>
							</div></div>
						</div>
					</div>
				</main>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			keyword : "",
			pageCount : 1,
			selectPage : 1,
			selectNum : 10,
			selectType : "id",
			startNum : 1,
			lastNum : 10,
			type : "id",
			order : "DESC",
			keywordType : "id",
			keywordId : "",
			userId : "${userId}"
		},
		methods : {

			fnList : function() {
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
					url : "AdminUserList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.userList;
						self.pageCount = Math.ceil(data.cnt / self.selectNum);
					}
				});
			},
			fnLogout : function() {
				var self = this;
				if (confirm("정말로 로그아웃하나요?")) {
					self.logFlg = false;
					location.href = "/user-login.do";
				} else {
					return;
				}
			},
			fnOrder : function(type, order) {
				var self = this;
				self.selectList = [];
				self.type = type;
				self.order = order;

				var startNum = ((self.selectPage - 1) * self.selectNum) + 1;
				var lastNum = self.selectPage * self.selectNum;
				self.selectPage = self.selectPage;
				var nparmap = {
					keyword : self.keyword,
					keywordType : self.keywordType,
					startNum : startNum,
					lastNum : lastNum,
					kind : self.kind,
					type : type,
					order : order
				};
				$.ajax({
					url : "AdminUserList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						self.pageCount = Math.ceil(data.cnt / self.selectNum);
					}
				});

			},
			fnMoveUserDetail : function() {
				var self = this;
				var url = "adminUserDetail.do?userId=" + self.keywordId;

				var width = 500;
				var height = 550;
				var left = (screen.width - width) / 2;
				var top = (screen.height - height) / 2;

				window.open(url, "", "width=" + width + ", height=" + height
						+ ", left=" + left + ", top=" + top);
			},
			handleFormSubmit : function() {
				var self = this;
				// 팝업 창을 열고자 하는 페이지 URL
				var url = "adminUserDetail.do";

				// POST 방식으로 전송할 데이터
				var postData = {
					userId : self.keywordId,
					popupFlg : "yes"
				};

				// form 엘리먼트를 동적으로 생성
				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", url);
				form.setAttribute("target", "_blank"); // 새 창으로 열기

				// 데이터를 form에 추가
				for ( var key in postData) {
					if (postData.hasOwnProperty(key)) {
						var hiddenField = document.createElement("input");
						hiddenField.setAttribute("type", "hidden");
						hiddenField.setAttribute("name", key);
						hiddenField.setAttribute("value", postData[key]);
						form.appendChild(hiddenField);
					}
				}

				// body에 form 추가하고 submit
				document.body.appendChild(form);

				// 팝업 창 크기 설정
				var width = 500;
				var height = 600;
				var left = (screen.width - width) / 2;
				var top = (screen.height - height) / 2;
				var options = "width=" + width + ", height=" + height
						+ ", left=" + left + ", top=" + top;
				// 새로운 창에 대한 참조 저장
				var popupWindow = window.open("", "popup", options);

				// form을 제출하면서 팝업 창에 대한 참조를 반환하도록 수정
				form.target = "popup";
				form.submit();

				// form 제거
				document.body.removeChild(form);
			},
			
			fnMoveProductList : function(code){
				$.pageChange("/AdminProductList.do", {
					code : code
				});
			},
			handleAddProduct : function(code){
				var self = this;
				 // 팝업 창을 열고자 하는 페이지 URL
			    var url = "productAdd.do";

			    // POST 방식으로 전송할 데이터
			    var postData = {
			        code : code,
			        popupFlg : "yes"
			    };

			    // form 엘리먼트를 동적으로 생성
			    var form = document.createElement("form");
			    form.setAttribute("method", "post");
			    form.setAttribute("action", url);
			    form.setAttribute("target", "_blank"); // 새 창으로 열기

			    // 데이터를 form에 추가
			    for (var key in postData) {
			        if (postData.hasOwnProperty(key)) {
			            var hiddenField = document.createElement("input");
			            hiddenField.setAttribute("type", "hidden");
			            hiddenField.setAttribute("name", key);
			            hiddenField.setAttribute("value", postData[key]);
			            form.appendChild(hiddenField);
			        }
			    }

			    // body에 form 추가하고 submit
			    document.body.appendChild(form);
			    
			    // 팝업 창 크기 설정
			    var width = 500;
			    var height = 600;
			    var left = (screen.width - width) / 2;
			    var top = (screen.height - height) / 2;
			    var options = "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top;
			    // 새로운 창에 대한 참조 저장
			    var popupWindow = window.open("", "popup", options);
			    
			    // form을 제출하면서 팝업 창에 대한 참조를 반환하도록 수정
			    form.target = "popup";
			    form.submit();
			    
			   
			    // form 제거
			    document.body.removeChild(form);
			},
			fnPageList : function(num) {
				var self = this;

				var startNum = ((num - 1) * self.selectNum) + 1;
				var lastNum = num * self.selectNum;
				self.selectPage = num;
				var nparmap = {
					keyword : self.keyword,
					keywordType : self.keywordType,
					startNum : startNum,
					lastNum : lastNum,
					kind : self.kind,
					type : self.type,
					order : self.order
				};
				$.ajax({
					url : "AdminUserList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.userList;
						self.pageCount = Math.ceil(data.cnt / self.selectNum);
					}
				});
			},
			fnPageMove : function(num) {
				var self = this;
				if (num == 1) {
					if (self.selectPage == 1) {
						self.selectPage = 1;
					} else {
						self.selectPage = self.selectPage - 1;
						console.log(self.selectPage);
					}

				} else if (num == 2) {
					if (self.selectPage >= self.pageCount) {
						self.selectPage = self.pageCount;
					} else {
						self.selectPage = self.selectPage + 1;
						console.log(self.selectPage);
					}
				} else if (num == 3) {
					self.selectPage = self.pageCount;
				}
				self.fnPageList(self.selectPage);
			},
			fnMoveUserDetail : function(userId) {

				$.pageChange("/adminUserDetail.do", {
					userId : userId,
					popupFlg : "no"
				});
			},
			fnMoveAdminPage : function() {
				location.href = "/admin-main.do"
			},
			fnMoveBoardList : function(code){
				var self = this;
			$.pageChange("/boardList.do", {
				code : code});
		}

		},
		created : function() {
			var self = this;
			self.fnList();

		}
	});
</script>