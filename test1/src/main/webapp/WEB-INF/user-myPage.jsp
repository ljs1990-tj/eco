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
<!-- Header Section -->
<%@ include file="layout/header.jsp" %>
<div id="app">
    <!-- 전체구역 -->
    <section class="section">
        <!-- 왼쪽 구역 -->
        <div class="info-Container">
            <div class="info-User">
            	<div class="info-User-title">
	            	개인정보            	
            	</div>
                <div class="user-Area">
                    <ul>
                        <li><span>아이디: </span>{{user.userId}}</li>
                        <li><span>이름: </span>{{user.name}}</li>
                        <li><span>닉네임: </span>{{user.nickName}}</li>
                        <li><span>성별: </span>{{user.gender}}</li>
                        <li><span>핸드폰 번호: </span>{{ user.phone1 + '-' + user.phone2 + '-' + user.phone3 }}</li>
                        <li><span>이메일: </span>{{user.email}}</li>
                        <!-- 변경된 부분 -->
                        <li><span>생년월일: </span>{{ user.birth | formatDate }}</li>
                    </ul>
                </div>
                <div class="point-Area">
					<div style="margin-right: auto;">내 등급: 
						<span>{{user.userGrade}}</span>
						<i class="bi bi-arrow-clockwise" @click="fnUpdateGrade"></i>
					</div>
                    <div style="margin-left: auto;">포인트: <span>{{user.point}}</span></div>
                </div>
                <div class="check-Area">
                   <div style="margin-right: auto;"><button @click="fnopenPopup()">등급 혜택 자세히 보기</button></div>
                    <div style="margin-left: auto;"><button @click="fnUsermodify()" :disabled="isPopupOpen">정보 수정</button></div>
                </div>
            </div>
        </div>
        <!-- 오른쪽 구역 -->
        <div class="addr-Container">
            <div class="addr-Area">
	        	<div class="addr-Info-title">
		            	배송지 정보            	
	            </div>
                <div class="addr-Info">
                    <div v-for="address in addrList">
                        <div class="addr-InfoStyle">
                            <div>
                                <input type="radio" v-model="radio" :value="address.addrNo" :disabled="isPopupOpen">
                            </div>
								<div style="font-weight: bold; display: flex; justify-content: space-between;">
									<span>{{ address.name }}</span> 
								</div>
								<!-- 기본 배송지인 경우에만 아래 내용을 표시 -->
                            <div v-if="address.isDefault === 'Y'" style="font-weight: bold; display: flex; justify-content: space-between; color: blue;">
							    <span style="margin-right: 10px;">기본 배송지</span>
							    <span style="font-style:italic; color:black; text-align: right;">{{ address.addrName }}</span>
							</div>
                            <div>
                                <span>우편번호: </span> {{ address.zipCode }}
                            </div>
                            <div>
                                <span>주소: </span>{{ address.addr }}, {{ address.addrDetail }}
                            </div>
                            <div>전화번호: {{ address.phone | formatPhoneNumber }}</div>
                            <div v-if="address.addrRequest">
							    <span>특이사항: </span> {{ address.addrRequest }}
							</div>
                        </div>
                    </div>
                </div>
                <div class="addr-addArea">
                    <div>
                        <button @click="addDefaultAddress()" :disabled="isPopupOpen">주소 추가</button>
                    </div>
                    <div>
                        <button @click="fnDefault" :disabled="isPopupOpen">기본 배송지</button>
                        <button @click="updateSelectedAddresses" :disabled="isPopupOpen">주소 수정</button>
                        <button @click="deleteSelectedAddresses" :disabled="isPopupOpen">주소 삭제</button>
                    </div>
                </div>
            </div>
            <div class="recipe-Area">
                <div class="recipe-AreaStyle">
                    <div style="margin-right: auto;">내가 쓴 레시피</div>
                    <div style="margin-left: auto;"><button :disabled="isPopupOpen" @click="fnSearhUserRecipe">더보기</button></div>
                </div>
            </div>
        </div>
    </section>
    <!-- 등급혜택 창열기 -->
    <div v-if="isPopupOpen" class="popUp">
        <h3>등급혜택 자세히 보기</h3>
        <p></p>
        <!-- 등급혜택 창 내용 추가 -->
        <p>저희 사이트에서 100만 원 이상 사용 시 GOLD 등급으로,</p>
        <p>1000만 원 이상 사용 시엔 PLATINUM 등급으로 상향 조정됩니다.</p>
        <button class="info-Container" @click="fnclosePopup()">닫기</button>
    </div>
