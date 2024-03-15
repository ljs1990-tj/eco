<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
<!-- Header Section -->
<%@ include file="layout/header.jsp" %>
	<div id="appMain">
	    <!-- Hero Section Begin -->
	    <section class="hero" id="HeaderAllTab">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-3">
	                    <div class="hero__categories">
	                        <div class="hero__categories__all">
	                            <i class="fa fa-bars"></i>
	                            <span>카테고리</span>
	                        </div>
	                        <ul>
	                            <li><a href="javascript:;" @click="fnMoveCategory('org')">유기농</a></li>
	                            <li><a href="javascript:;" @click="fnMoveCategory('vegan')">비건</a></li>
	                            <li><a href="javascript:;" @click="fnMoveCategory('gluten')">글루텐프리</a></li>
	                            <li><a href="javascript:;" @click="fnMoveCategory('local')">로컬푸드</a></li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="col-lg-9">
	                    <div class="hero__search">
	                        <div class="hero__search__form">
	                            <form action="javascript:;">
	                                <div class="hero__search__categories">
	                                    카테고리
	                                    <span class="arrow_carrot-down"></span>
	                                </div>
	                                <input type="text" placeholder="검색할 제품 입력하세요">
	                                <button type="submit" class="site-btn">검색</button>
	                            </form>
	                        </div>
	                        <div class="hero__search__phone">
	                            <div class="hero__search__phone__icon">
	                                <i class="fa fa-phone"></i>
	                            </div>
	                            <div class="hero__search__phone__text">
	                                <h5>+1111-0000</h5>
	                                <span>고객센터</span>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
	                        <div class="hero__text">
	                            <span>FRUIT FRESH</span>
	                            <h2>Vegetable <br />100% Organic</h2>
	                            <p>무료배송</p>
	                            <a href="/productList.do" class="primary-btn">구매하기</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- Hero Section End -->
	
	    <!-- Categories Section Begin -->
	    <section class="categories">
	        <div class="container">
	            <div class="row">
	                <div class="categories__slider owl-carousel">
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="img/categories/cat-1.jpg">
	                            <h5><a href="javascript:;">유기농</a></h5>
	                        </div>
	                    </div>
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg">
	                            <h5><a href="javascript:;">비건</a></h5>
	                        </div>
	                    </div>
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg">
	                            <h5><a href="javascript:;">글루텐-프리</a></h5>
	                        </div>
	                    </div>
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg">
	                            <h5><a href="javascript:;">로컬푸드</a></h5>
	                        </div>
	                    </div>
 	                  <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="img/categories/cat-5.jpg">
	                            <h5><a href="javascript:;">신선한 과일주스</a></h5>
	                        </div>
	                    </div> 
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- Categories Section End -->
	
	    <!-- Featured Section Begin -->
	    <section class="featured spad">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="section-title">
	                        <h2>이달의 제품</h2>
	                    </div>
	                    <div class="featured__controls">
	                        <ul>
	                            <li class="active" data-filter="*">모두</li>
	                            <li data-filter=".oranges">유기농</li>
	                            <li data-filter=".fresh-meat">비건</li>
	                            <li data-filter=".vegetables">글루텐프리</li>
	                            <li data-filter=".fastfood">로컬푸드</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <div class="row featured__filter">
	                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-1.jpg">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="javascript:;"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="javascript:;">제품이름</a></h6>
	                            <h5>₩30.00</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="javascript:;"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="javascript:;">제품이름</a></h6>
	                            <h5>₩30.00</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-3.jpg">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="javascript:;"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="javascript:;">제품이름</a></h6>
	                            <h5>₩30.00</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-4.jpg">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="javascript:;"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="javascript:;">제품이름</a></h6>
	                            <h5>₩30.00</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="javascript:;"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="javascript:;">제품이름</a></h6>
	                            <h5>₩30.00</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="javascript:;"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="javascript:;">제품이름</a></h6>
	                            <h5>₩30.00</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-7.jpg">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="javascript:;"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="javascript:;">제품이름</a></h6>
	                            <h5>₩30.00</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
	                    <div class="featured__item">
	                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-8.jpg">
	                            <ul class="featured__item__pic__hover">
	                                <li><a href="javascript:;"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="javascript:;"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6><a href="javascript:;">제품이름</a></h6>
	                            <h5>₩30.00</h5>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- Featured Section End -->
	
	    <!-- Banner Begin -->
	    <div class="banner">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-6 col-md-6 col-sm-6">
	                    <div class="banner__pic">
	                        <img src="img/banner/banner-1.jpg" alt="">
	                    </div>
	                </div>
	                <div class="col-lg-6 col-md-6 col-sm-6">
	                    <div class="banner__pic">
	                        <img src="img/banner/banner-2.jpg" alt="">
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- Banner End -->
	
	    <!-- Latest Product Section Begin -->
	    <section class="latest-product spad">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-4 col-md-6">
	                    <div class="latest-product__text">
	                        <h4>최신 제품</h4>
	                        <div class="latest-product__slider owl-carousel">
	                            <div class="latest-prdouct__slider__item">
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-1.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-2.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-3.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                            </div>
	                            <div class="latest-prdouct__slider__item">
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-1.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-2.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-3.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-6">
	                    <div class="latest-product__text">
	                        <h4>전체 랭킹</h4>
	                        <div class="latest-product__slider owl-carousel">
	                            <div class="latest-prdouct__slider__item">
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-1.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-2.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-3.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                            </div>
	                            <div class="latest-prdouct__slider__item">
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-1.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-2.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-3.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-6">
	                    <div class="latest-product__text">
	                        <h4>리뷰 제품</h4>
	                        <div class="latest-product__slider owl-carousel">
	                            <div class="latest-prdouct__slider__item">
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-1.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-2.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-3.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                            </div>
	                            <div class="latest-prdouct__slider__item">
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-1.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-2.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                                <a href="javascript:;" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="img/latest-product/lp-3.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>제품이름</h6>
	                                        <span>₩30.00</span>
	                                    </div>
	                                </a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- Latest Product Section End -->
	
	    <!-- Blog Section Begin -->
	    <section class="from-blog spad">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="section-title from-blog__title">
	                        <h2>레시피 게시판</h2>
	                        
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-lg-4 col-md-4 col-sm-6">
	                    <div class="blog__item">
	                        <div class="blog__item__pic">
	                            <img src="img/blog/blog-1.jpg" alt="">
	                        </div>
	                        <div class="blog__item__text">
	                            <ul>
	                                <li><i class="fa fa-calendar-o"></i> 2024년 1월 2일</li>
	                                <li><i class="fa fa-comment-o"></i> 4</li>
	                            </ul>
	                            <h5><a href="javascript:;">쉽게 유리하는 팁 공유</a></h5>
	                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-4 col-sm-6">
	                    <div class="blog__item">
	                        <div class="blog__item__pic">
	                            <img src="img/blog/blog-2.jpg" alt="">
	                        </div>
	                        <div class="blog__item__text">
	                            <ul>
	                                <li><i class="fa fa-calendar-o"></i> 2024년 1월 2일</li>
	                                <li><i class="fa fa-comment-o"></i> 5</li>
	                            </ul>
	                            <h5><a href="javascript:;">30분 안에 아침 만들기 도전</a></h5>
	                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-4 col-sm-6">
	                    <div class="blog__item">
	                        <div class="blog__item__pic">
	                            <img src="img/blog/blog-3.jpg" alt="">
	                        </div>
	                        <div class="blog__item__text">
	                            <ul>
	                                <li><i class="fa fa-calendar-o"></i> 2024년 1월 2일</li>
	                                <li><i class="fa fa-comment-o"></i> 5</li>
	                            </ul>
	                            <h5><a href="javascript:;">농장 방문 vlog</a></h5>
	                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <h5><a href="javascript:;">더보기</a></h5>
	        </div>
	    </section>
	</div>
	    <!-- Blog Section End -->
	
<!-- Footer Section -->

	    	
	<!-- 팝업 창 -->
<!-- 		<div v-if="isPopupOpen" class="popup">
			<div class="popup-content">
				<p style="color: black;">팝업 내용을 여기에 추가하세요.</p>
				<button @click="closePopup">닫기</button>
			</div>
 		</div>  -->
 		
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

</body>
</html>
<script type="text/javascript">
  	var app = new Vue({
		el : '#appMain',
		data : {
			userId : "${userId}",
			test : "test"
			
		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {
					
				};
				$.ajax({
					url : "main.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						
					}
				});
			},
			closePopup : function() {
				this.isPopupOpen = false;
			},
			fnMoveCategory: function(kind) {
				$.pageChange("/productList.do", {code: kind});
			}
		},
		created : function() {
			var self = this;
		}
	}); 
</script>
<%@ include file="layout/footer.jsp" %>
