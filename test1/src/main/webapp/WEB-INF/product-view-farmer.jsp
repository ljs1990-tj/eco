<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="js/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <title>상품 상세보기</title>
</head>
<style>
        .product-detail-top-container {
        display: flex;
        max-width: 1200px; 
        margin: 0 auto; 
        padding: 20px; 
        background-color: #fffdfd; 
        border-bottom: 1px solid #fafafa; 
    }
    .product-image {
    	flex-basis: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column; /* 세로 정렬 */ 
    }

    .product-info {
        flex-basis: 50%;
        position: relative; 
    }

    .product-info th {
        color: #666;
        font-size: 15px;
        width: 150px;
        text-align: left;
    }

    .product-info td {
        color: #666;
        font-size: 15px;
        text-align: left;
    }
   
    .product-image img {
        width: 300px;
        height: 350px; 
        border-radius: 5px;
    }
    
    
    /* 선택적: 기본적으로 첫 번째 이미지만 표시 */
	.product-image img:first-child {
	    display: block;
	}

   	.product-info h1, .product-info p {
        margin: 0 0 10px; /* 제목과 단락 사이의 마진 설정 */
    }

    .product-info p {
        color: #666; /* 단락 텍스트 색상 */
    }
    .button-container {
       /*  position: absolute; */
        right: 0;
        bottom: 0;
        margin: 10px;
        display: flex; /* 버튼들을 수평으로 정렬 */
        gap: 10px; /* 버튼 사이의 간격 */
    }

    .cart-btn {
        padding: 15px 20px; 
        background-color: #5cb85c;
        color: white; 
        border: none; 
        border-radius: 3px; 
        cursor: pointer;
        font-size: 14px;
        font-weight: 500;
        transition: background-color 0.3s; 
        width: 160px;
        /* position: absolute; 
        right: 0; 
        bottom: 0;
        margin: 10px;  */
    }

    .buy-btn {
        padding: 15px 20px;
        background-color: white; 
        color: #5cb85c;
        border: 1px solid #5cb85c;
        border-radius: 3px;
        cursor: pointer;
        font-size: 14px;
        font-weight: 500;
        transition: background-color 0.3s;
        width: 160px; 
       	
    }

    .product-description {
        max-width: 1200px; 
        margin: 20px auto; /* 상단 컨테이너와의 간격을 주기 위해 마진 사용 */
        padding: 15px; 
        background-color: #ffffff; /* 배경색 설정 */
        border: 1px solid #fafafa; /* 경계선 설정 */
        border-radius: 8px; 
        text-align: center;
        
    }

    .product-description img {
        display: block; /* 이미지를 블록 요소로 만듦 */
        margin: 0 auto; /* 상하 마진을 0으로, 좌우 마진을 자동으로 설정하여 중앙 정렬 */
        max-width: 100%; /* 이미지가 컨테이너를 벗어나지 않도록 최대 너비 설정 */
        height: auto; /* 이미지 비율 유지 */
    }

    .product-description h2 {
        margin: 0 0 20px; /* 제목 아래 여백 */
        color: #333; /* 제목 색상 */
        font-size: 24px; /* 제목 폰트 크기 */
    }

    .product-description p {
        color: #666; /* 문단 색상 */
        line-height: 1.6; /* 줄 간격 */
    }

    .product-description h4 {
        margin-top: 20px;
        color: #333;
        font-size: 20px;
    }

    .product-description p {
        color: #666;
        line-height: 1.6;
    }

    .description-tabs {
        text-align: center;
        margin-bottom: 20px;
        display: flex; /* Flex 컨테이너로 설정 */
        justify-content: center; /* 가운데 정렬 */
        gap: 0; /* 버튼 사이의 간격 제거 */
        
        position: sticky;
	    top: 0; 
	    background-color: #fff; 
	    z-index: 1000; 
	 
    }

    .tab-button {
        padding: 15px 10px;
        background-color: #ffffff;
        border-top: solid 3px black;
        border-bottom: solid 1px rgb(179, 179, 179);
        border-left: none;
        border-right: none;
        cursor: pointer;
        transition: background-color 0.5s;
        width: 250px;
        font-size: 18px;
        font-weight: 700;
        color: #868686;
    }

    .tab-button:hover, .tab-button.active {
        color: #6fc76f;
    }
    table td {
        padding-top: 10px; /* 상단 패딩 */
        padding-bottom: 10px; /* 하단 패딩 */
    }

    table th {
        text-align: left;
        width: 250px;
        font-size: 20px;
        font-weight: 550;
        color:#424242;
    }

    table td {
        text-align: left;
        font-size: 17px;
        color:#585858;
    }

    .product-reviews {
        margin-top: 200px;
        margin-bottom: 200px;
        color: #333;
    }

    .review-item {
        display: block;
        margin-bottom: 15px; /* 리뷰 아이템 간의 마진 */
        padding: 5px;
        background-color: #ffffff; /* 리뷰 배경색 */
    }

    .review-content {
        flex: 3; 
        text-align: left;
        border-bottom: 1px solid #d4d4d4;
    }
    
    h4 {
        text-align: left;
    }
    
    .product-inquiries {
        text-align: left;
        margin-bottom: 20px;
    }
    
    .product-inquiries td img {
	    float: left; 
	    margin-right: 10px; 
	}

    .product-inquiries table {
        width: 100%;
        border-collapse: collapse; /* 테이블 경계선을 겹치게 설정 */
        margin-top: 20px;
    }
    
    .product-inquiries th {
        background-color: #fcfcfc; 
        border-top: 2px solid #333; 
        border-bottom: 1px solid #ccc; 
        padding: 8px;
        text-align: left; 
        font-size: 15px;
    }

    .product-inquiries td {
        border-bottom: 1px solid #eeeeee;
        padding: 8px;
        text-align: left; 
        font-size: 14px;
    }
    
    .product-inquiries button{
        color: #6fc76f;
        background-color: white;
        border: 1px solid #6fc76f;
        border-radius: 5px;
        cursor: pointer;
        width: 120px;
        height: 25px;
        text-align: center;
    }

    .product-inquiries button:hover{
        color: white;
        background-color: #6fc76f;
    }
    
    /* 상품 상세정보 썸네일 이미지  */
    .thumbnail-images {
        display: flex;
        justify-content: center;
        gap: 5px; /* 이미지 사이의 간격 */
        margin-top: 5px; /* 큰 이미지와의 간격 */
    }

    .thumbnail-images img {
        width: 70px; 
        height: auto; 
        cursor: pointer; 
        border: 2px solid transparent; 
    }

    .thumbnail-images img:hover {
        border-color: #ddd; /* 호버 시 테두리 색상 변경 */
    }
    
    /* 질문 제목에 마우스 오버 시 호버 효과 */
    .qaClick:hover {
    	cursor: pointer;
    }
    
    .product-delivery{
    	border-top:1px solid #ccc; 
    	margin-top: 100px;
    }
    
    .product-delivery th{
    	font-size: 16px;
    }
    
    .product-delivery td{
    	font-size: 14px;
    }
    .product-details img{
    	width: 800px;
    	height: 750px;
    }
    
