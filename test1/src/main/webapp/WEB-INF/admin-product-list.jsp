<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>상품관리 페이지</title>


</head>
<style>
.container {
	width: 100%;
	margin: 0 auto;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.title {
	background-color: rgb(13, 110, 253);
	color: white;
	padding: 10px 20px;
	text-align: center;
}

.title h1 {
	margin: 0;
}

.description {
	margin: 10px 20px;
	text-align: center;
	color: #666;
}

.nav li {
	list-style: none;
	padding: 10px 20px;
	cursor: pointer;
	background-color: white;
}

.nav li:hover {
	background: #d4d4d4;
}

.product-grid {
	display: flex;
	flex-wrap: wrap;
	padding: 20px;
	justify-content: flex-start;
}

.product {
	background: #fff;
	margin: 10px;
	width: calc(25% - 22px);
	/* 4개의 상품이 한 줄에 들어가도록 계산 (20px은 마진, 2px은 보더 고려) */
	box-sizing: border-box; /* 패딩과 보더가 너비에 포함되도록 설정 */
	text-align: center;
}

.product img {
	max-width: 100%;
	height: auto;
}

.product p {
	margin: 10px 0 0;
	color: #333;
}

.price {
	color: #2a8f2a;
	font-weight: bold;
}

.filter {
	float: right;
	margin: 20px;
}
</style>
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
			<form @submit.prevent="handleFormSubmit"
				class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
				<div class="input-group">

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
									<a class="nav-link" href="#" @click="fnMoveProductList('gluten')">글루텐프리</a> <a
										class="nav-link" href="#" @click="fnMoveProductList('local')">로컬</a> <a
										class="nav-link" href="#" @click="fnMoveProductList('vegan')">비건</a> <a
										class="nav-link" href="#" @click="fnMoveProductList('org')">유기농</a>

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

						<div class="container">
							<div class="title">
								<h1>상품 리스트</h1>
							</div>

							<div class="description">
								<p>각 카테고리에 맞는 상품을 추가 혹은 삭제와 수정의 기능이 있습니다</p>
							</div>

							<ul class="nav">
								<li @click="fnList('All')" v-if="code == 'All'"
									style="background-color: #d4d4d4;">전체</li>
								<li @click="fnList('All')" v-if="code != 'All'">전체</li>
								<li @click="fnList('org')" v-if="code == 'org'"
									style="background-color: #d4d4d4;">유기농</li>
								<li @click="fnList('org')" v-if="code != 'org'">유기농</li>
								<li @click="fnList('vegan')" v-if="code == 'vegan'"
									style="background-color: #d4d4d4;">비건</li>
								<li @click="fnList('vegan')" v-if="code != 'vegan'">비건</li>
								<li @click="fnList('gluten')" v-if="code == 'gluten'"
									style="background-color: #d4d4d4;">글루텐프리</li>
								<li @click="fnList('gluten')" v-if="code != 'gluten'">글루텐프리</li>
								<li @click="fnList('local')" v-if="code == 'local'"
									style="background-color: #d4d4d4;">로컬푸드</li>
								<li @click="fnList('local')" v-if="code != 'local'">로컬푸드</li>
							</ul>
							<ul class="navselect">

							</ul>
							<div>
								<select v-model="code">
									<option value="All">전체</option>
									<option value="org">유기농</option>
									<option value="vegan">비건</option>
									<option value="gluten">글루텐프리</option>
									<option value="local">로컬푸드</option>
								</select> <input type="text" v-model="keyword" @keyup.enter="fnList(code)">
								<button @click="fnList(code)">검색</button>
								<button @click="fnMoveAddPage">상품추가</button>
							</div>




							<div class="product-grid">
								<div v-if="productlist.length==0">검색된 상품이 없습니다. 상품명을
									확인해주세요</div>
								<div class="product" v-for="item in productlist" style="border: 1px solid; box-sizing: border-box;">
									<template v-for="item2 in filelist"
										v-if="item.itemNo == item2.itemNo">
										<template id="item2.fileNo" @click="fnNext(item2.fileNo)">
											<img :src="item2.filePath+item2.fileName" alt=""
												style="width: 450px; height: 300px;">
										</template>
									</template>
									</template>
									<p style="border-bottom: 1px solid; box-sizing: border-box;">
										<a href="javascript:;" @click="fnMoveProductView(item.itemNo)" class="nav-link" >{{item.itemName}}</a>
									</p>
									<p class="price" v-if="item.sRate!=0">
										<del>₩{{item.price}}</del>
										<br>할인가₩{{(item.price)*((100-item.sRate)/100)}}<br>
										할인율{{item.sRate}}%
									</p>
									<p class="price" v-if="item.sRate == 0">₩{{item.price}}</p>
									<a @click="fnRemove(item.itemNo)" href="#">
									<i class="bi bi-trash-fill"></i>
									</a>
									<a @click="fnEdit(item.itemNo)" href="#">
									<i class="bi bi-pencil-square"></i>
									</a>
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
		data : {
			userId : "${userId}",
			productlist : [],
			keyword : "",
			code : "${map.code}",
			filelist : []

		},
		methods : {
			fnList : function(code) {
				var self = this;
				self.code = code;
				var nparmap = {
					keyword : self.keyword,
					code : self.code,
					kind : "1"

				};
				$.ajax({
					url : "AdminProductList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.productlist = data.list;
						self.filelist = data.filelist;

					}
				});
			},
			
			fnMoveBoardList : function(code){
				var self = this;
			$.pageChange("/boardList.do", {
				code : code});
		}, fnMoveProductView :function(itemNo){
        	var self = this;
        	$.pageChange("/productView.do", {itemNo : itemNo , userId : self.userId});
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
			
			/* 제품 삭제 실행 */
			fnRemove : function(itemNo) {
				var self = this;
				if (confirm("정말 삭제할까요?")) {
					var nparmap = {
						itemNo : itemNo
					};
					$.ajax({
						url : "productRemove.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							if (data.result == "success") {
								alert("삭제되었습니다!");
								self.fnList(self.code);
							} else {
								alert("삭제 실패 오류 발생!");
							}
						}
					});
				} else {
					return;
				}
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
			fnEdit : function(itemNo) {
				$.pageChange("/AdminProductUpdate.do", {
					itemNo : itemNo
				});
			},
			
			fnMoveProductList : function(code){
				$.pageChange("/AdminProductList.do", {
					code : code
				});
			},
			fnMoveAdminPage : function() {
				location.href = "/admin-main.do"
			},
			fnMoveAddPage : function() {
				var self = this;
				$.pageChange("/productAdd.do", {
					code : self.code
				});
			},
			fnDetailView : function(itemNo) {
				var self = this
				$.pageChange("/AdminProductView.do", {
					itemNo : itemNo
				});
			}
		},
		created : function() {
			var self = this;
			self.fnList("${map.code}");
		}
	});
</script>