<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles-admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="js/jquery.js"></script>



</head>

<body class="sb-nav-fixed">
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
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="유저 아이디로 검색..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
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
					<li><a class="dropdown-item" href="마이페이지로 이동할것">아이디 : {{userId}}</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="로그아웃 클릭이벤트 줄것">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="/admin-main.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 관리자 페이지
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
								<a class="nav-link" href="layout-static.html">글루텐프리</a> <a
									class="nav-link" href="layout-sidenav-light.html">로컬</a> <a
									class="nav-link" href="layout-sidenav-light.html">비건</a> <a
									class="nav-link" href="layout-sidenav-light.html">유기농</a>

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
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> 상품등록
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="#">글루텐프리</a> <a class="nav-link"
											href="">로컬</a> <a class="nav-link" href="#">비건</a> <a
											class="nav-link" href="#">유기농</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> 게시판 컨트롤
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="#">공지사항 등록</a> <a class="nav-link"
											href="#">문의글 관리</a> <a class="nav-link" href="#"></a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">차트분석</div>
						<a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 월 매출 차트
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">관리자 페이지</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">관리자 페이지</li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">상품관리</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">유저관리</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">문의관리</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">결제로그</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">View
										Details</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					
						<div class="row">
							<div class="col-xl-6" style="width: 100%;">
								<div class="card mb-4" style="width: 100%;">
									<div class="card-header">
										<i class="fas fa-chart-area me-1"></i> 월 매출 차트
									</div>
									<div id="chart">
										<apexchart type="bar" height="350" :options="chartOptions"
											:series="series"></apexchart>
									</div>

								</div>
							</div>
						</div>



						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> 가입 유저 리스트
							</div>
							<div class="card-body">
								<select v-model="selectNum" @click="fnPageList(1)">
									<option value="5">5개</option>
									<option value="10">10개</option>
									<option value="20">20개</option>
									<option value="30">30개</option>
								</select> <select v-model="keywordType">
									<option value="id">아이디</option>
									<option value="name">닉네임</option>
								</select> <input type="text" v-model="keyword" @keyup="fnUserList()">
								<table style="text-align: center;">
									<thead>
										<tr>
											<th width="10%">유저아이디</th>
											<th width="10%">유저이름</th>
											<th width="5%">생일</th>
											<th width="10%">성별</th>
											<th width="10%">이메일</th>
											<th width="10%">닉네임</th>
											<th width="15%">휴대폰 번호</th>
											<th width="10%">로그인 실패 횟수</th>
											<th width="10%">유저등급</th>
											<th width="10%">권한</th>
											<th width="0%">view</th>
										</tr>
									</thead>
									<tbody>
										<tr v-if="list.length ==0">
											<td colspan="11">검색결과 없음</td>
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
											<td><a href="javascript:;" @click="fnMoveUserDetail(item.userId)"><i class="fas fa-book-open"></i></a></td>
											
										</tr>
									</tbody>
								</table>
								<a href="javascript:;" @click="fnPageMove(1)">◀</a>
								<template v-for="n in pageCount">

									<a href="javascript:;" @click="fnPageList(n)"
										:class="selectPage == n ? 'select-tab' : 'tab'" v-if>
										({{n}}) </a>

								</template>
								<a href="javascript:;" @click="fnPageMove(2)"> ▶</a> <a
									href="javascript:;" @click="fnPageMove(3)"> ≥</a>
							</div>
						</div>
					</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	</div>
</body>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		components : {
			apexchart : VueApexCharts,
		},
		data : {

			series : [],
			chartOptions : {
				chart : {
					type : 'bar',
					height : 350
				},
				plotOptions : {
					bar : {
						horizontal : false,
						columnWidth : '55%',
						endingShape : 'rounded'
					},
				},
				dataLabels : {
					enabled : false
				},
				stroke : {
					show : true,
					width : 2,
					colors : [ 'transparent' ]
				},
				xaxis : {
					categories : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
				},
				yaxis : {
					title : {
						text : '(월 매출)'
					}
				},
				fill : {
					opacity : 1
				},
				tooltip : {
					y : {
						formatter : function(val) {

							return val.toLocaleString('ko-KR') + "원"
						}
					}
				}
			},
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
			userId : "${userId}"

		}

		,
		methods : {
			fnList : function() {
				var self = this;
				self.fnData();

			},

			fnData : function() {
				var self = this;
				var nparmap = {

				};
				$.ajax({
					url : "AdminProductChart.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {

						var localList = [];
						var veganList = [];
						var orgList = [];
						var glutenList = [];

						for (var i = 0; i < data.ProductList.length; i++) {
							if (data.ProductList[i].code == "local") {
								localList.push(data.ProductList[i].totalPay);
							}
							if (data.ProductList[i].code == "vegan") {
								veganList.push(data.ProductList[i].totalPay);
							}
							if (data.ProductList[i].code == "org") {
								orgList.push(data.ProductList[i].totalPay);
							}
							if (data.ProductList[i].code == "gluten") {
								glutenList.push(data.ProductList[i].totalPay);
							}
						}

						if (localList.length != 0) {
							self.series.push({
								name : "로컬푸드",
								data : localList
							});
						}

						if (veganList.length != 0) {
							self.series.push({
								name : "비건푸드",
								data : veganList
							});
						}

						if (orgList.length != 0) {
							self.series.push({
								name : "유기농푸드",
								data : orgList
							});
						}

						if (glutenList.length != 0) {
							self.series.push({
								name : "글루텐프리",
								data : glutenList
							});
						}

					}
				});
			},
			fnUserList : function() {
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
					userId : userId
				});
			},
			fnMoveAdminPage : function() {
				location.href = "/admin-main.do"
			}

		},
		created : function() {
			var self = this;
			self.fnList();
			self.fnUserList();

		}
	})
</script>
</html>
