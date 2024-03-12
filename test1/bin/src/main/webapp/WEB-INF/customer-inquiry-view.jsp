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
     .container {
		display: flex;
		flex-direction: column; /* 요소들을 세로로 나열 */
		width: 75%;
		max-width: 1200px;
		margin: 0 auto;
		padding: 20px;
		background: #fff;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	.inquiry-summary {
		margin-bottom: 50px;
        text-align: center; 
	}
    .inquiry-summary h2 {
        font-size: 30px;
        color: #303030;
    }

    .inquiry-summary p {
        font-size: 14px;
        color: #838383;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-weight: 500;
    }
	.inquiry-details table {
		width: 100%;
		border-collapse: collapse;
	}
	.inquiry-details th{
        border: 1px solid #f5f2f2; 
		padding: 5px;
        height: 40px;
        text-align: left;
        background-color: #f3f3f380;
	}

    .inquiry-details td {
        border: 1px solid #ddd; 
		padding: 5px;
        height: 40px;
        text-align: left;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #474747;
        
	}
    .inquiry-details input {
        width: 100%;
        height: 100%;
        font-size: 16px;
        color: #303030;
    }

    .textarea-container {
        margin-top: 40px; 
    }
    .textarea-container textarea {
        width: 100%; 
        height: 400px; 
        padding: 10px; 
        box-sizing: border-box; 
        border: 1px solid #ccc; 
        border-radius: 4px; 
        resize: none;
        font-size: 16px;
        color: #474747;
    }

    .button-container {
        text-align: right; 
    }
    .button-container button {
        padding: 10px 20px; 
        margin-left: 10px; 
        background-color: #5cb85c;
        color: white; 
        border: none; 
        border-radius: 5px; 
        cursor: pointer; 
    }
    .button-container button:hover {
        background-color: #20792c;
    }
</style>
<body>
	<div id="app">
		<div class="container">
            <div class="inquiry-summary">
                <h2>문의 내역</h2>
                <p>고객님이 남겨주신 문의 내용이에요. 문의주신 내용을 빨리 확인하도록 하겠습니다.</p>
            </div>
            <div class="inquiry-details">
                <table>
                    <tr>
                        <th style="width: 20%;">제목</th>
                        <td style="width: 80%;" style="width: 100%; box-sizing: border-box;" >
                            <input type="text" v-model="info.title">
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 20%;">작성자</th>
                        <td style="width: 80%;">{{info.nickName}}</td>
                    </tr>
                    <tr>
                        <th style="width: 20%;">작성일</th>
                        <td style="width: 80%;">{{info.uDateTime}}</td>
                    </tr>
                </table>
            </div>
            <div class="textarea-container">
                <textarea v-model="contents">{{info.contents}}</textarea>
                <div class="button-container">
                    <button @click="fnEdit">수정하기</button>
                    <button @click="fnRemove">삭제하기</button>
                </div>
            </div>
			
			<template v-if="userType == 'A' ">
	            <div class="textarea-container">
	                <textarea placeholder="답변을 남겨주세요"></textarea>
	                <div class="button-container">
	                    <button>답변 남기기</button>
	                </div>
	            </div>			
			</template>
        </div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	boardNo : "${map.boardNo}",
    	info : {},
    	userId : "${userId}",
    	userType : "${userType}",
    	contents : ""
    }
    , methods: {
    	fnView: function() {
            var self = this;
            var nparmap = {
            	boardNo : self.boardNo	
            };
            $.ajax({
                url:"InquiryView.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	self.info = data.info;
                	self.contents = data.info.contents;
                }
            });
        },
        fnRemove: function() {
            var self = this;
            if (!confirm("문의 내용을 삭제하시겠습니까?")){
            	return;
            }
            var nparmap = {
            	boardNo : self.boardNo	
            };
            $.ajax({
                url:"InquiryRemove.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	if(data.result == "success"){
                		alert("삭제되었습니다");
                		$.pageChange("/customerService.do", {});
                	}else{
                		alert("다시 시도해주세요");
                	}
                }
            });
        },
        fnEdit: function() {
            var self = this;
            var nparmap = {
            	boardNo : self.boardNo,
            	title: self.info.title, 
                contents: self.contents     	
            };
            $.ajax({
                url:"InquiryEdit.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data.result);
                	if (data.result == "success") {
						alert("수정되었습니다.");
						$.pageChange("/customerService.do", {});
					} else {
						alert("다시 시도해주세요");
					}
                }
            });
        }
    }
    , created: function() {
    	var self = this;
		self.fnView();
	}
});
</script>