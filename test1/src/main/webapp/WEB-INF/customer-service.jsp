<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>고객 센터</title>
</head>
<style>
	.container {
		display: flex; /* Flexbox 레이아웃 적용 */
		width: 80%;
		max-width: 1200px;
		margin: 0 auto;
		padding: 20px;
		background: #fff;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	
	.menu-area {
		width: 20%;
		padding: 10px; 
	}
	
	.content-area {
		flex: 1; 
		padding: 10px; 
		background: #ffffff; /* 배경색 */
		border-left: 1px solid #ffffffa2; /* 구분선 */
	}
	
	/* 메뉴 스타일링 */
	.menu-item {
		padding: 8px;
		margin-bottom: 5px;
		cursor: pointer;
		transition: background-color 0.3s;
	}
	
	.menu-item:hover {
		background-color: #f1f1f1;
        color: rgb(0, 138, 57);
	}
	
	p{
		font-size: 14px
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
	}

	td {
        border-top: 1px solid rgb(218, 218, 218);
        border-bottom: 1px solid rgb(218, 218, 218); 
	    padding: 8px; 
	    text-align: left;
        cursor: pointer;
	}
	
	thead {
	    background-color: #fdfcfc; 
	}
	
	tr:hover {
	    background-color: #f3f3f3; 
	}
    
</style>
<body>
	<div id="app">
	    <div class="container">
	        <div class="menu-area">
	            <div class="menu-item" @click="updateContent('faq')">자주하는 질문 ▶</div>
            	<div class="menu-item" @click="updateContent('inquiry')">1:1 문의 ▶</div>
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
				                <th>제목</th>
				            </tr>
				        </thead>
				        <tbody>
				             <template v-for="(faq, index) in faqs" :key="faq.id">
						        <tr @click="toggleDetail(index)">
						            <td>{{ index + 1 }}</td>
						            <td>{{ faq.category }}</td>
						            <td>{{ faq.title }}</td>
						        </tr>
						        <tr v-if="faq.showDetail">
						            <td colspan="3">{{ faq.detail }}</td>
						        </tr>
						    </template>
				        </tbody>
				    </table>
	            </div>
	            <div v-if="selectedMenu === 'inquiry'">
	                <h2>1:1 문의</h2>
	                <p>고객님께서 남겨주신 1:1 문의는 여기에 표기됩니다.</p>
                    <table>
                        <thead>
                            <tr>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>답변상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>제목 영역</td>
                                <td>작성일 영역</td>
                                <td>답변상태 영역</td>
                            </tr>
                        </tbody>
                    </table>
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
			selectedMenu: 'faq',	        
			faqs : [ 
				{ id: 1, category: '주문/결제', title: '결제(환불)는 어떻게 하나요?', detail: '▶ 결제(환불)는 다음과 같이 진행해주시면 됩니다. ~~', showDetail: false },
	            { id: 2, category: '배송', title: '주문한 상품은 언제 배송되나요?', detail: '▶ 주문일로부터 약 1~2일이 소요됩니다', showDetail: false },
	            { id: 3, category: '포장', title: '친환경 박스 회수한다는데 어떻게 요청하나요?', detail: '▶ 친환경 박스에 붙어져있는 스티커만 제거해주시면 됩니다.', showDetail: false },
	            { id: 4, category: '회원', title: '아이디/비밀번호를 잊어버렸어요', detail: '▶ 아이디 찾기 및 비밀번호 찾기 진행해주세요', showDetail: false },
	            { id: 5, category: '상품', title: '친환경/유기농/무기농은 어떻게 다른가요?', detail: '▶ 친환경은 ㅇㅉㄱ ㅈㅉㄱ 유기농 ㅇㅉㄱ 무기농 ㅈㅉㄱ', showDetail: false },
	            { id: 6, category: '취소/교환/환불', title: '교환(반품)진행 시 배송비가 부과되나요?', detail: '▶ 어우 그럼요', showDetail: false },
	            { id: 7, category: '서비스이용', title: '상품후기는 어떻게 작성하나요?', detail: '▶ 구매하신 상품만 후기 작성이 가능합니다', showDetail: false },
			]
		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "test.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
					}
				});
			},
			/* 선택한 메뉴에 따른 항목 업데이트 함수 */
			updateContent : function(menu) {
				this.selectedMenu = menu;
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