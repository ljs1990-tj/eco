<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>본인인증</title>
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
				<input type="text" v-model="inputNumber" :disabled="inputFlg" @input="validateInput"  @keydown.enter="fnSms()">
				<button v-if="!phoneAuthFlg" @click="fnSms()">인증번호받기</button>
				<button v-if="phoneAuthFlg" @click="fnRePhone()">핸드폰번호 다시 입력하기</button>
			</div>
			<div v-if="phoneAuthFlg">
				<h3>인증번호</h3>
				<input type="text" v-model="inputNumber1" placeholder="숫자 6자리 입력"
					@input="validateInput1" @keydown.enter="fnAuth()">
					<span>{{timer}}</span>
				<div>
					<a href="javascript:;" @click="fnSms()">재전송</a>
				</div>
				<button @click="fnClose()">닫기</button>
				<button @click="fnAuth()">확인</button>
			</div>
			<button v-if="!phoneAuthFlg" @click="fnClose()">닫기</button>
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
			userId : "${userId}",
			phoneAuthFlg : false,
			inputFlg : false,
			inputNumber : "",	//핸드폰 번호 입력
			inputNumber1 : "",	//인증번호 입력
			timer : "",			//인증시간표시
			count : 180, //인증시간을 3분(180초)으로 설정
			number : "",	//인증번호비교
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
				// 정규식을 사용하여 숫자만 허용
				this.inputNumber1 = this.inputNumber1.replace(/\D/g, '');
				//숫자6자리만 사용 가능
				if(this.inputNumber1.length > 6){
					this.inputNumber1 =  this.inputNumber1.slice(0, 6);
				}
			},
			//문자 인증받기 
			fnSms : function() {
				var self = this;
				if(self.inputNumber == ""){
					alert("핸드폰 번호를 입력해주세요");
					return;
				} 
				if (self.inputNumber.length !== 11) {
			        alert("핸드폰번호 11자리여야 합니다.");
			        return;
			    }
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
						if (data.response.statusCode == "2000") {
							alert("문자전송했습니다");
							self.number = data.number;	//인증번호를 가져와서 저장
							self.inputFlg = true;
							self.phoneAuthFlg = true;
							setInterval(self.fnTimer, 1000);	//함수호출하여 시간표시
						} else {
							alert("문자전송실패했습니다");
							self.inputFlg = false;
							self.phoneAuthFlg = false;
						}
					},
					 error: function(xhr, status, error) {
		                    // 에러 발생 시 처리
		                    // 에러 페이지로 리다이렉션
		                    window.opener.location.href = "/error-page"; // 에러 페이지의 URL로 리다이렉션
		                }

				});
			},
			/* 핸드폰번호 다시 입력 */
			fnRePhone : function() {
				var self = this;
				self.inputFlg = false;
				self.phoneAuthFlg = false;
				self.inputNumber = "";
				
			},
			/* 인증번호 시간설정 */
			fnTimer : function() {
			    var self = this;  // Vue 인스턴스에 대한 참조를 변수에 저장
			    // 분, 초 계산
			    var minutes, seconds;
			    minutes = parseInt(self.count / 60, 10);  // 전체 초를 60으로 나누어 분 계산
			    seconds = parseInt(self.count % 60, 10);  // 전체 초를 60으로 나눈 나머지가 초
			
			    // 분과 초를 10진수로 표현
			    minutes = "0" + minutes;  // 분이 10 미만일 경우 앞에 0을 추가
			    seconds = seconds < 10 ? "0" + seconds : seconds;  // 초가 10 미만일 경우 앞에 0을 추가
			    // 화면에 표시될 타이머 문자열을 생성
			    self.timer = minutes + " : " + seconds;
			    // 타이머 카운트 다운
			    if (--self.count < 0) {
			        // 시간 초과 시 처리
			        alert("시간초과했습니다 다시 인증해주세요.");
			        self.count = 180;  // 초기값으로 시간을 재설정 (3분, 180초)
			        // 화면을 갱신하는 부분 (페이지 새로고침)
			        location.reload(true);
			    }
			},
			//인증완료시 실행
			fnAuth :  function () {
			    var self = this;
			    if (self.inputNumber1 === "") {
			        alert("인증번호를 입력해주세요.");
			        return;
			    } 	
			    if (self.inputNumber1.length !== 6) {
			        alert("인증번호는 6자리여야 합니다.");
			        return;
			    }
			    if(self.number != self.inputNumber1){
			    	alert("인증번호가 다릅니다 다시 확인 부탁드립니다");
			    	return;
			    }
				var nparmap = {
						userId : self.userId
				};
			    $.ajax({
					url : "user-authYn.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						if(data.result == "success"){
						        alert("인증되었습니다. 다시 로그인 부탁드립니다");	
						        if (window.opener && !window.opener.closed) {
						            try {
						            	window.opener.location.href = '/user-login.do';
						                window.close();
						            } catch (error) {                
						                console.error("부모 창을 열 수 없습니다:", error);
						            }
						        } else {
						            alert("부모 창이 닫혀있거나 유효하지 않습니다.");
						        }
						}
					},
					error: function(xhr, status, error) {
	                    // 에러 발생 시 처리
	                    // 에러 페이지로 리다이렉션
	                    window.opener.location.href = "/error-page"; // 에러 페이지의 URL로 리다이렉션
	             }
				});
			},
			//팝업창 닫기
			fnClose : function() {
				var self = this;
				alert("본인 인증시 사용이 가능합니다 다시 로그인하여 인증해주시기 바랍니다");
			    // 서버에 로그아웃 요청을 보냄
			    $.ajax({
			        url: "/logout", // 로그아웃을 처리하는 서버의 URL
			        type: "POST",
			        success: function(response) {
			            // 세션을 제거하고 로그인 페이지로 이동
			            window.opener.location.href = '/user-login.do';
			            window.close();
			        },
			        error: function(xhr, status, error) {
	                    // 에러 발생 시 처리
	                    // 에러 페이지로 리다이렉션
	                    window.opener.location.href = "/error-page"; // 에러 페이지의 URL로 리다이렉션
	                }

			    });
			},

		},
		created : function() {
			var self = this;
		}
	});
</script>