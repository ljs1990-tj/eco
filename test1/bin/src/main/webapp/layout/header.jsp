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
                                <li><i class="fa fa-envelope"></i> thejoeun@naver.com</li>
                                <li>1만 원부터 무료 배송</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                          
                            <div class="header__top__right__auth">
                                <a v-if="!loginFlg" href="/user-login.do"><i class="fa fa-user"></i> 로그인</a>
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
                        <a href="./main.jsp"><img src="img/logo.png" alt="logo"></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.jsp">Home</a></li>
                            <li><a href="#">카테고리</a>
                              <ul class="header__menu__dropdown">
                                  <li><a href="#">유기농</a></li>
                                  <li><a href="#">비건</a></li>
                                  <li><a href="#">글루텐-프리</a></li>
                                  <li><a href="#">로컬푸드</a></li>
                              </ul>
                          </li>
                            <li><a href="./shop-grid.jsp">1:1 매칭</a></li>
                            
                            <li><a href="#">식단관리</a></li>
                            <li><a href="#">커뮤니티</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>0</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>0</span></a></li>
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
<script type="text/javascript">
	var app = new Vue({
	    el: '#appHeader',
	    data: {
	    	sessionId: "${userId}",
	    	loginFlg: false
	    }
	    , methods: {
	    	fnList: function() {
	            var self = this;
	            var nparmap = {};
	            $.ajax({
	                url:"test.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success: function(data) {
	                }
	            });
	        },
	        fnIsLogin: function() {
	        	var self = this;
	        	if(!self.sessionId || self.sessionId == undefined) {
	        		loginFlg = false;
	        	} else {
	        		loginFlg = true;
	        	}
	        },
	        fnLogout: function() {
	        	var self = this;
	        	if(confirm("정말로 로그아웃하나요?")) {
	        		location.href = "/user-login.do";
	        	} else {
	        		return;
	        	}
	        }
	    }
	    , created: function() {
	    	var self = this;
	    	self.fnIsLogin();
		}
	});
</script>
</html>