<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	
	<title>상품 상세 페이지</title>
</head>
<style>
	body {
		font-family: 'Arial', sans-serif;
		margin: 0;
		padding: 0;
		background: #f4f4f4;
	}
	
	.container {
		display: flex;
		width: 80%;
		max-width: 1200px;
		margin: 40px auto;
		background: #fff;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	
	.left-panel {
		width: 60%;
		padding: 20px;
	}
	
	.right-panel {
		width: 40%;
		border-left: 1px solid #eaeaea;
		padding: 20px;
	}
	
	.product-images {
		display: flex;
		margin-bottom: 20px;
	}
	
	.product-images img {
		width: 100px;
		height: 100px;
		margin-right: 10px;
		object-fit: cover;
	}
	
	.product-title {
		font-size: 24px;
		margin-bottom: 10px;
	}
	
	.product-price {
		font-size: 20px;
		color: #e44d26;
		margin-bottom: 10px;
	}
	
	.product-details {
		margin-bottom: 20px;
	}
	
	.product-details h3 {
		margin: 0;
	}
	
	.buy-options {
		display: flex;
		align-items: center;
	}
	
	.buy-options select {
		margin-right: 10px;
	}
	
	.buy-options input {
		width: 50px;
		margin-right: 10px;
	}
	
	.buy-options button {
		background: #5cb85c;
		color: white;
		border: none;
		padding: 10px 20px;
		cursor: pointer;
	}
	
	.buy-options button:hover {
		opacity: 0.8;
	}
	
	.favorite {
		float: right;
		cursor: pointer;
	}
</style>
<body>
	<div id="app">
		<div class="container">
		    <div class="left-panel">
		        <div class="product-images">
		        <template v-for="item in fileList">
			        <img :src="item.filePath+item.fileName" alt="GAP 천혜향 주요 이미지">
		            </template>
		            <div>
		            <template v-for="item in detailFileList">
			        <img :src="item.filePath+item.fileName" alt="GAP 천혜향 주요 이미지">
		            </template>
		        </div>
		        </div>
		    </div>
		    
		    <div class="right-panel">
		        <div class="product-title">
		           {{info.itemName}}
		            <span class="favorite">♥</span>
		        </div>
		        <div class="product-price">₩{{info.price}}</div>
		        
		        <!-- 제품 상세 정보 -->
		        <div class="product-details">
		            <h3>제품 상세</h3>
		            <!-- 제품 상세 정보 임의로 넣은 것이므로 수정 필요 -->
		            <p v-html="info.contents">{{info.contents}}</p>
		            <p>배송 방식: {{info.transInfo}}</p>
		        </div>
		        
		        <!-- 구매 옵션 -->
		        <div class="buy-options">
		            <label for="quantity">수량</label>
		            <select name="quantity" id="quantity">
		                <option value="1">1</option>
		            </select>
		            <button>장바구니</button>
		            <button>구매하기</button>
		        </div>
		      
		    </div>
		    
		</div>
		
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	itemNo: "${map.itemNo}",
    	info: {},
    	fileList :[],
    	detailFileList :[]
    }
    , methods: {
    	fnView: function() {
            var self = this;
            var nparmap = {
            		itemNo: self.itemNo
            };
            $.ajax({
                url:"AdminProductView.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	console.log(data.filelist);
                	self.info = data.item;
                	var ContentsCnt = 0;
                	var DetailCnt = 0;
                	for(var i =0 ; i<data.filelist.length ; i++){
                		if(data.filelist[i].kind == "2"){
                			self.fileList[ContentsCnt] = data.filelist[i];
                			ContentsCnt++;
                		}
                	
                		if(data.filelist[i].kind == "3"){
                			self.detailFileList[DetailCnt] = data.filelist[i];
                			DetailCnt++;
                		}
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