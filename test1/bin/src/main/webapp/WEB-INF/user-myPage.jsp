<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>마이 페이지</title>

</head>
<style>
body {
	background-color: rgb(229, 229, 229);
}

ul, li {
	list-style: none;
	margin-top: 10px;
	font-size: 13px;
}

.section-box1 {
	position: relative;
	width: 400px;
	height: 250px;
	background-color: #f0f0f0;
	border: 2px solid #ccc;
	border-radius: 10px;
	padding: 20px;
	margin: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.section-box2 {
	position: relative;
	top: 20px; /* 원하는 위치로 조절 (상단 여백) */
	right: 0px; /* 원하는 위치로 조절 (우측 여백) */
	width: 400px;
	height: 250px;
	background-color: #f0f0f0;
	border: 2px solid #ccc;
	border-radius: 10px;
	padding: 20px;
	margin: 20px;
	/* overflow-y: auto; /* 수직 스크롤 활성화 */ */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.section-box3 {
	position: relative;
	top: 20px; /* 원하는 위치로 조절 (상단 여백) */
	right: 0px; /* 원하는 위치로 조절 (우측 여백) */
	width: 400px;
	height: 250px;
	background-color: #f0f0f0;
	border: 2px solid #ccc;
	border-radius: 10px;
	padding: 20px;
	margin: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.section-box4 {
	position: relative;
	top: 20px; /* 원하는 위치로 조절 (상단 여백) */
	right: 0px; /* 원하는 위치로 조절 (우측 여백) */
	width: 400px;
	height: 250px;
	background-color: #f0f0f0;
	border: 2px solid #ccc;
	border-radius: 10px;
	padding: 20px;
	margin: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.button-container {
	position: relative;
	height: 40px;
	border: 2px solid #ccc;
	text-align: center;
	/* bottom: 15px;
	right: -20px; */
}

/* .button-container button {
	width: 140px;
	height: 40px;
	cursor: pointer;
	border: none;
	border-radius: 3px;
	color: white;
	background-color: rgb(137, 200, 57);
}

.button-container button:hover {
	background-color: rgb(107, 170, 27);
} */
/* 팝업창 */
.popup {
	display: flex;
	align-items: center;
	justify-content: center;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}

.popup-content {
	background: white;
	padding: 20px;
	border-radius: 8px;
}
</style>
<body>
	<div id="app">
		<header> </header>
		<section>
			<!-- 첫번째 -->
			<div style="width: 1300px; overflow: hidden;">
				<div style="overflow: hidden; width: 600px; float: left;">
					<div style="width: 500px; border: 1px solid black;">
						<div class="section-box1">
							<fieldset>
								<legend>개인 정보</legend>
								<ul>
									<li><span>아이디 : </span>{{user.userId}}</li>
									<li><span>이름 : </span>{{user.name}}</li>
									<li><span>닉네임 : </span>{{user.nickName}}</li>
									<li><span>성별 : </span>{{user.gender}}</li>
									<li><span>핸드폰 번호 : </span>{{user.phone1}} -
										{{user.phone2}} - {{user.phone3}}</li>
									<li><span>이메일 : </span>{{user.email}}</li>
									<li><span>생년월일 : </span>{{user.birth}}</li>
								</ul>
							</fieldset>
							<div>
								<span>내등급 : </span><span>{{user.userGrade}}</span> <span>포인트
									: </span><span>{{user.point}}</span>
							</div>
						</div>
						<div class="button-container">
							<!-- 등급혜택 자세히 보기 버튼 -->
							<button @click="fnGradeselect()">등급혜택 자세히 보기</button>
							<button @click="fnUsermodify()">정보수정</button>
						</div>
					</div>
				</div>
				<div style="width: 600px; float: left;">
					<!-- 두번째 -->
					<div style="width: 500px; border: 1px solid black;">
						<div class="section-box2">
							<div
								style="width: 400px; height: 230px; border: 1px solid black; overflow-y: scroll;">
								<div v-for="address in addrList">
									<fieldset>
										<legend>주소 정보</legend>
										<ul>
											<input type="radio" v-model="radio" :value="address.addrNo">
											<span>주소:</span>{{address.addr }}
											</li>
											<li><span>주소 번호:</span> {{ address.addrNo }}</li>
											<li><span>상세 주소:</span> {{ address.addrDetail }}</li>
											<li><span>우편번호:</span> {{ address.zipCode }}</li>
											<li><span>수령인 이름:</span> {{ address.name }}</li>
											<li><span>전화번호:</span> {{ address.phone }}</li>
											<li><span>주소 이름:</span> {{ address.addrName }}</li>
										</ul>
									</fieldset>
								</div>
							</div>
						</div>
						<div class="button-container" style="padding-top: 20px">
							<!-- 기본주소추가 버튼 클릭 이벤트 -->
							<button @click="addDefaultAddress()">주소추가</button>
							<!-- 기본주소수정 버튼 클릭 이벤트 -->
							<button @click="updateSelectedAddresses()">주소수정</button>
							<!-- 기본주소삭제 버튼 클릭 이벤트 -->
							<button @click="deleteSelectedAddresses">주소삭제</button>
						</div>
					</div>
					<!-- 세번째 -->
					<div class="section-box3" style="">
						<span>내가 쓴 레시피</span>
						<button>더보기?</button>
					</div>
					<!-- 네번째 -->
					<div class="section-box4" style="">
						<span>내주문 내여</span>
						<button>더보기?</button>
					</div>
				</div>
			</div>
		</section>
		<footer> </footer>

		<!-- 팝업 창 -->
		<div v-if="isPopupOpen" class="popup">
			<div class="popup-content">
				<p style="color: black;">등급혜택 내역</p>
				<!-- 여기에 등급혜택 내용을 추가하세요 -->
				<ul>
					<li>등급혜택 1</li>
					<li>등급혜택 2</li>
					<li>등급혜택 3</li>
					<!-- 등급혜택 내용을 필요에 맞게 추가 -->
				</ul>
				<button @click="closePopup">닫기</button>
			</div>
		</div>
		<footer></footer>
	</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			user : {
				userId : "${userId}",
				userPw : "",
				userPw2 : "",
				name : "",
				nickName : "",
				gender : "",
				phone1 : "",
				phone2 : "",
				phone3 : "",
				email : "",
				birth : "",
				userGrade : "",
				point : ""
			},
			addrList : [],
			isPopupOpen : false,
			radio : "",
			cnt : ""
		},
		methods : {
			/* 등급혜택 창 열기 */
			fnGradeselect : function() {
				var self = this;
				self.isPopupOpen = true;
			},
			/* 등급혜택 창 닫기 */
			closePopup : function() {
				var self = this;
				self.isPopupOpen = false;
			},
			/* 주소 목록 삭제하기 */
			deleteSelectedAddresses : function() {
				var self = this;
				var addrNo = self.radio;
				if (self.user.userId == "") {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
				}
				if (addrNo == "") {
					alert("삭제할 정보를 선택해 주세요");
					return;
				}
				if (!confirm("주소록을 삭제하겠습니까?")) {
					return;
				}
				$.ajax({
					url : "delete-addresses.dox",
					dataType : "json",
					type : "POST",
					data : {
						addrNo : self.radio
					},
					success : function(data) {
						//성공시 부모창 새로고침후 팝업창 닫기
						if (data.result == "success") {
							location.reload(true);
						} else {
							alert("다시 시도해주세요");
							return;
						}
					}
				});
			},
			/* 주소목록 추가하기 */
			addDefaultAddress : function() {
				var self = this;
				if (self.addrList.length >= 3) {
					alert("주소록은 최대 3개까지만 추가할 수 있습니다.");
					return;
				}
				if (self.user.userId == "") {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
				}
				if (!confirm("주소록을 추가하겠습니까?")) {
					return;
				}
				var popup = window.open('/user-myPage-addrAdd.do',
						'Certification Popup', 'width=600,height=600');

			},
			// 주소록값 수정하기
			updateSelectedAddresses : function() {
				var self = this;
				var addrNo = self.radio;
				if (self.user.userId == "") {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
				}
				if (addrNo == "") {
					alert("수정할 정보를 선택해 주세요");
					return;
				}
				if (!confirm("주소록을 수정하겠습니까?")) {
					return;
				}
				console.log(addrNo);
				var popup = window.open('/user-myPage-addrUpdate.do?addrNo='
						+ addrNo, 'addrUpdate Popup', 'width=900,height=900');
			},
			/* 개인정보 가져오기 */
			information : function() {
				var self = this;
				if (self.user.userId == "") {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
				}
				var nparmap = self.user;
				$.ajax({
					url : "user-mypage.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.user = data.user;
					}
				});
			},
			/* 주소록 가져오기 */
			getAddress : function() {
				var self = this;
				if (self.user.userId == "") {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
				}
				var nparmap = {
					userId : self.user.userId
				};
				$.ajax({
					url : "user-addr.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.addrList = data.addr;
					}
				});
			},
			/* 개인정보 수정 페이지 이동 */
			fnUsermodify : function() {
				var self = this;
				// 세션 값이 없을 경우 로그인 페이지로 이동
				if (!self.user.userId) {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
					return;
				}
				//패스워드 확인하는 팝업창
				var popup = window.open('user-myPage-Password.do',
						'Password Popup', 'width=500,height=500');
			}
		},
		created : function() {
			var self = this;
			if (self.user.userId == "") {
				alert("로그인 후 입장 가능합니다.");
				window.location.href = "/user-login.do";
			}
			self.information();
			self.getAddress();
		}
	});
</script>