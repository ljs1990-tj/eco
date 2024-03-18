<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
<link rel="stylesheet" href="css/myPage.css">
<title>마이 페이지</title>
<style>
    * {
        box-sizing: border-box;
    }
</style>
</head>
<body style="background-color:white;">
<div id="app">
<!-- Header Section -->
<%@ include file="layout/header.jsp" %>
    <!-- 전체구역 -->
    <section>
        <!-- 왼쪽 구역 -->
        <div class="info-Container">
            <div class="info-User">
                <div class="user-Area">
                    <ul>
                        <li><span>아이디 : </span>{{user.userId}}</li>
                        <li><span>이름 : </span>{{user.name}}</li>
                        <li><span>닉네임 : </span>{{user.nickName}}</li>
                        <li><span>성별 : </span>{{user.gender}}</li>
                        <li><span>핸드폰 번호 : </span>{{user.phone1}} - {{user.phone2}} - {{user.phone3}}</li>
                        <li><span>이메일 : </span>{{user.email}}</li>
                        <li><span>생년월일 : </span>{{user.birth}}</li>
                    </ul>
                </div>
                <div class="point-Area">
                    <div style="margin-right: auto;">내등급 : <span>{{user.userGrade}}</span></div>
                    <div style="margin-left: auto;">포인트 : <span>{{user.point}}</span></div>
                </div>
                <div class="check-Area">
                    <div style="margin-right: auto;"><button @click="fnopenPopup()">등급혜택 자세히 보기</button></div>
                    <div style="margin-left: auto;"><button @click="fnUsermodify()" :disabled="isPopupOpen">정보수정</button></div>
                </div>
            </div>
        </div>
        <!-- 오른쪽 구역 -->
        <div class="addr-Container">
            <div class="addr-Area">
                <div class="addr-Info">
                    <div v-for="address in addrList">
                        <div class="addr-InfoStyle">
                            <div>
                                <input type="radio" v-model="radio" :value="address.addrNo" :disabled="isPopupOpen">
                            </div>
								<div style="font-weight: bold; display: flex; justify-content: space-between;">
									<span>{{ address.name }}</span> 
									<span>{{ address.addrName }}</span>
								</div>
								<!-- 기본 배송지인 경우에만 아래 내용을 표시 -->
                            <div v-if="address.isDefault === 'Y'">기본 배송지</div>
                            <div>
                                <span>우편번호: </span> {{ address.zipCode }}
                            </div>
                            <div>
                                <span>주소: </span>{{ address.addr }},{{ address.addrDetail }}
                            </div>
                            <div>{{ address.phone }}</div>
                            <div>{{ address.addrRequest}}</div>
                        </div>
                    </div>
                </div>
                <div class="addr-addArea">
                    <div>
                        <button @click="addDefaultAddress()" :disabled="isPopupOpen">주소추가</button>
                    </div>
                    <div>
                        <button @click="fndefault()" :disabled="isPopupOpen">기본 배송지</button>
                        <button @click="updateSelectedAddresses()" :disabled="isPopupOpen">주소수정</button>
                        <button @click="deleteSelectedAddresses" :disabled="isPopupOpen">주소삭제</button>
                    </div>
                </div>
            </div>
            <div class="recipe-Area">
                <div class="recipe-AreaStyle">
                    <div style="margin-right: auto;">내가 쓴 레시피</div>
                    <div style="margin-left: auto;"><button :disabled="isPopupOpen">더보기?</button></div>
                </div>
            </div>
            <div class="order-Area">
                <div class="order-AreaStyle">
                    <div style="margin-right: auto;">내주문 내역</div>
                    <div style="margin-left: auto;"><button :disabled="isPopupOpen">더보기?</button></div>
                </div>
            </div>
        </div>
    </section>
    <!-- 등급혜택 창열기 -->
    <div v-if="isPopupOpen" class="popUp">
        <h2>등급혜택 자세히 보기</h2>
        <!-- 등급혜택 창 내용 추가 -->
        <p>팝업 창에 표시할 내용을 여기에 작성하세요.</p>
        <button @click="fnclosePopup()">닫기</button>
    </div>
