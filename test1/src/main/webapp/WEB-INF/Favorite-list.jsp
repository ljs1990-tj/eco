<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>장바구니 목록</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap-min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome-min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui-min.css" type="text/css">
    <link rel="stylesheet" href="../css/owl-carousel-min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav-min.css" type="text/css">
    <link rel="stylesheet" href="../css/style2.css" type="text/css">
</head>
<body>
<div id="app">
	 <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2> 찜 목록</h2>
                        <div class="breadcrumb__option">
                            <a href="javascript:;" @click="fnHome">Home</a>
                            <span>찜목록</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">제품</th>
                                    <th>가격</th>
                                    <th>적립금</th>
                                    <th>총 금액</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in list">
                                    <td class="shoping__cart__item">
                                        <img :src="item.filePath + item.fileName" alt="" style="width: 150px; height: 150px;">
                                        <a href="#" @click="fnMoveProductView(item.itemNo)">{{item.itemName}}</a>
                                        <h5></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        {{item.price.toLocaleString('ko-KR')}}원
                                    </td>
                                    <td class="shoping__cart__price">
                                    <p style="background-color: red; border-radius: 5px; color:white; width: 80px; height: 20px; padding: 0px; font-size: 15px; display: inline-block; margin-bottom: 0;">{{item.pRate}}%적립</p>
                                       {{(item.price*item.pRate/100).toLocaleString('ko-KR')}}Point
                                    </td>
                                      
                                    <td class="shoping__cart__total">
                                    <template v-if="item.sRate == 0">
                                    {{(item.price*item.selectcnt).toLocaleString('ko-KR')}}원
                                    </template>
                                    <template v-if="item.sRate > 0">
                                    <p style="background-color: red; border-radius: 5px; color:white; width: 80px; height: 20px; padding: 0px; font-size: 15px; display: inline-block; margin-bottom: 0;">{{item.sRate}}%할인</p>
                                       <del>{{(item.price*item.selectcnt).toLocaleString('ko-KR')}}원</del>  {{(item.price*(100-item.sRate)/100*item.selectcnt).toLocaleString('ko-KR')}}원
                                    </template>
                                    
                                        
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close" @click="fnDelete(item.cartNo)"></span>
                                    </td>
                                </tr>
                                
                              
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="productList.do"  class="primary-btn cart-btn">쇼핑계속하기</a>
                        <a href="javascript:;" @click="fnCartList"  class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                           찜목록 새로고침</a>
                    </div>
                </div>
               
               
               
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
    
	
	
</div>
	<!-- Js Plugins -->
    
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.slicknav.js"></script>
    <script src="../js/mixitup.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/main.js"></script>
</body>
</html>

<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	userId : "${map.userId}",
    	user: {},
        list : [],
        totalPay : 0,
        ratePrice : 0,
        noRatePrice : 0,
        selectcnt : "",
        Point :0
    },
    methods: {
        fnCartList: function() {
            var self = this;
            var nparmap = {
            		userId : self.userId,
            		kind : 1,
            		cartCheck : 0
            		
            };
            $.ajax({
                url:"/cart/list.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data);
                	self.list = data.list;
                	self.user = data.user;
                	self.totalPrice();
                	
                }
            });
        },
        fnMoveProductView :function(itemNo){
        	var self = this;
        	$.pageChange("/productView.do", {itemNo : itemNo , userId : self.userId});
        },
        fnDelete :function(cartNo){
        	var self = this;
            var nparmap = {
            		cartNo : cartNo
            };
            $.ajax({
                url:"/cart/remove.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data);
                	self.fnCartList();
                }
            });
        },
        fnProductList: function() {
        	$.pageChange("/productList.do", {userId : this.userId});
        	},
        fnHome: function() {
        	location.href="main.do";
        	},
        fnKakaoPay: function() {
    	    location.href="KakaoPay.do";
    		},
    		totalPrice : function(){
    			var self = this
    			var noRatePay = 0;
    			for(var i = 0 ; i <self.list.length ; i++){
    				noRatePay += self.list[i].price * self.list[i].selectcnt;
    			}
    			self.noRatePrice = noRatePay.toLocaleString('ko-KR');
    			var pay = 0;
    			for(var i = 0 ; i <self.list.length ; i++){
    			 pay += self.list[i].price * self.list[i].selectcnt * (100-self.list[i].sRate)/100;
    			}
    			self.totalPay = pay.toLocaleString('ko-KR');
    			var rate = 0;
    			for(var i = 0 ; i <self.list.length ; i++){
    				rate += self.list[i].price*self.list[i].selectcnt*(self.list[i].sRate/100);
    			}
    			self.ratePrice = rate.toLocaleString('ko-KR');
    			
    			var point =0;
    			for(var i = 0 ; i <self.list.length ; i++){
    				point += self.list[i].price * self.list[i].selectcnt *(self.list[i].pRate/100);
    			}
    			self.Point = point.toLocaleString('ko-KR');;
    		},
            
    		
	   	
	    },
    created: function() {
        this.fnCartList(); 
        
        
    }
});
</script>
