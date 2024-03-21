<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>메인 페이지</title>
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
	                                    전체 검색
	                                    <span class="arrow_carrot-right"></span>
	                                </div>
	                                <input type="text" placeholder="검색할 상품명을 입력해 주세요" v-model="keyword" @keyup.enter="fnSearchList('')">
	                                <button type="submit" class="site-btn" @click="fnSearchList('')">검색</button>
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
	                            <p>1만 원부터 무료배송</p>
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
	                        <div class="categories__item set-bg" data-setbg="img/categories/cat-1.jpg" style="cursor: pointer;" @click="fnMoveCategory('org')">
	                            <h5><a href="javascript:;" @click="fnMoveCategory('org')" style="opacity: 0.9">유기농</a></h5>
	                        </div>
	                    </div>
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg" style="cursor: pointer;" @click="fnMoveCategory('vegan')">
	                            <h5><a href="javascript:;" @click="fnMoveCategory('vegan')" style="opacity: 0.9">비건</a></h5>
	                        </div>
	                    </div>
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg" style="cursor: pointer;" @click="fnMoveCategory('gluten')">
	                            <h5><a href="javascript:;" @click="fnMoveCategory('gluten')" style="opacity: 0.9">글루텐-프리</a></h5>
	                        </div>
	                    </div>
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg" style="cursor: pointer;" @click="fnMoveCategory('local')">
	                            <h5><a href="javascript:;" @click="fnMoveCategory('local')" style="opacity: 0.9">로컬푸드</a></h5>
	                        </div>
	                    </div>
 	                  <div class="col-lg-3">
	                        <div class="categories__item set-bg" data-setbg="img/categories/cat-5.jpg" style="cursor: pointer;" @click="fnMoveCategory('')">
	                            <h5><a href="javascript:;" @click="fnMoveCategory('')" style="opacity: 0.9">모두</a></h5>
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
	                            <li data-filter=".org">유기농</li>
	                            <li data-filter=".vegan">비건</li>
	                            <li data-filter=".gluten">글루텐프리</li>
	                            <li data-filter=".local">로컬푸드</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <div class="row featured__filter">
    		        <template v-for="(item, index) in list" v-if="index < 8">
		            	<template v-for="item2 in fileList" v-if="item.itemNo == item2.itemNo">
			                <div :class="'col-lg-3 col-md-4 col-sm-6 mix ' + item.code">
			                    <div class="featured__item">
			                    	<div class="featured__item__pic">
			                    		<img :data-setbg="item2.path" :alt="item.itemName" :src="item2.path" @click="fnDetailView(item.itemNo, userId)" style="cursor: pointer;">
			                        	<ul class="featured__item__pic__hover">
			                                <li><a href="javascript:;" @click="fnAddFavorite(item.itemNo, userId)"><i class="fa fa-heart"></i></a></li>
			                                <li><a href="javascript:;" @click="fnAddCart(item.itemNo, userId)"><i class="fa fa-shopping-cart"></i></a></li>
			                            </ul>
		                        	</div>
			                        <div class="featured__item__text">
			                            <h4><a href="javascript:;" @click="fnDetailView(item.itemNo, userId)" style="color: black; font-weight: bold;">{{item.itemName}}</a></h4>
			                            <del>₩{{item.price}}</del>
			                            <h4 style="color: red;">₩{{(item.price)*((100-item.sRate)/100)}}</h4>
			                        </div>
			                    </div>
			                </div>
		            	</template>
		            </template>
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
	                        <h4>최근 등록</h4>
	                        <div class="latest-product__slider owl-carousel">
	                        	<template v-for="(item, index) in listLatest">
	                        		<template v-for="item2 in fileList" v-if="item.itemNo == item2.itemNo">
			                            <div class="latest-prdouct__slider__item" v-if="index < 3">
			                                <a href="javascript:;" class="latest-product__item" @click="fnDetailView(item.itemNo, userId)">
			                                    <div class="latest-product__item__pic">
			                                        <img :alt="item.itemName" :src="item2.path">
			                                    </div>
			                                    <div class="latest-product__item__text">
			                                        <h6>{{item.itemName}}</h6>
			                                        <del style="color: #aaa;">₩{{item.price}}</del>
			                                        <span>₩{{(item.price)*((100-item.sRate)/100)}}</span>
			                                    </div>
			                                </a>
			                            </div>
		                            </template>
	                            </template>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-6">
	                    <div class="latest-product__text">
	                        <h4>최다 판매</h4>
	                        <div class="latest-product__slider owl-carousel">
	                        	<template v-for="(item, index) in listMax">
	                        		<template v-for="item2 in fileList" v-if="item.itemNo == item2.itemNo">
			                            <div class="latest-prdouct__slider__item" v-if="index < 3">
			                                <a href="javascript:;" class="latest-product__item" @click="fnDetailView(item.itemNo, userId)">
			                                    <div class="latest-product__item__pic">
			                                        <img :alt="item.itemName" :src="item2.path">
			                                    </div>
			                                    <div class="latest-product__item__text">
			                                        <h6>{{item.itemName}}</h6>
			                                        <del style="color: #aaa;">₩{{item.price}}</del>
			                                        <span>₩{{(item.price)*((100-item.sRate)/100)}}</span>
			                                    </div>
			                                </a>
			                            </div>
		                            </template>
	                            </template>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-6">
	                    <div class="latest-product__text">
	                        <h4>최다 리뷰</h4>
	                        <div class="latest-product__slider owl-carousel">
	                        	<template v-for="(item, index) in listMost">
	                        		<template v-for="item2 in fileList" v-if="item.itemNo == item2.itemNo">
			                            <div class="latest-prdouct__slider__item" v-if="index < 3">
			                                <a href="javascript:;" class="latest-product__item" @click="fnDetailView(item.itemNo, userId)">
			                                    <div class="latest-product__item__pic">
			                                        <img :alt="item.itemName" :src="item2.path">
			                                    </div>
			                                    <div class="latest-product__item__text">
			                                        <h6>{{item.itemName}}</h6>
			                                        <del style="color: #aaa;">₩{{item.price}}</del>
			                                        <span>₩{{(item.price)*((100-item.sRate)/100)}}</span>
			                                    </div>
			                                </a>
			                            </div>
		                            </template>
	                            </template>
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
	                        <h2>인기 레시피</h2>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	            	<template v-for="(item, index) in listR">
	            		<template v-for="item2 in fileListR" v-if="item.boardNo == item2.boardNo">
			                <div class="col-lg-4 col-md-4 col-sm-6">
			                    <div class="blog__item">
			                        <div class="blog__item__pic">
			                            <img :src="item2.path" alt="image" @click="fnView(item.boardNo, 2)" style="cursor: pointer; max-width: 200px; height: 300px;">
			                        </div>
			                        <div class="blog__item__text">
			                            <ul>
			                                <li><i class="fa fa-calendar-o"></i> {{item.cDate}}</li>
			                                <li><i class="fa fa-eye"></i> {{item.hits}}</li>
			                            </ul>
			                            <h5><a href="javascript:;" @click="fnView(item.boardNo, 2)">{{truncateText(item.title, 10)}}</a></h5>
			                            <p><span v-html="truncateText(item.contents, 50)"></span></p>
			                        </div>
			                    </div>
			                </div>
	            		</template>
	            	</template>
	            </div>
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
	<script src="js/jquery.slicknav.js"></script> 
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script> 
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>  