</div>
<!-- Footer Section -->
<%@ include file="layout/footer.jsp" %>	
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el: '#app',
		data: {
			user: {
				userId: "${userId}",
				userPw: "",
				userPw2: "",
				name: "",
				nickName: "",
				gender: "",
				phone1: "",
				phone2: "",
				phone3: "",
				email: "",
				birth: "",
				userGrade: "",
				point: ""
			},
			isPopupOpen: false,
			addrDefault: false,
			addrList: [],
			radio: "",
			cnt: ""
		},
		methods: {
			/* 등급혜택 창 열기 */
			fnopenPopup: function() {
				this.isPopupOpen = !this.isPopupOpen;
			},
			/* 등급혜택 창 닫기 */
			fnclosePopup: function() {
				this.isPopupOpen = false;
				location.reload(true);
			},
			 /* 개인정보 수정으로 인한 비밀번호 입력 페이지 이동 */
            fnUsermodify: function() {
                var self = this;
                var leftPosition = (window.screen.width - 400) / 2; // 화면의 가로 중앙 위치
		    	var topPosition = (window.screen.height - 400) / 2; // 화면의 세로 중앙 위치
                // 세션 값이 없을 경우 로그인 페이지로 이동
                if (!self.user.userId) {
                    alert("로그인 후 입장 가능합니다.");
                    window.location.href = "/user-login.do";
                    return;
                }
                //패스워드 확인하는 팝업창
                var popup = window.open('user-myPage-Password.do',
                    'Password Popup', 'width=500,height=500,,left=' + leftPosition + ',top=' + topPosition);
            },
			/* 주소목록 추가하기 */
			addDefaultAddress: function() {
				var self = this;
				var leftPosition = (window.screen.width - 400) / 2; // 화면의 가로 중앙 위치
		    	var topPosition = (window.screen.height - 400) / 2; // 화면의 세로 중앙 위치
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
						'Certification Popup', 'width=800,height=800,left=' + leftPosition + ',top=' + topPosition);

			},
			/* 주소 목록 삭제하기 */
			deleteSelectedAddresses: function() {
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
					url: "delete-addresses.dox",
					dataType: "json",
					type: "POST",
					data: {
						addrNo: self.radio
					},
					success: function(data) {
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
			updateSelectedAddresses: function() {
				var self = this;
				var leftPosition = (window.screen.width - 400) / 2; // 화면의 가로 중앙 위치
		    	var topPosition = (window.screen.height - 400) / 2; // 화면의 세로 중앙 위치
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
						'width=800,height=800,left=' + leftPosition + ',top=' + topPosition);
			},
			/* 기본배송지 설정 */
			fnDefault: function() {
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
			        userId: self.user.userId,
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
			// 사용자 정보 및 주소록 가져오기
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
		                self.addrList = data.addr;
		                var defaultAddressIndex = self.addrList.findIndex(address => address.isDefault === 'Y');
		                if (defaultAddressIndex !== -1) {
		                    var defaultAddress = self.addrList.splice(defaultAddressIndex, 1)[0];
		                    self.addrList.unshift(defaultAddress);
		                }
		            },
		             error: function(xhr, status, error) {
	                    // 에러 발생 시 처리
	                    // 에러 페이지로 리다이렉션
	                    window.location.href = "/error-page.do"; // 에러 페이지의 URL로 리다이렉션
	                } 
		        });
		    },
		    fnUpdateGrade: function(){
		    	var self = this;
	            var nparmap = {
	            	userId: self.user.userId
	            };
	            $.ajax({
	                url:"userGradeUpdate.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success: function(data) {
	                	if(data.result == 'success'){
	                		alert("갱신이 완료됐습니다.");
	                		location.reload(true);
	                	}
	                	console.log(data.result);
	                }
	            });
		    },
		    fnSearhUserRecipe: function() {
		    	var self = this;
		    	$.pageChange("/boardList.do", {code: "2", keyword: self.user.userId, keywordType: "user"});
		    },
		},
		created: function() {
		    var self = this;
		    if (this.user.userId == "") {
		        alert("로그인 후 입장 가능합니다.");
		        window.location.href = "/user-login.do";
		        return;
		    }
		    self.getUserInfo();
		},
	    filters: {
	        formatDate: function (value) {
	            if (!value) return '';
	            return value.substring(0, 4) + "년 " + value.substring(4, 6) + "월 " + value.substring(6, 8) + "일";
	        },
	        formatPhoneNumber: function(value) {
	            if (!value) return '';
	            return value.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
	        }
	    }
		
	});
</script>