</style>
<body>
<!-- Header Section -->
<%@ include file="layout/header.jsp" %>
    <div id="app">
        <div class="product-detail-top-container">
            <div class="product-image" >
            	<!-- <template v-for="item in fileList">
			    	<img :src="item.filePath+item.fileName" alt="이미지!">
		        </template> -->
		        
		        <img v-if="fileList.length > 0" :src="fileList[ImageIndex].filePath + fileList[ImageIndex].fileName" alt="이미지!" @click="">
		        
		        <div class="thumbnail-images">
			        <img v-for="(item, index) in fileList" :src="item.filePath+item.fileName" :alt="'이미지 ' + index" @click="selectImg(index)">
			    </div>
            </div>

            <div class="product-info">
              <!-- 상품 정보 영역: 상품의 제목, 가격, 설명 등이 여기!! -->
                <div>
                    <h4> {{info.itemName}}</h4>
                    <p v-html="info.contents">{{info.contents}}</p>
                    <template v-if="info.sRate > 0">
	                    <del style="color: #ccc">{{info.wonPrice}}원</del> 
	                    <p>판매가 : {{DiscountPrice(info.price, info.sRate)}}원</p>
	                    <p style="color: #eb6f1c">{{info.sRate}}% 할인</p>
                    </template>
                    <template v-else>
	                    <p>판매가 : {{info.wonPrice}}원</p>
                    </template>
                </div>
                <table>
                    <tr>
                        <th>배송비</th>
                        <td>{{info.transInfo}} </td>
                    </tr>
                    <tr>
                        <th>배송 종류 </th>
                        <td>
                            ECO 퀵 배송<br>
                            23시 전 주문 시 내일 12시 이전에 도착<br>
                            제주도, 울릉도 핵빠른 배송 별도 확인 필요
                        </td>
                    </tr>
                    <tr>
                        <th>포장 타입  </th>
                        <td>에코 패키징 </td>
                    </tr>
                </table>
              
                <div class="button-container">
                    <button class="buy-btn">구매하기</button>
                </div>
            </div>
        </div>

        <!-- 상품 상세 설명 영역 -->
        <div class="product-description">
            <div class="description-tabs">
                <button class="tab-button" @click="scrollToElement('.product-details')">상품 상세 정보</button>
                <button class="tab-button" @click="scrollToElement('.product-reviews')">리뷰</button>
                <button class="tab-button" @click="scrollToElement('.product-inquiries')">문의 내용</button>
                <button class="tab-button" @click="scrollToElement('.product-delivery')">배송 내용</button>
            </div>
            
            <!-- 상품 상세 보기 영역 -->
            <div class="product-details">
            	<template v-for="item in fileDetailList">
					<img :src="item.filePath+item.fileName" alt="주요 이미지">
				</template>
            </div>
        
            <!-- 리뷰 영역 -->
            <div class="product-reviews">
                <h4>상품 후기</h4>
                <template v-if="review.length > 0">
	                <div class="review-item" v-for="item in review">
	                    <div class="review-content">
	                        <!-- 작성자가 남긴 리뷰 -->
	                        <p style="color: black;">{{item.hideName}}</p>
	                        <p style="font-size: 15px;">{{item.rContents}}</p>
	                        <P style="font-size: 14px;">{{item.uDateTimeNew}}</P>
	                    </div>
	                </div>
                </template>
                <template v-else>
                	 <p>등록된 후기가 없습니다.</p>
                </template>
            </div>
            
        
            <!-- 문의 내용 영역 -->
             <div class="product-inquiries">
                <h4>상품 문의</h4>
                <p>상품에 대한 문의를 남기는 공간입니다. 배송관련, 주문(취소/교환/환불) 관련 문의 및 요청사항은 1:1 문의에 남겨주세요.</p>
                <button @click="fnCustomer(userId, itemNo)">문의하기</button>
                <table>
                    <thead>
                        <tr>
                            <th style="width: 60%; text-align: center;">제목</th>
                            <th style="width: 10%;">작성자</th>
                            <th style="width: 10%;">작성일</th>
                            <th style="width: 10%;">답변 상태</th>
                            <template v-if="userType == 'A' && qa.length > 0">
	                            <th style="width: 10%;">답변하기</th>                            
                            </template>
                        </tr>
                    </thead>
                    <tbody>
						<template v-if="qa.length > 0">
							<template v-for="(item, index) in qa">
								<tr>
									<td @click="toggleContents(index)" style="width: 60%;"
										class="qaClick">{{item.title}}</td>
									<td style="width: 10%;">{{item.userId}}</td>
									<td style="width: 10%;">{{item.qaUdate}}</td>
									<td style="width: 10%;">
					                    <span v-if="item.comment" style="color: #5cb85c">답변 완료</span>
					                    <span v-else style="color: #ccc">답변 대기</span>
					                </td>
					                <td v-if="userType == 'A'">
				                        <template v-if="item.comment">
				                            문의 처리
				                        </template>
				                        <template v-else>
				                            <button @click="fnAnswer(item.boardNo)">답변하기</button>
				                        </template>
				                    </td>
								</tr>
								<tr v-if="qaOnOff === index">
									<td colspan="5" class="qa-contents">
										<img src="img/question.png" style="width: 30px"> 
											{{item.qaContents }}
										<div v-if="item.comment" style="margin-top: 20px;">
											<img src="img/answer.png" style="width: 30px"> 
											{{ item.comment }}
										</div>
									</td>
								</tr>
							</template>
						</template>
						<tr v-else>
							<td colspan="4" style="text-align: center;">등록된 문의가 없습니다.</td>
						</tr>
					</tbody>
                </table>
            </div>

            <!-- 배송 내용 영역 -->
            <div class="product-delivery">
                <table>
                    <tr>
                        <th>배송 관련 안내</th>
                        <td>배송 과정 중 기상 악화 및 도로교통 상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다.</td>
                    </tr>
                    <tr>
                        <th>배송 안내</th>
                        <td>  
                            A물류 택배사를 사용하고 있습니다.<br>
                            A조 마켓은 빠른 배송을 위해 주문 마감시간을 1차, 2차 총 2번에 나눠 진행합니다. (1차는 오전 9시, 2차는 오후 2시입니다.) <br>
                            * 사정에 따라 출고가 지연될 수 있는 점 양해 부탁드립니다.<br>
                            수령하고 싶은 날짜를 별도로 지정한 예약 배송은 불가합니다.
                        </td>
                    </tr>
                    <tr>
                        <th>교환 및 반품(환불) 정보</th>
                        <td>교환 및 환불이 필요한 경우 고객센터로 문의해 주세요.</td>
                    </tr>
                    <tr>
                        <th>취소 및 주소 변경</th>
                        <td>
                            업체 주문 확인 후 [배송준비중/상품준비중]인 주문건은 송장입력 되지 않은 상태라도 물류창고에 포장지시가 되어 제품 포장 등 출고작업중으로 취소 및 주소 변경 처리가 제한될 수 있습니다.<br>
                            - 주문 수량이 많을 시 여러 개의 송장으로 발송되어 도착일이 상이할 수 있습니다.<br>
                            - 출고 후 취소/교환/반품 시 박스 수량에 따라 왕복택배비가 추가로 발생할 수 있습니다.<br>
                            - 오후 2시 이전까지 결제 완료된 건에 한해서 당일 출고됩니다.
                        </td>
                    </tr>
                </table>
               
            </div>
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
    	itemNo: "${map.itemNo}",
    	userId: "${map.userId}",
    	info: {},
    	fileList : [],
    	fileDetailList : [],
    	review: [], //상품 리뷰
    	qa: [], // 상품 문의
    	activeTab: 'details',
    	ImageIndex: 0, // 이미지 선택 인덱스
    	qaOnOff: null
    	
    }
    , methods: {
    	fnView: function() {
            var self = this;
            var nparmap = {
            		itemNo: self.itemNo,
            		kind : 2
            };
            $.ajax({
                url:"productView.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	self.info = data.info;
                	self.info.wonPrice = self.info.price.toLocaleString('ko-KR');
                	self.fileList = data.fileList;
                	self.fileDetailList = data.fileDetailList;
                	self.review = data.review;
                	self.qa = data.qa;
                
                }
            });
        },
        
        fnAddCart: function(itemNo, userId) {
            var self = this;
            var nparmap = {
            		itemNo: self.itemNo,
    				userId: self.userId	
            };
            $.ajax({
                url:"addCart.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(itemNo);
                	console.log(userId);
                	if(data.result=="success"){
                		alert("장바구니에 담았습니다.");
                	}else{
                		alert("예기지 못한 오류가 발생했습니다. 다시 시도해주세요");
                	}
                }
            });
        },
        fnCustomer: function(userId, itemNo){
        	console.log(userId);
        	console.log(itemNo);

        	 // 팝업 창으로 열 페이지의 URL
            var url = "/productQuestion.do?userId=" + userId + "&itemNo=" + itemNo;
            // 팝업 창 옵션 설정
            var windowOptions = "width=900, height=700";
            // 팝업 창 열기
            window.open(url, "ProductQuestion", windowOptions);
        },
        fnAnswer: function(boardNo){
        	var self = this;
        	console.log(boardNo);
        	
            var url = "/productAnswer.do?boardNo=" + boardNo;
            // 팝업 창 옵션 설정
            var windowOptions = "width=650, height=550";
            // 팝업 창 열기
            window.open(url, "productAnswer", windowOptions);
        },
        /* 상품정보, 상품평 등.. 선택버튼  */
        scrollToElement: function(selector) {
	        var element = document.querySelector(selector);
	        if(element) {
	            element.scrollIntoView({ behavior: 'smooth' });
	        }
	    },
	    
	    /* 상품 정보 리스트 이미지  */
	    /* nextImage: function() {
	        if(this.ImageIndex < this.fileList.length - 1) {
	            this.ImageIndex++;
	        } else {
	            this.ImageIndex = 0; 
	        }
	    },
	    prevImage: function() {
	        if(this.ImageIndex > 0) {
	            this.ImageIndex--;
	        } else {
	            this.ImageIndex = this.fileList.length - 1; 
	        }
	    }, */
	    
	    /* 썸네일 이미지 선택 */
	    selectImg: function(index) {
	        this.ImageIndex = index;
	    },
	    
	    /* 문의 토글 기능 */
	    toggleContents: function(index) {
	        if(this.qaOnOff === index) {
	            this.qaOnOff = null;
	        } else {
	            this.qaOnOff = index;
	        }
	    },
	    /* kr통화 표시 */
        DiscountPrice: function(price, sRate) {
            const disPrice = price * ((100 - sRate) / 100);
            return disPrice.toLocaleString('ko-KR');
        }
        
    }
    , created: function() {
    	var self = this;
		self.fnView();
	}
});
</script>