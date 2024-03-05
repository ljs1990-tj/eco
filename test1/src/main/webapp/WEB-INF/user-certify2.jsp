<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>첫번째 페이지</title>
</head>
<style>
body {
	background-color: #fff;
	font-size: 18px;
	line-height: 1.2;
	font-family: '맑은 고딕', 'Malgun gothic', '돋움', dotum, Arial, Sans-serif;
	letter-spacing: -0.6px;
	color: #000;
	-webkit-text-size-adjust: none;
}

#header {
	padding-top: constant(safe-area-inset-top);
	padding-top: env(safe-area-inset-top);
	background-color: #f8f8f8;
	text-align: center;
}

.passCertiInfo.grayBox {
	padding: 20px 18px;
	font-size: 14px;
	color: #8f8f8f;
	line-height: 20px;
	background-color: #f8f8f8;
}

.passCertiInfo .infoTitle {
	font-size: 16px;
	font-weight: 500;
	color: #666;
}

.fc_ple {
	color: #ff3949 !important;
}
</style>
<body>
	<div id="app">
		<header id="header">
			<h1>
				<a href="javascript:;"> <img alt="logo" src="/img/logo_pass.png">
				</a>
			</h1>
			<h2>문자(SMS)로 인증</h2>
		</header>
		<section>
			<div>
				<span>핸드폰 번호 입력:</span> 
				<input type="text" v-model="inputNumber" :disabled="inputflg" @input="validateInput">
				<button v-if="!flg" @click="fnSms()">인증번호받기</button>
				<button v-if="flg" @click="fnRePhone()">핸드폰번호 다시 입력하기</button>
			</div>
			<div v-if="flg">
			<h3>인증번호</h3>
			<input type="text" v-model="inputNumber1" placeholder="숫자 6자리 입력" @input="validateInput1">
			<div>
				<a href="javascript:;" @click="">재전송</a>
			</div>
			<button>취소</button>
			<button>확인</button>
			</div>
			<div class="passCertiInfo">
				<h3 class="infoTitle">
					<strong>인증번호 문자를 못 받으셨나요?</strong>
					<ul>
						<li>
							<p>
								"인증번호가 문자로 수신되지 않을 경우 " 
								<span class="fc_ple">스팸메세지함을 확인</span>
								"하시거나 정확한 정보로 재시도 해주시기 바랍니다."
							</p>
						</li>
						<li>
							<p>"입력하신 핸드폰번호가 일치하지 않을 경우 인증번호 문자는 발송 되지 않습니다."</p>
						</li>
					</ul>
				</h3>

			</div>
		</section>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			inputflg : false,
			inputNumber : "",
			inputNumber1 : "",
			flg : false
		},
		methods : {
			//핸드폰번호 입력 정규식
			validateInput : function() {
				// 정규식을 사용하여 숫자만 허용
				this.inputNumber = this.inputNumber.replace(/\D/g, '');
				//숫자11자리만 사용 가능
				if (this.inputNumber.length > 11) {
					this.inputNumber = this.inputNumber.slice(0, 11);
				}
			},
			//인증번호 정규식
			validateInput1 : function(){
				this.inputNumber1 = this.inputNumber1.replace(/\D/g, '');
				if(this.inputNumber1 =  this.inputNumber1.slice(0, 6)){
					
				}
			},
			//문자 인증받기 
			fnSms : function() {
				var self = this;
				var nparmap = {
					phoneNumber : self.inputNumber
				};
				$.ajax({
					url : "send-one",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						if (data.statusCode == "2000") {
							alert("문자전송했습니다");
							self.inputflg = true;
							self.flg = true;
						} else {
							alert("문자전송실패했습니다");
							self.inputflg = false;
							self.flg = false;
						}
					}
				});
			},
			fnRePhone : function() {
				var self = this;
				self.inputflg = false;
				self.flg = false;
				self.inputNumber = "";
				
			}
		},
		created : function() {
			var self = this;

		}
	});
</script>