</div>
<!-- Footer Section -->
<%@ include file="layout/footer.jsp" %>
</body>
</html>
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
			isPopupOpen : false,
			addrDefault : false,
			addrList : [],
			radio : "",
			cnt : ""
		},
		methods : {
			/* 등급혜택 창 열기 */
			fnopenPopup : function() {
				this.isPopupOpen = !this.isPopupOpen;
			},
			/* 등급혜택 창 닫기 */
			fnclosePopup : function() {
				this.isPopupOpen = false;
				location.reload(true);
			},
			 /* 개인정보 수정 페이지 이동 */
            fnUsermodify: function() {
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
            },
			/* 주소목록 추가하기 */
			addDefaultAddress : function() {
				var self = this;
				if (self.user.userId == "") {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
				}
				if (self.addrList.length >= 3) {
					alert("주소록은 최대 3개까지만 추가할 수 있습니다.");
					return;
				}
				if (!confirm("주소록을 추가하겠습니까?")) {
					return;
				}
				var popup = window.open('/user-myPage-addrAdd.do',
						'Certification Popup', 'width=600,height=600');

			},
			/* 주소 목록 삭제하기 */
			deleteSelectedAddresses : function() {
				var self = this;
				if (self.user.userId == "") {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
				}
				if (self.radio == "") { // 변수명 수정: addrNo -> self.radio
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
						// 성공시 부모창 새로고침후 팝업창 닫기
						if (data.result == "success") {
							location.reload(true);
						} else {
							alert("다시 시도해주세요");
							return;
						}
					 }
				});
			},
	
			// 주소록값 수정하기
			updateSelectedAddresses : function() {
				var self = this;
				if (self.user.userId == "") {
					alert("로그인 후 입장 가능합니다.");
					window.location.href = "/user-login.do";
				}
				if (self.radio == "") {
					alert("수정할 정보를 선택해 주세요");
					return;
				}
				if (!confirm("주소록을 수정하겠습니까?")) {
					return;
				}
				console.log(self.radio);
				var popup = window.open('/user-myPage-addrUpdate.do?addrNo='
						+ self.radio, 'addrUpdate Popup',
						'width=900,height=900');
			},
			/* 기본배송지 설정 */
			fndefault: function() {
			    var self = this;
			    if (self.user.userId == "") {
			        alert("로그인 후 입장 가능합니다.");
			        window.location.href = "/user-login.do";
			        return;
			    }
			    if (self.radio == "") {
			        alert("설정할 배송지를 선택해주세요.");
			        return;
			    }
			    if (!confirm("기본배송지로 선택하겠습니까?")) {
			        return;
			    }
			    var nparmap = {
			        userId : self.user.userId,
			        addrNo: self.radio
			    };
			    $.ajax({
			        url: "user-addr-default-reset.dox",
			        dataType: "json",
			        type: "POST",
			        data: nparmap,
			        success: function(data) {
			        	 if (data.result == "success") {
	                            alert("기본배송지가 설정되었습니다.");
	                            location.reload(true);
	                        } else {
	                            alert("다시 시도해주세요");
	                        }
			        },
			        error: function(xhr, status, error) {
	                    // 에러 발생 시 처리
	                    // 에러 페이지로 리다이렉션
	                    window.location.href = "/error-page"; // 에러 페이지의 URL로 리다이렉션
	                }
			    });
			},
			// 사용자 정보 가져오기
			getUserInfo: function() {
		        var self = this;
		        if (self.user.userId == "") {
		            alert("로그인 후 입장 가능합니다.");
		            window.location.href = "/user-login.do";
		        }
		        var nparmap = self.user;
		        $.ajax({
		            url: "user-mypage.dox",
		            dataType: "json",
		            type: "POST",
		            data: nparmap,
		            success: function(data) {
		                // 서버로부터 받아온 사용자 정보를 Vue.js 데이터에 할당
		                console.log(data);
		                self.user = data.user;
		            },
		            error: function(xhr, status, error) {
	                    // 에러 발생 시 처리
	                    // 에러 페이지로 리다이렉션
	                    window.location.href = "/error-page"; // 에러 페이지의 URL로 리다이렉션
	                }
		        });
		    },
		    // 주소록 가져오기
		    getAddress: function() {
		        var self = this;
		        if (self.user.userId == "") {
		            alert("로그인 후 입장 가능합니다.");
		            window.location.href = "/user-login.do";
		        }
		        var nparmap = {
		            userId: self.user.userId
		        };
		        $.ajax({
		            url: "user-addr.dox",
		            dataType: "json",
		            type: "POST",
		            data: nparmap,
		            success: function(data) {
		                // 서버로부터 받아온 주소록을 Vue.js 데이터에 할당
		                self.addrList = data.addr;
		                // 기본 배송지가 선택된 주소를 맨 위로 이동시키는 코드
		                var defaultAddressIndex = self.addrList.findIndex(address => address.isDefault === 'Y');
		                if (defaultAddressIndex !== -1) {
		                    var defaultAddress = self.addrList.splice(defaultAddressIndex, 1)[0];
		                    self.addrList.unshift(defaultAddress);
		                }
		            },
		            error: function(xhr, status, error) {
	                    // 에러 발생 시 처리
	                    // 에러 페이지로 리다이렉션
	                    window.opener.location.href = "/error-page"; // 에러 페이지의 URL로 리다이렉션
	                }
		        });
		    }
		},
		created : function() {
		    var self = this;
		    if (this.user.userId == "") {
		        alert("로그인 후 입장 가능합니다.");
		        window.location.href = "/user-login.do";
		        return;
		    }
		    self.getUserInfo();
		    self.getAddress();
		}
	});
</script>
