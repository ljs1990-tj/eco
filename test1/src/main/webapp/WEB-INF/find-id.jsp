<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>아이디 찾기</title>
</head>
<style>
	.find-something {
		border: 1px solid #ddd;
		background-color: white;
		border-radius: 5px;
		margin: 30px auto;
		width: 300px;
	}
	.find-title {
		text-align: center;
		font-size: 15px;
		font-weight: bold;
		margin: 25px;
	}
	.find-btn {
		background-color: rgb(137, 200, 57);
		height: 25px;
		color: white;
		border-radius: 5px;
		border: none;
		cursor: pointer;
		margin: 10px 0px 10px 0px;
	}
	.find-btn:hover {
		background-color: rgb(107, 170, 27);
	}
	.find-input {
		width: 120px;
		height: 20px;
		border: 2px solid #ddd;
		border-radius: 5px;
	}
	.find-input:focus {
		border-color: #777;
	}
	.close-btn {
		background-color: red;
		height: 25px;
		color: white;
		font-weight: bold;
		border-radius: 5px;
		border: none;
		cursor: pointer;
		float: right;
		margin-top: 10px;
	}
</style>
<body>
	<div id="app">
		<fieldset class="find-something">
			<div class="find-title">아이디 찾기</div>
			<div>
				<input type="text" class="find-input" v-model="inputNumber" :disabled="inputFlg" @input="validateInput" @keydown.enter="fnSms" placeholder="ex) 01012345678" maxlength="11">
				<button class="find-btn" v-if="!phoneAuthFlg" @click="fnSms">인증번호 받기</button>
				<button class="find-btn" v-if="phoneAuthFlg" @click="fnRePhone">폰번호 다시 입력하기</button>
			</div>
			<div v-if="phoneAuthFlg">
				<h3>인증번호</h3>
				<input type="text" class="find-input" v-model="inputNumber1" placeholder="숫자 6자리 입력" @input="validateInput1" @keydown.enter="fnAuth">
					<span>{{timer}}</span>
					<button class="find-btn" @click="fnSms">재전송</button>
				<div>
				<!-- <button @click="fnClose">닫기</button> -->
				<button class="find-btn" @click="fnAuth">확인</button>
				</div>
			</div>
			<div v-if="completeFlg">
				<div>찾으신 아이디: {{userId}}</div>
			</div>
			<button class="close-btn" v-if="!phoneAuthFlg" @click="fnClose">창 닫기</button>
		</fieldset>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	userId: "",
   		phoneAuthFlg : false,
		inputFlg : false,
		completeFlg: false,
		inputNumber : "",	// 핸드폰 번호 입력
		inputNumber1 : "",	// 인증번호 입력
		timer : "",			// 인증시간 표시
		count : 180, // 인증시간을 3분(180초)으로 설정
		number : "",	// 인증번호 비교
		timerInterval : "" // 시간 흐르는 타이머
    }
    , methods: {
    	fnSearchId: function() {
            var self = this;
	        var nparmap = {phoneNumber: self.inputNumber};
	        $.ajax({
	            url:"checkPhoneNum.dox",
	            dataType:"json",
	            type: "POST", 
	            data: nparmap,
	            success: function(data) {
	            	if(data.result == "success") {
	            		console.log(data);
	            		self.userId = data.userId;
	            	} else {
	            		self.completeFlg = false;
	            		alert("해당 번호를 지닌 아이디가 존재하지 않습니다!");
	            		window.close();
	            	}
	            }
	        });
    	},
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
				alert("핸드폰 번호를 입력해 주세요");
				return;
			}else if (self.inputNumber.length !== 11) {
		        alert("핸드폰 번호는 11자리여야 합니다.");
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
						alert("문자 전송했습니다.");
						self.number = data.number;	//인증번호를 가져와서 저장
						self.inputFlg = true;
						self.phoneAuthFlg = true;
						self.timerInterval = setInterval(self.fnTimer, 1000);	//함수호출하여 시간표시
					} else {
						alert("문자 전송 실패했습니다.");
						self.inputFlg = false;
						self.phoneAuthFlg = false;
					}
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
		/* 인증번호 시간 설정 */
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
		        alert("시간 초과했습니다. 다시 인증해 주세요.");
		        self.count = 180;  // 초기값으로 시간을 재설정 (3분, 180초)
		        // 화면을 갱신하는 부분 (페이지 새로고침)
		        location.reload(true);
		    }
		},
		//인증 완료 시 실행
		fnAuth : async function () {
		    var self = this;
		    if (self.inputNumber1 === "") {
		        alert("인증번호를 입력해 주세요.");
		        return;
		    } else if (self.inputNumber1.length !== 6) {
		        alert("인증번호는 6자리여야 합니다.");
		        return;
		    }
		    if (self.number == self.inputNumber1) {
		        alert("인증되었습니다.");
		        self.completeFlg = true;
		        clearInterval(self.timerInterval);
		        self.fnSearchId();
		        /* if (window.opener && !window.opener.closed) {
		            try {
		                await new Promise(resolve => setTimeout(resolve, 500)); // 예시: 500ms 동안 대기
		                window.opener.location.href = "/user-join.do";	// 메인 페이지 URL로 변경
		                window.close();
		            } catch (error) {                
		                console.error("부모 창을 열 수 없습니다:", error);
		            }
		        } else {
		            alert("부모 창이 닫혀있거나 유효하지 않습니다.");
		        }  */
		    } else {
		        alert("인증번호 다시 확인 바랍니다.");
		    }
		},
		//팝업창 닫기
		fnClose : function() {
			window.close();
		}
    }
    , created: function() {
    	var self = this;
	}
});
</script>