</body>
</html>
<script type="text/javascript">
  	var app = new Vue({
		el: '#appMain',
		data: {
			userId: "${userId}",
			isPopupOpen: true,
			list: [],
			fileList: [],
	    	listLatest: [],
	    	listMax: [],
	    	listMost: [],
	    	listR: [], 		// 레시피용
	    	fileListR: [], 	// 레시피용
	    	keyword: "",
	    	kind: 1
		},
		methods: {
			fnListOrderBy: function() {
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url: "productListOrderBy.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function(data) {
						console.log(data);
						self.list = data.listMain;
	                	self.listLatest = data.listLatest; // 최근 등록순
	                	self.listMax = data.listMax; // 최다 판매순
	                	self.listMost = data.listMost; // 최다 리뷰순
	                	self.fileList = data.fileList; 
					}
				});
			},
			fnListRecipe: function() {
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url: "boardAndFileList.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function(data) {
						if(data.result == 'success') {
							self.listR = data.listR;
							self.fileListR = data.fileListR;
						}
					}
				});				
			},
			closePopup: function() {
				this.isPopupOpen = false;
			},
			fnMoveCategory: function(kind) {
				$.pageChange("/productList.do", {code: kind});
			},
			fnAddCart: function(itemNo, userId) {
	            var self = this;
	            if(self.userId == "") {
	            	alert("로그인 후 이용 가능합니다.");
	            	location.href = "/user-login.do";
	            } else {
		            var nparmap = {
						itemNo: itemNo,
						userId: userId
		            };
		            $.ajax({
		                url:"addCart.dox",
		                dataType:"json",
		                type: "POST",
		                data: nparmap,
		                success: function(data) {
		                	if(data.result == "success") {
		                		alert("장바구니에 담았습니다.");
		                		appHeader.fnLogin();
		                	} else {
		                		alert("예기치 못한 오류가 발생했습니다. 다시 시도해 주세요.");
		                	}
		                }
		            });
	            }
			},
			fnAddFavorite: function(itemNo, userId) {
		    	var self = this;
		    	if(self.userId == ""){
		    		alert("로그인 후 이용 가능합니다.");
		    		location.href = "/user-login.do";
		    	}
	            var nparmap = {
	            		itemNo: itemNo,
	            		userId: userId
	            };
	            $.ajax({
	                url:"FavoriteAdd.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success: function(data) {
	                	console.log(data);
	                	if(data.result == "insert") {
	                		alert("찜 목록에 담았습니다.");
	                		appHeader.fnLogin();
	                	} else if(data.result == "remove") {
	                		alert("찜 목록에서 뺐습니다.");
	                		appHeader.fnLogin();
	                	} else {
	                		alert("예기치 못한 오류가 발생했습니다. 다시 시도해 주세요.");
	                	}
	                }
	            });
			},
	        fnDetailView: function(itemNo, userId) {
				var self = this;
				$.pageChange("/productView.do", {itemNo: itemNo, userId: self.userId});
			},
			fnView: function(boardNo, kind) {
                var self = this;
                if (self.userId != "") {
                    $.pageChange("/boardView.do", {boardNo: boardNo, kind: kind});
                } else {
                    alert("로그인 후 확인 가능합니다.");
                    return;
                }
            },
            truncateText(text, maxLength) {
                if (text.length > maxLength) {
                    return text.slice(0, maxLength) + '...';
                } else {
                    return text;
                }
            },
            fnSearchList: function(code) {
            	var self = this;
            	$.pageChange("/productList.do", {keyword: self.keyword, code: code});
            },
		},
		created: function() {
			var self = this;
			self.fnListOrderBy();
			self.fnListRecipe();
		}
	}); 
</script>
<%@ include file="layout/footer.jsp" %>
