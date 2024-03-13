<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>헤더</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap-min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome-min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui-min.css" type="text/css">
    <link rel="stylesheet" href="css/owl-carousel-min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav-min.css" type="text/css">
    <link rel="stylesheet" href="css/style2.css" type="text/css">
    
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    
</head>

<body id="HeaderAllTab">
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Header Section Begin -->
    <div id="appHeader">
	    <header class="header" id="HeaderAllTab">
	        <div class="header__top">
	            <div class="container">
	                <div class="row">
	                    <div class="col-lg-6 col-md-6">
	                        <div class="header__top__left">
	                            <ul>
	                                <li><i class="fa fa-envelope"></i> {{email}}<!-- thejoeun@naver.com --></li>
	                                <li>1만 원부터 무료 배송</li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="col-lg-6 col-md-6">
	                        <div class="header__top__right">
	                            <div class="header__top__right__social">
	                                <a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
	                                <a href="https://twitter.com/"><i class="fa fa-twitter"></i></a>
	                                <a href="https://www.linkedin.com/"><i class="fa fa-linkedin"></i></a>
	                                <a href="https://www.pinterest.co.kr/"><i class="fa fa-pinterest-p"></i></a>
	                            </div>
	                          
	                            <div class="header__top__right__auth">
	                                <a v-if="!loginFlg" href="javascript:;" @click="fnLogin"><i class="fa fa-user"></i> 로그인</a>
	                                <a v-else href="javascript:;" @click="fnLogout"><i class="fa fa-user"></i> 로그아웃</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-3">
	                    <div class="header__logo">
	                        <a href="javascript:;" @click="fnUserPage"><img src="img/logo.png" alt="logo"> MyPage</a>
	                    </div>
	                </div>
	                <div class="col-lg-6">
	                    <nav class="header__menu">
	                        <ul>
	                        	<li class="active"><a href="/main.do">Home</a></li>
	                            <li>카테고리
	                              <ul class="header__menu__dropdown">
	                                  <li><a href="javascript:;">유기농</a></li>
	                                  <li><a href="javascript:;">비건</a></li>
	                                  <li><a href="javascript:;">글루텐-프리</a></li>
	                                  <li><a href="javascript:;">로컬푸드</a></li>
	                              </ul>
	                          	</li>
	                            <li><a href="javascript:;">1:1 매칭</a></li>
	                            
	                            <li><a href="javascript:;">식단관리</a></li>
	                            <li><a href="/boardList.do">커뮤니티</a></li>
	                        </ul>
	                    </nav>
	                </div>
	                <div class="col-lg-3">
	                    <div class="header__cart">
	                        <ul>
	                            <li><a href="javascript:;" @click="fnFavorite"><i class="fa fa-heart"></i> <span>0</span></a></li>
	                            <li><a href="javascript:;" @click="fnMoveCart"><i class="fa fa-shopping-bag"></i> <span>0</span></a></li>
	                        </ul>
	                        <div class="header__cart__price"></div>
	                    </div>
	                </div>
	            </div>
	            <div class="item__open">
	                <i class="fa fa-bars"></i>
	            </div>
	        </div>
	    </header>
    </div>
    <!-- Header Section End -->
    
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
	    el: '#appHeader',
	    data: {
	    	userId: "${userId}",
	    	email: "",
	    	loginFlg: false
	    }
	    , methods: {
	    	fnList: function() {
	            var self = this;
	            var nparmap = {userId: self.userId};
	            $.ajax({
	                url:"check.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success: function(data) {
	                	
	                }
	            });
	        },
	        fnLogin: function() {
	        	var self = this;
	        	if(self.userId == "") {
	        		self.logFlg = false;
	        	} else {
	        		self.loginFlg = true;
	        		var nparmap = {userId: self.userId};
	        		$.ajax({
		                url:"check.dox",
		                dataType:"json",
		                type: "POST",
		                data: nparmap,
		                success: function(data) {
		                	if(data.result == 'fail') {
		                		self.email = data.user.email;
		                	}
		                }
		            });
	        	}
	        },
	        fnLogout: function() {
	        	var self = this;
	        	if(confirm("정말로 로그아웃하나요?")) {
	        		self.logFlg = false;
	        		location.href = "/user-login.do";
	        	} else {
	        		return;
	        	}
	        },
	        fnFavorite: function() {
	        	var self = this;
	        	if(self.userId != "") {
	        		//
	        	} else {
					alert("로그인 후 입장 가능합니다.");
	        	}
	        	
	        },
	        fnMoveCart: function() {
	        	var self = this;
	        	if(self.userId != "") {
		        	$.pageChange("/cart/list.do", {userId: self.userId});
	        	} else {
					alert("로그인 후 입장 가능합니다.");
	        	}
	        },
			/* 마이페이지 이동 */
			fnUserPage : function() {
				var self = this;
				if(self.userId != ""){
					$.pageChange("/user-myPage.do", {userId : self.userId});
				} else {
					alert("로그인 후 입장 가능합니다.");
				}
			}
	    }
	    , created: function() {
	    	var self = this;
	    	self.fnLogin();
		}
	});
</script>