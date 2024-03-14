<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>주문/결제 페이지</title>
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
    
   
	<%-- <jsp:include page="/layout/header.jsp"></jsp:include> --%>
</head>
<style>
</style>
<body>
	<div id="app">
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>주문/결제</h2>
                        <div class="breadcrumb__option">
                            <a href="javascript:;" @click="fnHome">Home</a>
                            <span>결제하기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        
            <div class="checkout__form" style="text-align: center;">
                <h4>배송정보</h4>
                <div class="checkout__input__checkbox">
                    <label for="addr">
                        <span>주소1: <span>{{user.addrNo}}</span></span>
                        <input type="checkbox" id="addr">
                        <span class="checkmark"></span>
                    </label>
                </div>
                <div class="checkout__input__checkbox">
                    <label for="diff-addr">
                        <span>주소2: <span>{{user.addrNo}}</span></span>
                        <input type="checkbox" id="diff-addr">
                        <span class="checkmark"></span>
                    </label>
                </div>
            </div>
    </section>
    <section class="checkout spad" >
                    <div class="container" >
                            <div class="checkout__order">
                                <h4>주문정보</h4>
                                <div class="checkout__order__products">전체 상품 <span>금액</span></div>
                                <ul>
								    <li v-for="product in products" :key="product.itemName">
								        {{ product.itemName }} <span>₩{{ product.price }}</span>
								    </li>
								</ul>

                                <div class="checkout__order__subtotal">금액 <span>₩{{product.price}}</span></div>
                                <div class="checkout__order__subtotal">적립률 <span>₩{{product.pRate}}</span></div>
                                <div class="checkout__order__total">총 금액 <span>₩{{product.price}}-₩{{product.sRate}}</span></div>
                                
                                <button onclick="requestPay()" class="site-btn">
                                <img src="../img/logo/kakaoPay.png" alt="카카오페이">
                                카카오페이</button>
                                <button id="naverPayBtn" class="site-btn">네이버페이</button>
                                
                                <button onclick="requestPay()" class="site-btn">휴대폰 결제</button>
                                <button onclick="requestPay()" class="site-btn">가상계좌 결제</button>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
	</div>
	

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

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

    <script>
    var app = new Vue({
        el: '#app',
        data: {
            user: {
            	userId: "${userId}",
                cartItems: [],
                product: {}
            },
            products: []
        },
            computed: {
                payment: function() {
                    let sumPrice = 0;
                    let discount = 0;
                    this.cartItems.forEach(item => {
                        sumPrice += item.price * item.quantity;
                        discount += item.price * item.sRate * item.quantity;
                    });
                    let finalPrice = sumPrice - discount;
                    return {
                        sumPrice: sumPrice,
                        discount: discount,
                        finalPrice: finalPrice
                    };
                }
            },
            methods: {
                fnCheckOut: function() {
                    var self = this;
                    $.ajax({
                        url: "kakaoPay.dox",
                        dataType: "json",
                        type: "POST",
                        data: {},
                        success: function(data) {
                            self.cartItems = data; 
                        },
                        error: function(error) {
                            console.log("Error fetching cart list:", error);
                        }
                    });
                	}
            },
           created: function() {
        this.fnCartList(); 
    }
});
   
   
        var IMP = window.IMP;
        IMP.init("imp71268227");

        function requestPay() {
            IMP.request_pay(
                {
                    pg: "kakaopay.TC0ONETIME", //Test는 TC0ONETIME
                    pay_method: "card",
                    merchant_uid: "57008833-33100", //그냥 랜덤
                    name: "테스트 상점", // 상표명
                    amount: 1004, // 가격
                    buyer_email: 'test@naver.com', //유저 이메일
                    buyer_name: '코드쿡', // 상품명
                    buyer_tel: '01032323232', // 유저 번호
                    buyer_addr: '서울특별시', // 주소
                    buyer_postcode: '123-456', //
                },
                function (rsp) {
                	console.log(rsp);
                $.ajax({
                    type: 'POST',
                    url: '/verifyIamport/' + rsp.imp_uid
                }).done(function(data) {
                    if(rsp.paid_amount === data.response.amount){
                        alert("결제 성공");
                        
                    } else {
                        alert("결제 실패");
                    }
                });
            });
        }
        var oPay = Naver.Pay.create({
            "mode" : "{#_mode}", // development or production
            "clientId": "{#_clientId}", // clientId
            "chainId": "{#_chainId}" // chainId
      });

      //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
      var elNaverPayBtn = document.getElementById("naverPayBtn");

      elNaverPayBtn.addEventListener("click", function() {
          oPay.open({
            "merchantUserKey": "{#_merchantUserKey}",
            "merchantPayKey": "{#_merchantPayKey}",
            "productName": "{#_productName}",
            "totalPayAmount": "{#_totalPayAmount}",
            "taxScopeAmount": "{#_taxScopeAmount}",
            "taxExScopeAmount": "{#_taxExScopeAmount}",
            "returnUrl": "{#_returnUrl}"
          });
      });
        
    </script>