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
    <title>메인화면</title>

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
</head>

<body id="HeaderAllTab">

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- item Begin -->
    <div class="item__menu__overlay"></div>
    <div class="item__menu__wrapper">
        <div class="item__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="item__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price"></div>
        </div>
        <div class="item__menu__widget">
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> 로그인</a>
            </div>
        </div>
        <nav class="item__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.jsp">Home</a></li>
                <li><a href="./shop-grid.jsp">쇼핑</a></li>
                <li><a href="#">메뉴</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">쇼핑 상세보기</a></li>
                        <li><a href="./shoping-cart.html">장바구니</a></li>
                        <li><a href="./checkout.html">주문하기/결제</a></li>
                        <li><a href="./blog-details.html">블로그 상세보기</a></li>
                    </ul>
                </li>
                <li><a href="./blog.jsp">레시피 게시판</a></li>
                <li><a href="./contact.jsp">연락처</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="item__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> thejoeun@naver.com</li>
            </ul>
        </div>
    </div>
    <!-- item End -->

    <!-- Header Section Begin -->
    <header class="header" id="HeaderAllTab">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> thejoeun@naver.com</li>
                                <li>1만원 부터 무료 배송</li>
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
                                <a href="#"><i class="fa fa-user"></i> 로그인</a>
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
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>1</span></a></li>
                        </ul>
                        <div class="header__cart__price"></span></div>
                    </div>
                </div>
            </div>
            <div class="item__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    
    <!-- Header Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    

</body>
</html>