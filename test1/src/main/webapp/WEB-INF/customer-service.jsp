<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>고객센터</title>
</head>
<style>
		.container {
		display: flex; /* Flexbox 레이아웃 적용 */
		width: 75%;
		max-width: 1200px;
		margin: 0 auto;
		padding: 20px;
		background: #fff;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	
	.menu-area {
		width: 25%;
		padding: 35px;
	}

	.menu-area h2 {
		font-size: 35px;
		color: #505050;
	}
	
	.content-area {
		flex: 1; 
		padding: 10px; 
		background: #ffffff; /* 배경색 */
		border-left: 1px solid #ffffffa2; /* 구분선 */
	}

	.content-area p{
		font-size: 16px;
		font-weight: 500;
		color: #8f8f8f;
	}
	.content-area th, td {
		color: #4e4e4e;
		font-size: 14px;
		font-weight: 550;
	}

	
	/* 메뉴 스타일링 */
	.menu-item {
		padding: 10px;
		/* margin-bottom: 5px; */
		cursor: pointer;
		transition: background-color 0.3s;
		display: flex;
		font-size: 15px;
		font-weight: 600;
		justify-content: space-between; /* 내용 사이에 공간을 최대로 만들어 줌 */
		align-items: center; /* 세로 중앙 정렬 */
		border: 0.5px solid #d4d4d446;
		width: 250px;
		height: 40px;
		color: #6d6d6d;
	}

	.align-right {
		color: #6d6d6d;
		font-size: 20px;
	}
	
	.menu-item-selected, .menu-item:hover {
		background-color: #f1f1f1;
		color: rgb(0, 138, 57);
	}
	
	table {
	    width: 100%; 
	    border-collapse: collapse; 
	    margin-top: 20px; 
	}
	th {
        border-top: 2px solid black;
        border-bottom: 1px solid rgb(180, 180, 180); 
	    padding: 8px; 
	    text-align: center;
		padding-top: 20px; /* 상단 패딩 증가 */
		padding-bottom: 20px; /* 하단 패딩 증가 */
		text-align: left; /* `<td>`에 적용되는 정렬 */ 
	}

	td {
        border-top: 1px solid rgb(218, 218, 218);
        border-bottom: 1px solid rgb(218, 218, 218); 
	    padding: 8px; 
	    text-align: left;
        cursor: pointer;
		padding-top: 15px; /* 상단 패딩 증가 */
		padding-bottom: 15px; /* 하단 패딩 증가 */
		text-align: left; /* `<td>`에 적용되는 정렬 */
	}
	
	thead {
	    background-color: #fdfcfc; 
	}
	

    button {
		background: #5cb85c;
		color: white;
		border: none;
        border-radius: 5px;
		padding: 10px 20px;
		cursor: pointer;   
	}

    .content-area {
        display: flex; 
        flex-direction: column; 
        justify-content: space-between; /* 콘텐츠와 버튼 사이의 공간 분배 */
        height: 100%;
		margin-top: 40px; 
    }
	.content-area h2 {
		font-size: 25px;
		color: #505050
	}
	.content-area input {
		height: 40px;
		width: 500px;
		border: 1px solid rgb(148, 148, 148);
		border-radius: 3px;
	}

	.content-area textarea {
		height: 500px;
		width: 500px;
		border: 1px solid rgb(148, 148, 148);
		border-radius: 3px;
		resize: none;
	}
	.content-area label {
		display: block;
		margin-bottom: 8px; /* 라벨과 입력란 사이의 간격 추가 */
	}

	.content-area span {
		color: red;
		font-weight: bold;
		font-size: 20px;
	}

	.input-group {
		font-size: 17px;
		font-weight: bold;
		margin-bottom: 20px;
	}

	input[type="text"] {
		font-size: 17px;
		color: #303030;
	}

	textarea {
		font-size: 17px;
		color: #303030;
	}

    .button-container {
        text-align: left;
        padding: 15px; 
    }
        
</style>
<body>
	<div id="app">
	    <div class="container">
	        <div class="menu-area">
				<h2>고객센터</h2>
				<div class="menu-item" :class="{ 'menu-item-selected': selectedMenuItem === 'faq' }" @click="updateContent('faq')">자주하는 질문 <span class="align-right">></span></div>
				<div class="menu-item" :class="{ 'menu-item-selected': selectedMenuItem === 'history' }" @click="updateContent('history')">문의 내역 <span class="align-right">></span></div>
				<div class="menu-item" :class="{ 'menu-item-selected': selectedMenuItem === 'inquiry' }" @click="updateContent('inquiry')">1:1 문의하기 <span class="align-right">></span></div>				
	        </div>
	        
	        <div class="content-area">
	            <div v-if="selectedMenu === 'faq'">
	                <h2>자주하는 질문</h2>
	                <p>고객님들께서 가장 자주하는 질문들을 모았습니다.</p>
	                 <table>
				        <thead>
				            <tr>
				                <th>번호</th>
				                <th>카테고리</th>
				                <th style="text-align: center;">제목</th>
				            </tr>
				        </thead>
				        <tbody>
				             <template v-for="(faq, index) in faqs">
						        <tr @click="toggleDetail(index)" :key="faq.id">
						            <td>{{ index + 1 }}</td>
						            <td>{{ faq.category }}</td>
						            <td>{{ faq.title }}</td>
						        </tr>
						        <tr v-if="faq.showDetail" :key="faq.id">
						            <td colspan="3">{{ faq.detail }}</td>
						        </tr>
						    </template>
				        </tbody>
				    </table>
	            </div>
	            <div v-if="selectedMenu === 'history'">
	                <h2>1:1 문의</h2>
	                <p>고객님께서 남겨주신 1:1 문의는 여기에 표기됩니다.</p>
                    <table>
                        <thead>
                            <tr>
                                <th style="width: 60%; text-align: center;">제목</th>
                                <th style="width: 20%;">작성일</th>
                                <th style="width: 20%;">답변상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in list">
                                <td>{{item.title}}</td>
                                <td>{{item.uDateTime}}</td>
                                <td>답변 완료</td>
                            </tr>
                        </tbody>
                    </table>
	            </div>
	            	<div v-if="selectedMenu === 'inquiry'">
	                <h2>문의하기</h2>
	                <p>A조 마켓의 중심은 항상 고객님입니다.</p>
                     <!-- 제목 입력란 -->
					<div class="input-group">
						<label for="title">제목 <span>*</span></label>
						<input type="text" id="title" name="title" placeholder="제목을 입력해주세요" required>
					</div>

					<!-- 내용 입력란 -->
					<div class="input-group">
						<label for="content">내용 <span>*</span></label>
						<textarea id="content" name="content" rows="10" require>
						</textarea>
					</div> 
					<div class="button-container">
						<button>문의하기</button>
					</div>
	            </div>
	            
	        </div>
	    </div><!-- <div class="container">  -->
	</div><!--<div id="app">  -->
</body>
</html>

<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list: [],
			selectedMenu: 'faq',
			selectedMenuItem: null, // 선택된 메뉴 아이템을 저장하기 위한 속성 추가	        
			faqs : [ 
				{ id: 1, category: '주문/결제', title: '결제(환불)는 어떻게 하나요?', detail: '▶ 결제(환불)는 다음과 같이 진행해주시면 됩니다. ~~', showDetail: false },
	            { id: 2, category: '배송', title: '주문한 상품은 언제 배송되나요?', detail: '▶ 주문일로부터 약 1~2일이 소요됩니다', showDetail: false },
	            { id: 3, category: '포장', title: '친환경 박스 회수한다는데 어떻게 요청하나요?', detail: '▶ 친환경 박스에 붙어져있는 스티커만 제거해주시면 됩니다.', showDetail: false },
	            { id: 4, category: '회원', title: '아이디/비밀번호를 잊어버렸어요', detail: '▶ 아이디 찾기 및 비밀번호 찾기 진행해주세요', showDetail: false },
	            { id: 5, category: '상품', title: '친환경/유기농/무기농은 어떻게 다른가요?', detail: '▶ 친환경은 ㅇㅉㄱ ㅈㅉㄱ 유기농 ㅇㅉㄱ 무기농 ㅈㅉㄱ', showDetail: false },
	            { id: 6, category: '취소/교환/환불', title: '교환(반품)진행 시 배송비가 부과되나요?', detail: '▶ 어우 그럼요', showDetail: false },
	            { id: 7, category: '서비스이용', title: '상품후기는 어떻게 작성하나요?', detail: '▶ 구매하신 상품만 후기 작성이 가능합니다', showDetail: false },
                { id: 8, category: '적립금', title: '적립금은 어떻게 받을 수 있나요?', detail: '▶ 구매하신 상품만 후기 작성이 가능합니다', showDetail: false },
	            { id: 9, category: '시스템오류', title: '결제가 되지 않아요', detail: '▶ 구매하신 상품만 후기 작성이 가능합니다', showDetail: false },
	            { id: 10, category: '회원', title: '회원정보는 어떻게 변경하나요?', detail: '▶ 구매하신 상품만 후기 작성이 가능합니다', showDetail: false },
	            { id: 11, category: '배송', title: '배송이 늦는다고 문자가 왔어요', detail: '▶ 구매하신 상품만 후기 작성이 가능합니다', showDetail: false },
	            { id: 12, category: '회원가입', title: '회원 가입시 어떤 혜택이 있나요?', detail: '▶ 구매하신 상품만 후기 작성이 가능합니다', showDetail: false },
	            { id: 13, category: '회원', title: '주문하지도 않았는데 배송완료 알림 문자가 왔어요', detail: '▶ 구매하신 상품만 후기 작성이 가능합니다', showDetail: false },
	            { id: 14, category: '배송', title: '배송 불가 지역으로 조회돼요', detail: '▶ 구매하신 상품만 후기 작성이 가능합니다', showDetail: false },
	            { id: 15, category: '회원', title: '회원 탈퇴를 하고 싶어요', detail: '▶ 구매하신 상품만 후기 작성이 가능합니다', showDetail: false }
			]
		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "customerService.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
					}
				});
			},
			/* 선택한 메뉴에 따른 항목 업데이트 함수 */
			updateContent : function(menu) {
				this.selectedMenu = menu;
				this.selectedMenuItem = menu;
			},
			/* 질문 토글에 기능  */
			toggleDetail: function(index) {
	            this.faqs[index].showDetail = !this.faqs[index].showDetail;
	            this.faqs.forEach((faq, i) => {
	                if(i !== index) {
	                    faq.showDetail = false;
	                }
	            });
	        }
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>