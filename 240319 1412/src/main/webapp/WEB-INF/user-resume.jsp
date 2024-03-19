<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>회원 복구 페이지</title>
</head>
<body>
    <div id="app">
        <div>
            <div style="margin-bottom: 10px;">
                <div>
                    <span style="font-weight: bold;">아이디:</span> 
                    <input type="text" v-model="userId" :disabled="userId" @keyup.enter="fnUser" style="padding: 5px; margin-left: 10px;">
                </div>
                <div>
                <span style="font-weight: bold;">비밀번호 :</span>
                <input type="password" v-model="userPw" @keyup.enter="fnCancel" style="padding: 5px; margin-left: 10px;" >
                </div>
                <button @click="fnCancel()" style="padding: 5px; background-color: #4CAF50; color: white; border: none; border-radius: 3px; cursor: pointer;">회원 복구</button>
                <button @click="fnClose()" style="padding: 5px; background-color: #4CAF50; color: white; border: none; border-radius: 3px; cursor: pointer;">닫기</button>
            </div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
    var app = new Vue({
        el : '#app',
        data : {
            list : {},
            userId : "${userId}",
            userPw : ""
        },
        methods : {
            fnUser: function() {
                var self = this;
                var nparmap = {
                    userId : self.userId
                };
                $.ajax({
                    url: "user-mypage.dox",
                    dataType: "json",
                    type: "POST",
                    data: nparmap,
                    success: function(data) {
                        console.log(data);
                        self.list = data.user;
                    }
                });
            },
            //회원탈퇴 취소하기
            fnCancel : function() {
                var self = this;
                if (self.userId === "") {
                    alert("아이디를 입력해 주세요");
                    return;
                }
                if (self.userPw === "") {
                    alert("비밀번호를 입력해 주세요");
                    return;
                }
                if(self.userPw != self.list.userPw){
                    alert("비밀번호가 맞지 않습니다 다시 기입해 주세요");
                    self.userPw = "";
                    return;
                }
                var nparmap = {
                    userId: self.userId,
                    userPw: self.userPw // 비밀번호를 파라미터로 전달
                };
                $.ajax({
                    url : "user-resume.dox", // 회원 복구 처리하는 URL로 수정
                    dataType : "json",
                    type : "POST",
                    data : nparmap,
                    success : function(data) {
                        if (data.result === "success") {
                            alert("회원탈퇴를 취소하셨습니다 다시 로그인을 부탁드립니다.");
                            window.opener.location.href = "/user-login.do";
                            window.close();
                        } else {
                            alert("오류 발생");
                            return;
                        }
                    },
                    error: function(xhr, status, error) {
                        // 에러 발생 시 처리
                        // 에러 페이지로 리다이렉션
                        window.location.href = "/error-page"; // 에러 페이지의 URL로 리다이렉션
                    }

                });
            },
            fnClose : function(){
                var self = this;
                window.location.href = "/user-login.do";
            }
        },
        created : function() {
            var self = this;
            self.fnUser();
        }
    });
</script>