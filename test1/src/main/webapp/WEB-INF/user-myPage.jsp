<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>마이 페이지</title>
<style>
    * {
        box-sizing: border-box;
    }
</style>
</head>
<body style="background-color:white;">
<div id="app">
    <!-- 전체구역 -->
    <section style="display: flex;width: 1500px; height: 625px; border: 1px solid black; overflow: hidden; margin: 0 auto;">
        <!-- 왼쪽 구역 -->
        <div style="overflow: hidden; width: 600px; float: left; border: 1px solid black;">
            <div style="width: 500px; border: 1px solid red; margin: 20px; ">
                <div style="height: 500px; border: 1px solid blue; overflow-y: scroll; padding: 10px;">
                    <ul style="list-style: none; padding-left: 0;">
                        <li><span>아이디 : </span>{{user.userId}}</li>
                        <li><span>이름 : </span>{{user.name}}</li>
                        <li><span>닉네임 : </span>{{user.nickName}}</li>
                        <li><span>성별 : </span>{{user.gender}}</li>
                        <li><span>핸드폰 번호 : </span>{{user.phone1}} -{{user.phone2}} - {{user.phone3}}</li>
                        <li><span>이메일 : </span>{{user.email}}</li>
                        <li><span>생년월일 : </span>{{user.birth}}</li>
                    </ul>
                </div>
                <div style="height: 40px; border: 1px solid black; padding: 10px; display: flex; justify-content: center; align-items: center;">
                    <div style="margin-right: auto;">내등급 : <span>{{user.userGrade}}</span></div>
                    <div style="margin-left: auto;">포인트 : <span>{{user.point}}</span></div>
                </div>
                <div style="height: 40px; border: 1px solid black; padding: 10px; display: flex; justify-content: center; align-items: center;">
                    <div style="margin-right: auto;"><button @click="fnopenPopup()">등급혜택 자세히 보기</button></div>
                    <div style="margin-left: auto;"><button @click="fnUsermodify()" :disabled="isPopupOpen">정보수정</button></div>
                </div>
            </div>
        </div>
        <!-- 오른쪽 구역 -->
        <div style="width: 900px; overflow: hidden; float: left;">
            <div style="width: 800px; border: 1px solid blue; margin: 20px;">
                <div style="height: 200px; border: 1px solid red; overflow-y: scroll; padding: 10px;">
                    <div v-for="address in addrList">
                        <div style="border: 1px solid #ccc; padding-left: 10px; padding-right:10px; padding-bottom: 10px; padding-top: 10px; margin: 0px auto;">
                            <div>
                                <input type="radio" v-model="radio" :value="address.addrNo" :disabled="isPopupOpen">
                            </div>
                            <div style="font-weight: bold;">{{ address.name }}</div>
                            <div v-if="addrDefault">기본배송지</div>
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
                <div style="height: 45px; border: 2px solid #ccc; padding: 10px; display: flex; justify-content: space-between;">
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
            <div style="width: 500px; border: 1px solid black; margin: 20px;">
                <div style="height: 100px; border: 1px solid black; padding: 10px; display: flex; justify-content: center; align-items: center;">
                    <div style="margin-right: auto;">내가 쓴 레시피</div>
                    <div style="margin-left: auto;"><button :disabled="isPopupOpen">더보기?</button></div>
                </div>
            </div>
            <div style="width: 500px; border: 1px solid black; margin: 20px;">
                <div style="height: 100px; border: 1px solid black; padding: 10px; display: flex; justify-content: center; align-items: center;">
                    <div style="margin-right: auto;">내주문 내역</div>
                    <div style="margin-left: auto;"><button :disabled="isPopupOpen">더보기?</button></div>
                </div>
            </div>
        </div>
    </section>
    <!-- 등급혜택 창열기 -->
    <div v-if="isPopupOpen"
         style=" position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); border: 1px solid #ccc; background-color:black; padding: 20px; z-index: 9999; text-align: center; color: white;">
        <h2>등급혜택 자세히 보기</h2>
        <!-- 등급혜택 창 내용 추가 -->
        <p>팝업 창에 표시할 내용을 여기에 작성하세요.</p>
        <button @click="fnclosePopup()">닫기</button>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
<script type="text/javascript">
    function createVueInstance() {
        return new Vue({
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
                cnt: "",
                isDefault: "N"
            },
            methods: {
                /* 등급혜택 창 열기 */
                fnopenPopup: function() {
                    this.isPopupOpen = true;
                },
                /* 등급혜택 창 닫기 */
                fnclosePopup: function() {
                    this.isPopupOpen = false;
                    location.reload(true);
                },
                /* 기본배송지 설정  */
                fndefault: function() {
                    var self = this;
                    self.isDefault = 'Y';
                    var nparmap = {
                        addrNo: self.radio,
                        isDefault: self.isDefault
                    };
                    console.log(nparmap);
                    $.ajax({
                        url: "user-mypage.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function(data) {
                            console.log(data);
                            self.isDefault = 'Y'; // AJAX 요청 성공 후에 값 업데이트
                        }
                    });
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
                /* 주소목록 추가하기 */
                addDefaultAddress: function() {
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
                updateSelectedAddresses: function() {
                    var self = this;
                    if (self.user.userId == "") {
                        alert("로그인 후 입장 가능합니다.");
                        window.location.href = "/user-login.do";
                    }
                    if (self.radio == "") { // 변수명 수정: addrNo -> self.radio
                        alert("수정할 정보를 선택해 주세요");
                        return;
                    }
                    if (!confirm("주소록을 수정하겠습니까?")) {
                        return;
                    }
                    console.log(self.radio);
                    var popup = window.open('/user-myPage-addrUpdate.do?addrNo='
                        + self.radio, 'addrUpdate Popup', 'width=900,height=900');
                },
                /* 개인정보 가져오기 */
                information: function() {
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
                            console.log(data);
                            self.user = data.user;
                        }
                    });
                },
                /* 주소록 가져오기 */
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
                            console.log(data);
                            self.addrList = data.addr;
                            if (data.addr.isDefault == 'Y') {
                                self.addrDefault = true;
                            } else {
                                self.addrDefault = false;
                            }
                        }
                    });
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
                }
            },
            created: function() {
                if (this.user.userId == "") {
                    alert("로그인 후 입장 가능합니다.");
                    window.location.href = "/user-login.do";
                    return;
                }
                this.information();
                this.getAddress();
            }
        });
    }

    createVueInstance();
</script>
</body>
</html>