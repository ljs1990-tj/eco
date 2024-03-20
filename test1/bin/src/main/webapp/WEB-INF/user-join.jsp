<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<title>회원가입 페이지</title>
</head>
<style>
	ul, li {
		list-style: none;
		margin-top: 10px;
		font-size: 14px;
	}
	.container-join {
		border: none;
		background-color: white;
		border-radius: 5px;
		margin: 200px auto;
		width: 660px;
	}
	
	.join-text {
		text-decoration: none;
		color: #aaa;
	}
	
	.join-text:hover {
		color: #777;
	}
	
	.join-title {
		text-align: center;
		font-size: 20px;
		font-weight: bold;
	}
	
	.join-divide {
		width: 105px;
		float: left;
	}
	
	.join-input {
		width: 200px;
		height: 20px;
		border: 2px solid #ddd;
		border-radius: 5px;
	}
	
	.join-input:focus {
		border-color: #777;
	}
	
	.login-input {
		width: 255px;
		height: 40px;
		border: 2px solid #ddd;
		border-radius: 5px;
		margin-left: 10px;
	}
	
	.login-input::placeholder {
		font-size: 12px;
		padding-left: 10px;
		color: #999;
	}
	
	.zipcode-input {
		width: 100px;
	}
	
	.addr-btn {
		background-color: rgb(137, 200, 57);
		height: 25px;
		color: white;
		border-radius: 5px;
		border: none;
		cursor: pointer;
	}
	
	.addr-btn:hover {
		background-color: rgb(107, 170, 27);
	}
	
	.phone-input {
		width: 52px;
	}
	
	.email-input {
		width: 130px;
	}
	
	.under-line {
		border-bottom: 2px solid black;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	.required-star {
		font-weight: bold;
		color: red;
	}
	
	.required-input {
		text-align: right;
		font-size: 10px;
	}
	
	.join-button {
		width: 160px;
		height: 40px;
		cursor: pointer;
		border: none;
		border-radius: 3px;
		color: white;
		background-color: rgb(137, 200, 57);
	}
	
	.join-button:hover {
		background-color: rgb(107, 170, 27);
	}
	
	.text-center {
		text-align: center;
	}
	
	.margin-bottom-10px {
		margin-bottom: 10px;
	}
	
	.join-select {
		border-radius: 5px;
	}
</style>
<body>
	<!-- header -->
	<%@ include file="layout/header.jsp"%>
    <div id="app">
        <fieldset class="container-join">
            <div class="join-title">회원가입</div>
            <div class="required-input"><span class="required-star">*</span>필수입력사항</div>
            <ul>
                <div class="under-line"></div>
                <li>
                    <div class="join-divide">아이디<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input" v-model="user.userId" @keyup="fnIdCheck" maxlength="20" autofocus>
                    </span>
                    <div v-if="user.userId != ''">
                        <template v-if="!idCheckFlg2">
                            <div style="color: red;">아이디는 최소 5글자, 최대 20글자이어야 하며 하나 이상의 숫자와 영문자를 각각 포함하여야 합니다!</div>
                        </template>
                        <template v-else>
                            <div v-if="idCheckFlg" style="color: blue;">사용 가능한 아이디입니다.</div>
                            <div v-else style="color: red;">중복된 아이디입니다.</div>
                        </template>
                    </div>
                </li>
                <li>
                    <div class="join-divide">비밀번호<span class="required-star">*</span></div>
                    <span>
                        <input type="password" class="join-input" v-model="user.userPw" @keyup="fnCheck('pw1')" maxlength="16">
                    </span>
                    <div v-if="user.userPw != ''">
                        <div v-if="!pwCheckFlg" style="color: red;">비밀번호는 최소 8글자, 최대 16글자이어야 하며 하나 이상의 숫자, 영문자 및 특수문자를 각각 포함하여야 합니다!</div>
                    </div>
                </li>
                <li>
                    <div class="join-divide">비밀번호 확인<span class="required-star">*</span></div>
                    <span>
                        <input type="password" class="join-input" v-model="user.userPw2" @keyup="fnCheck('pw2')" maxlength="16">
                    </span>
                    <div v-if="user.userPw2 != ''">
                        <div v-if="!pwCheckFlg2" style="color: red;">비밀번호와 똑같이 입력하세요!</div>
                    </div>
                </li>
                <li>
                    <div class="join-divide">이름<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input" v-model="user.name" maxlength="30">
                    </span>
                </li>
                <li>
                    <div class="join-divide">닉네임<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input" v-model="user.nickName" maxlength="20">
                    </span>
                </li>
                <li>
                    <div class="join-divide">성별<span class="required-star">*</span></div>
                    <span>
                        <input type="radio" name="gender" value="남성" v-model="user.gender">남
                        <input type="radio" name="gender" value="여성" v-model="user.gender">여
                        <input type="radio" name="gender" value="기타" v-model="user.gender">기타
                    </span>
                </li>
                <li>
					<div class="join-divide">주소<span class="required-star">*</span></div>                
					<input type="text" class="join-input zipcode-input" v-model="user.zipCode" placeholder="우편번호" readonly>
					<input type="button" class="addr-btn" @click="execDaumPostcode" value="우편번호 찾기">
                    <div class="margin-bottom-10px"></div>
					<input type="text" class="join-input" style="width: 300px;" v-model="user.addr" placeholder="주소" readonly>
					<div class="join-divide margin-bottom-10px"></div>
					<input type="text" class="join-input" v-model="addrDetail1" placeholder="상세주소" ref="addrDetail1">
					<div style="margin-bottom: 10px;"></div>
                    <div class="join-divide margin-bottom-10px"></div>
					<input type="text" class="join-input" v-model="addrDetail2" placeholder="참고항목" readonly>
					<div style="margin-bottom: 10px;"></div>
					<div style="padding-left: 110px; font-size: 10px;">※ 현재 주소는 집 주소로 기본 저장되며, 후에 마이페이지에서 수정이 가능합니다.</div>
                </li>
                <li>
                    <div class="join-divide">핸드폰 번호<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input phone-input" v-model="user.phone1" maxlength="3"> -
                        <input type="text" class="join-input phone-input" v-model="user.phone2" maxlength="4"> -
                        <input type="text" class="join-input phone-input" v-model="user.phone3" maxlength="4">
                    </span>
                </li>
                <li>
                    <div class="join-divide">이메일<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input email-input" v-model="email1" placeholder="이메일 아이디 입력">
                        <span>@</span>
                        <input type="text" class="join-input email-input" v-model="email2" placeholder="직접 입력">
                        <select class="join-select" v-model="email3" @change="selectEmail">
                            <option value="" selected>직접 입력</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="kakao.com">kakao.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                        </select>
                    </span>
                </li>
                <li>
                    <div class="join-divide">생년월일<span class="required-star">*</span></div>
                    <span>
                        <input type="text" class="join-input" v-model="user.birth" placeholder="ex)19910101" maxlength="8" @keyup="fnDateCheck('birth')">
                    </span>
                    <div v-if="user.birth != ''">
                        <div v-if="!birthCheckFlg" style="color: red;">{{alertMessage}}</div>
                    </div>
                </li>
                <div class="under-line"></div>
                <li>
                    <div class="join-divide">이용약관 동의<span class="required-star">*</span></div>
                    <div><label for="check_all"><input type="checkbox" id="check_all" v-model="allChecked" @change="checkAll">전체 동의합니다.</label></div>
                    <div class="join-divide">　</div>
                    <div style="padding-left: 125px; font-size: 10px;">선택항목에 동의하지 않더라도 회원가입은 가능합니다.</div>
			        <div v-for="(item, index) in agreementItems" :key="index">
			          	<div class="join-divide" style="color: white;">·</div>
						<label :for="'check' + (index + 1)">
			            	<input type="checkbox" :id="'check' + (index + 1)" v-model="checkedItems" :value="item.id" @change="updateAllChecked">{{item.label}}
						</label>
			        </div>
			        <div>
			        <div class="join-divide" style="color: white;">·</div>
			          <label for="check4">
			            <input type="checkbox" id="check4" v-model="isEventYn">이벤트 수신 동의 (선택)
			          </label>
                    </div>
                </li>
            </ul>
            <div class="text-center">
                <button class="join-button" @click="fnJoin">회원가입</button>
            </div>
        </fieldset>
	</div>
	<!-- footer -->
	<%@ include file="layout/footer.jsp"%>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	email1: "",
    	email2: "",
    	email3: "",
    	user: {
    		userId: "",
    		userPw: "",
    		userPw2: "",
    		name: "",
    		nickName: "",
    		gender: "남성",
            phone1: "010",
            phone2: "",
            phone3: "",
            email: "",
    		birth: "",
    		eventYn: "",
        	zipCode: "",
        	addr: "",
        	addrDetail: "",
        	addrName: "집",
        	phone: "",
    	},
    	idCheckFlg: false,
    	idCheckFlg2: false,
    	pwCheckFlg: false,
    	pwCheckFlg2: false,
    	birthCheckFlg: false,
    	isEventYn: false,
		allChecked: false,
      	checkedItems: [],
      	agreementItems: [
        	{ id: 1, label: '이용약관 동의 (필수)' },
        	{ id: 2, label: '개인정보 수집·이용 동의 (필수)' },
        	{ id: 3, label: '본인은 만 14세 이상입니다. (필수)' },
        ],
        addrDetail1: "",
        addrDetail2: "",
    	alertMessage: "",
    }
    , methods: {
    	fnJoin: function() {
            var self = this;
            if(self.user.userId == "") {
            	alert("아이디를 입력하세요!");
            	return;
            }
            if(self.user.userPw == "") {
            	alert("비밀번호를 입력하세요!");
            	return;
            }
            if(self.user.name == "") {
            	alert("이름을 입력하세요!");
            	return;
            }
            if(self.user.nickName == "") {
            	alert("닉네임을 입력하세요!");
            	return;
            }
            if(self.user.userPw == "") {
            	alert("비밀번호를 입력하세요!");
            	return;
            }
            if(self.user.zipCode == "" || self.user.addr == "" || self.addrDetail1 == "") {
            	alert("우편번호와 주소를 입력해 주세요!");
            	return;
            }
            if(self.user.phone1 == "" || self.user.phone2 == "" || self.user.phone3 == ""){
                alert("핸드폰 번호를 입력하세요!");
                return;
            }
            if(self.email1 == "" || self.email2== ""){
                alert("이메일을 입력하세요!");
                return;
            }
            if(self.user.birth == ""){
                alert("생년월일을 입력하세요!");
                return;
            }
            self.user.email = self.email1 + "@" + self.email2;
            self.user.eventYn = self.isEventYn ? 'Y' : 'N';
            self.user.addrDetail = self.addrDetail1 + " " + self.addrDetail2;
            self.user.phone = self.user.phone1 + self.user.phone2 + self.user.phone3;
            if(self.idCheckFlg && self.idCheckFlg2 && self.pwCheckFlg && self.pwCheckFlg2 && self.birthCheckFlg) {
            	if(self.checkedItems.length === self.agreementItems.length) {
		            var nparmap = self.user;
		            $.ajax({
		                url:"user-join.dox",
		                dataType:"json",
		                type: "POST",
		                data: nparmap,
		                success: function(data) {
		                	console.log(data);
		                	if(data.result == "success") {
			                	alert("가입됐습니다!");
			                	$.pageChange("/user-login.do",{});
		                	} else {
		                		alert("오류로 인한 가입 실패!");
		                	}
		                }
		            });
            	} else {
            		alert("필수 이용약관에 전부 동의하시길 바랍니다!");
            		return;
            	}
            } else {
            	alert("필수로 입력해야 할 항목이 아직 남아있습니다!");
        		return;
            }
        },
        fnIdCheck: function(){
        	var self = this;
        	var regId = /^[a-z0-9_]{5,20}$/;
        	if(regId.test(self.user.userId)) {
        		self.idCheckFlg2 = true;
        	} else {
        		self.idCheckFlg2 = false;
        	}
        	var nparmap = {userId : self.user.userId};
	        $.ajax({
	            url:"check.dox",
	            dataType:"json",
	            type: "POST", 
	            data: nparmap,
	            success: function(data) {
	            	if(data.result == "success") {
	            		self.idCheckFlg = true;
	            	} else {
	            		self.idCheckFlg = false;
	            	}
	            }
	        });
        },
        fnCheck: function(flg) {
			var self = this;
			var regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
           	if(flg == 'pw1') {
	            if(regPwd.test(self.user.userPw)) {
					self.pwCheckFlg = true;
	            } else {
	            	self.pwCheckFlg = false;
	            }
           	} else if(flg == 'pw2') {
	            if(self.user.userPw != self.user.userPw2) {
					self.pwCheckFlg2 = false;
	            } else {
	            	self.pwCheckFlg2 = true;
	            }
           	}
		},
		fnDateCheck: function() {
			var self = this;
			var vDate = self.user.birth;
			var regNum = /^[0-9]*$/;
			
			if(regNum.test(vDate)) {
				self.birthCheckFlg = true;
				self.alertMessage = "";
			} else {
				self.birthCheckFlg = false;
				self.alertMessage = "생년월일엔 숫자만 입력하세요!";
			}
			
			if(vDate.length == 8) {
				var vDatePattern = /^(\d{4})(\d{1,2})(\d{1,2})$/;
				var dtArray = vDate.match(vDatePattern);
	
				var dtYear = dtArray[1];
	            var dtMonth = dtArray[2];
	            var dtDay = dtArray[3];
	            
	            var vDateObj = new Date(vDate.substr(0, 4), vDate.substr(4, 2) - 1, vDate.substr(6, 2)); // 8자리로 입력한 날짜 문자열을 날짜 객체로 전환
	            var currentDate = new Date();
	            var limitAge = new Date(currentDate.getFullYear() - 14, currentDate.getMonth(), currentDate.getDate());
	            if (dtMonth < 1 || dtMonth > 12) {
	            	self.birthCheckFlg = false;
	            	self.alertMessage = "알맞지 않은 날짜를 입력하셨습니다. 다시 한번 확인해 주세요!";
	            } else if (dtDay < 1 || dtDay > 31) {
	            	self.birthCheckFlg = false;
	            	self.alertMessage = "알맞지 않은 날짜를 입력하셨습니다. 다시 한번 확인해 주세요!";
	            } else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31) {
	            	self.birthCheckFlg = false;
	            	self.alertMessage = "알맞지 않은 날짜를 입력하셨습니다. 다시 한번 확인해 주세요!";
	            } else if (dtMonth == 2) {
	                var isLeap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
	                if (dtDay > 29 || (dtDay == 29 && !isLeap)) {
	                	self.birthCheckFlg = false;
	                	self.alertMessage = "알맞지 않은 날짜를 입력하셨습니다. 다시 한번 확인해 주세요!";
	                }
	            } else if(vDateObj > limitAge) {
	            	self.birthCheckFlg = false;
                	self.alertMessage = "만 14세 미만은 가입이 불가합니다!";
	            } else if((vDate.substr(0, 4)) < 1901) {
	            	self.birthCheckFlg = false;
	            	self.alertMessage = "알맞지 않은 날짜를 입력하셨습니다. 다시 한번 확인해 주세요!";
	            } else {
	            	self.birthCheckFlg = true;
	            	self.alertMessage = "";
	            }
			} else {
				self.birthCheckFlg = false;
            	self.alertMessage = "생년월일 8자리를 전부 입력하세요!";
			}
		},
        selectEmail: function() {
        	var self = this;
			self.email2 = self.email3;
		},
		checkAll: function() {
			var self = this;
			if(self.allChecked) {
				self.checkedItems = self.agreementItems.map(item => item.id);
				$("#check4").prop('checked', true);
			} else {
				self.checkedItems = [];
				$("#check4").prop('checked', false);
			}
		},
		updateAllChecked: function() {
			var self = this;
			self.allChecked = self.checkedItems.length === self.agreementItems.length;
		},
		execDaumPostcode() {
		      var self = this;
		      new daum.Postcode({
		        oncomplete: function(data) {
		          let addr = ''; // 주소 변수
		          let extraAddr = ''; // 참고항목 변수

		          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		            addr = data.roadAddress;
		          } else { // 사용자가 지번 주소를 선택했을 경우(J)
		            addr = data.jibunAddress;
		          }

		          if(data.userSelectedType === 'R'){
		            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		              extraAddr += data.bname;
		            }
		            if(data.buildingName !== '' && data.apartment === 'Y'){
		              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            if(extraAddr !== ''){
		              extraAddr = ' (' + extraAddr + ')';
		            }
		            self.addrDetail2 = extraAddr;
		          } else {
		            self.addrDetail2 = '';
		          }

		          self.user.zipCode = data.zonecode;
		          self.user.addr = addr;
		          self.$nextTick(() => {
		            self.$refs.addrDetail1.focus();
		          });
		        }
		      }).open();
		    }
    }
    , created: function() {
    	var self = this;
	}
});
</script>