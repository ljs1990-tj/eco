<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<title>관리자 페이지</title>
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
											<a class="nav-link" href="#"
												@click="handleAddProduct('gluten')">글루텐프리</a> <a
												class="nav-link" href="#" @click="handleAddProduct('local')">로컬</a>
											<a class="nav-link" href="#"
												@click="handleAddProduct('vegan')">비건</a> <a
												class="nav-link" href="#" @click="handleAddProduct('org')">유기농</a>
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
											<a class="nav-link" href="javascript:;"
												@click="fnMoveBoardList(1)">공지게시판 이동</a> <a class="nav-link"
												href="javascript:;" @click="fnMoveBoardList(2)">레시피게시판
												이동</a>


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
			userId : "${userId}",
			keywordId : "",
			userType : "${userType}"
		}

		,
		methods : {
			fnLogout : function() {
				var self = this;
				if (confirm("정말로 로그아웃하나요?")) {
					self.logFlg = false;
					location.href = "/user-login.do";
				} else {
					return;
				}
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
			fnList : function() {
				var self = this;
				if (self.userType != "A") {
					alert("관리자만 접근 가능한 페이지입니다.");
					location.href = "main.do";
				}
				self.fnData();

			},
			fnMoveProductList : function(code) {

				var self = this;
				$.pageChange("/AdminProductList.do", {
					code : code
				});
			},

			fnMoveBoardList : function(code) {
				var self = this;
				$.pageChange("/boardList.do", {
					code : code
				});
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
			handleAddProduct : function(code) {
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

			fnMoveAdminPage : function() {
				location.href = "/admin-main.do"
			}

		},
		created : function() {
			var self = this;
			self.fnList();

		}
	})
</script>
<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</html>
