<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>관리자 페이지</title>

</head>
<style>
</style>
<body>
	
	

	<div>
		<button onclick="requestPay()">카카오페이</button>
	</div>

	
	
</body>
</html>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP;
        IMP.init("imp71268227");

        function requestPay() {
            IMP.request_pay(
                {
                    pg: "kakaopay.TC0ONETIME", //Test는 TC0ONETIME
                    pay_method: "card",
                    merchant_uid: "57008833-33006", //그냥 랜덤
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
    </script>