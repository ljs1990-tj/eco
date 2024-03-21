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
                        <h2> 장바구니</h2>
                        <div class="breadcrumb__option">
                            <a href="javascript:;" @click="fnHome">Home</a>
                            <span>장바구니</span>
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
                                    <th>수량</th>
                                    <th>총 금액</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in list">
                                    <td class="shoping__cart__item" >
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
                                    
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                       				
                                            <div class="pro-qty-me" v-if="item.cnt != 0">
                                            <span class="dec qtybtn" style="cursor: pointer;" @click="ChangSelectCnt(index,item.cartNo,list[index].selectcnt-1)"> - </span>
                                               <input type="text" v-model="list[index].selectcnt" @keyup="ChangSelectCnt(index,item.cartNo, list[index].selectcnt)">
                                             <span class="inc qtybtn" style="cursor: pointer;" @click="ChangSelectCnt(index,item.cartNo, list[index].selectcnt+1)"> + </span>
                                            </div>
                                            <div class="pro-qty-me" v-if="item.cnt == 0">
                                            	<span>품절</span>
                                            </div>
                                            
                                            
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                    <p style="background-color: red; border-radius: 5px; color:white; width: 80px; height: 20px; padding: 0px; font-size: 15px; display: inline-block; margin-bottom: 0;">{{item.sRate}}%할인</p>
                                       <del>{{(item.price*item.selectcnt).toLocaleString('ko-KR')}}원</del>  {{(item.price*(100-item.sRate)/100*item.selectcnt).toLocaleString('ko-KR')}}원
                                        
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
                           장바구니 새로고침</a>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="shoping__checkout">
                        <h5>주문자 정보</h5>
                        <ul>
                            <li>이름<span>{{user.name}}</span></li>
                            <li>핸드폰 번호 : <span>{{user.phone1}}-{{user.phone2}}-{{user.phone3}}</span></li>
                            <li>이메일 : <span>{{user.email}}</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6" v-if="list.length != 0">
                    <div class="shoping__checkout">
                        <h5 >총 금액</h5>
                        <ul>
                            <li >금액 <span>{{noRatePrice}}원</span></li>
                            <li >할인된 금액 <span> {{ratePrice}}원</span></li>
                            <li >적립된 포인트 <span>{{Point}}Point</span></li>
                            <li >총 금액 <span >{{totalPay}}원</span></li>
                        </ul>
                        <a href="javascript:;" @click="fnKakaoPay" class="primary-btn" >계속해서 진행하기</a>
                        
                    </div>
                </div>
                 <div class="col-lg-6" v-if="list.length == 0">
                    <div class="shoping__checkout">
                        <h5 >총 금액</h5>
                        <ul>
                        	<li>	
                        	<span>장바구니에 아무런 상품도 담겨있지 않아요!</span>	
                        	</li>
                        </ul>
                        
                        
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
    	payKind : "${map.kind}",
    	itemNo : "${map.itemNo}",
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
            		cartCheck : 1,
            		payKind : self.payKind,
            		itemNo : self.itemNo
            		
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
        fnMoveProductView :function(itemNo){
        	var self = this;
        	$.pageChange("/productView.do", {itemNo : itemNo , userId : self.userId});
        },
        fnProductList: function() {
        	var self = this;
        	$.pageChange("/productList.do", {userId : self.userId});
        	},
        fnHome: function() {
        	location.href="main.do";
        	},
        fnKakaoPay: function() {
        	var self = this;
        	for(var i = 0 ; i < self.list.length ; i++){
        		if(self.list[i].cnt == 0){
        			alert("품절된 상품을 제거한뒤 진행해주세요");
        			return;
        		}
        	}
        	
    	    location.href="KakaoPay.do";
    		},
    		totalPrice : function(){
    			var self = this
    			var noRatePay = 0;
    			for(var i = 0 ; i <self.list.length ; i++){
    				if(self.list[i].cnt == 0){
    					self.list[i].selectcnt = 0;
    				}
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
    		ChangSelectCnt: function(index,cartNo, num) {
                var self = this;
               if(self.list[index].cnt < num){
            	   num = self.list[index].cnt;
               }
               if(num <0){
            	   num = 0;
               }
               
                var nparmap = {
                		cartNo : cartNo,
                		selectCnt : num
                };
                 $.ajax({
                    url: "/cart/ChangSelectCnt.dox",
                    type: "POST",
                    data:  nparmap,
                    success: function(data) {
                    	
                    	self.fnCartList(); 
                    },
                    error: function(error) {
                        console.log("Error removing item:", error);
                    }
                }); 
            },
            
    		
	   	
	    },
    created: function() {
        this.fnCartList(); 
        
        
    }
});
</script>
