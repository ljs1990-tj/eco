<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<meta name="description" content="">
  	<meta name="author" content="">
  	<title>마이페이지</title>
  	  	<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
  	
  	<!-- Custom styles for this template -->
  	<link href="<%=request.getContextPath() %>/src/webapp/css/shop-homepage.css" rel="stylesheet">
  	<link href="<%=request.getContextPath() %>/src/webapp/css/common.css" rel="stylesheet">
  
  <style type="text/css">
 	a:link { color: red; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: blue; text-decoration: none;}
 
 #CartImage {
	width:200px; height:200px;
 }
 
 #CartTitle {
 	position:absolute;
 	margin-left : 26%;
 }
 
</style>

</head>
<body>
	<jsp:include page="/src/webapp/layout/nav.jsp"></jsp:include>
	
	<!-- Page Content -->
  	<div class="container top-container">
    	<div class="row">
      		<jsp:include page="/src/webapp/myPage.jsp"></jsp:include>
      		
      		<div class="col-lg-9 main-col-lg-9">
        		<h2 class="main-title">장바구니</h2>
        		<!-- 상품 -->
			    <div class = "CartList">
			    	<!-- 장바구니리스트 -->
			    </div>
			    <!-- 상품end -->
			    <div class = "panel-footer"></div>
		    </div>
		    <!-- /.col-lg-9 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	
	<script>
	$(document).ready(function() {
		var userID = "${userID}";
		var CartList = $(".CartList");
		var CheckedArray = new Array();
		var totalPrice;
		
		showList(1);
		
		function showList(page) {
	        CartService.getList({userID : userID, page : page || 1}, function(CartCount, list) {
				
				if(page == -1) {
					pageNum = Math.ceil(CartCount/6.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				
				if(list == null || list.length == 0) {
					CartList.html("");
					
					return;
				}
				
	            str += "<span id = 'CartTitle'>상품이름&nbsp&nbsp&nbsp제조사&nbsp&nbsp&nbsp가격&nbsp&nbsp&nbsp수량</span><br><br><br><form>"
				
				for(var i=0, len = list.length || 0; i<len; i++) {
					str += "<div>";
					 str += "<div id = 'data' data-no = '" + list[i].item_no + "' data-price = '" + list[i].price + "' data-quantity = '" + list[i].quantity + "'><input type = 'checkbox' name = 'CartSelect' class = 'CartSelect' value = '" + list[i].item_no + "'><a href = '/ProductDetail/" + list[i].item_no + "'>&nbsp&nbsp&nbsp<img id = 'CartImage' src = '" + list[i].image_url + "'/></a>&nbsp&nbsp&nbsp" 
				                str += list[i].item_name + "&nbsp&nbsp&nbsp" + list[i].manufacturer + "&nbsp&nbsp&nbsp" + list[i].price * list[i].quantity + "&nbsp&nbsp&nbsp" + list[i].quantity;
				                str += "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button id = 'removeCart' type = 'button' value = '" + list[i].item_no + "'>삭제</button></div>";
				                str += "</br></div>";
				}
				
				str += "<br><br><br><br><button id = 'orderBtn' type = 'button'>주문하기</button>";
				
				CartList.html(str);
	            showReplyPage(CartCount);
			});
		}
		
		var pageNum = 1;
    	var CartPageFooter = $(".panel-footer");
    	
    	function showReplyPage(CartCount) {
    		
    		var endNum = Math.ceil(pageNum / 6.0) * 6;
    		var startNum = endNum - 5;
    		
    		var prev = startNum != 1;
    		var next = false;
    		
    		if(endNum * 6 >= CartCount) {
    			endNum = Math.ceil(CartCount/6.0);
    		}
    		
    		if(endNum * 6 < CartCount) {
    			next = true;
    		}
    		
    		var str = "<br><br><br><ul class = 'pagination pull-right'>";
    		
    		if(prev) {
    			
    			str += "<li class = 'page-item'><a class = 'page-link' href = '" + (startNum -1) + "'>Previous</a></li>";
    		}
    		
    		for(var i = startNum; i<=endNum; i++) {
    			
    			var active = pageNum == i? "active" : "";
    			
    			str += "<li class = 'page-item " + active + "'><a class = 'page-link' href = '" + i + "'>" + i + "</a></li>";
    		}
    		
    		if(next) {
    			
    			str += "<li class = 'page-item'><a class = 'page-link' href = '" + (endNum + 1) + "'>Next</a></li>";
    		}
    		
    		str += "</ul></div>";
    		
    		CartPageFooter.html(str);
    	}
    	
    	CartPageFooter.on("click", "li a", function(e) {
    		
    		e.preventDefault();
    		
    		var targetPageNum = $(this).attr("href");
    		
    		pageNum = targetPageNum;
    		
    		showList(pageNum);
    	});
    	
    	$(document).on("click", "#orderBtn", function(e) {
    		
    		var CheckedData = {
    				reqUrl : window.location.href,
    				products : CheckedArray,
    				totalPrice : totalPrice
    			};
    		
    		console.log(CheckedData);

    		SendOrderData(CheckedData);
    	});

    	$(document).on("click", "#removeCart", function(e) {
			
			var param = {
				
				product_code : $(this).attr('value'),
				customer_code : customer_code
			};
			
			CartService.remove(param, function(result) {
				
				alert(result);
				showList(pageNum);
			});
    	});
    	
    	$(document).on("click", "input:checkbox" ,function() {
    		
    		if($(this).prop('checked')) {
    			
    			var data = $(this).parent();
    			
    			var param = {
    					ITEM_NO: data.attr('data-ITEM_NO'),
    					PRICE: data.attr('data-PRICE'),
    					CNT: data.attr('data-CNT')
    	    		};
    			
    			CheckedArray.push(param);
    		} else {
    			
				var data = $(this).parent();
    			
    			var param = {
    					ITEM_NO: data.attr('data-ITEM_NO'),
    		            PRICE: data.attr('data-PRICE'),
    		            CNT: data.attr('data-CNT') 
    	    		};
    			
    			const idx = CheckedArray.indexOf(param);
    			CheckedArray.splice(idx, 1);
    		}
    		
    		totalPrice = 0;
    		
    		for(var i=0; i<CheckedArray.length; i++) {
    			
    			totalPrice += parseInt(Object.values(CheckedArray[i])[1] * Object.values(CheckedArray[i])[2]);
    			
    		}
    		
    	})
});
	</script>
  
	<jsp:include page="/src/webapp/layout/footer.jsp"></jsp:include>
	
	var CartService = (function() {
	    
	    function getList(param, callback, error) {
	        
	        var USER_ID = param.USER_ID;
	        var page = param.page || 1;
	        
	        $.getJSON("/myPage/cart/" + USER_ID + "/" + page + ".json", 
	                function(data) {
	                if(callback) {
	                    callback(data.replyCount, data.list);
	                }
	        }).fail(function(xhr, status, err) {
	            if(error) {
	                error();
	            }
	        });
	    }
		
		/*function SendData(CheckedData, callback, error) {

			$.ajax({
				
				type : 'POST',
				url : '/order/delivery',
				data :JSON.stringify(CheckedData),
				contentType : "application/json;charset=UTF-8",
				success : function(result, status, xhr) {
					var resultJson = JSON.parse(result);
					if (resultJson.result==0) {
						alert("로그인이 필요합니다.");
						location.href = "/login";
					}
					else if(resultJson.result==2) {
						alert("주문 과정 중 오류가 발생했습니다.");
						location.href = "/order/orderError";
					}
					else {
						var url="/order/delivery/form?orderCode=" + resultJson.orderCode;
						alert("배송지 입력 페이지로 이동합니다.");
						location.href = url;
					}
					//if(callback) {
						//callback(result);
					//}
				},
				error : function(xhr, status, er) {
					if(error) {
						error(er);
					}
				}
			})
		}*/
		
		function add(cartItem, callback, error) { 
	        
	        $.ajax({
	            type: 'POST',
	            url: '/myPage/cart/new',
	            data: JSON.stringify(cartItem), 
	            contentType: "application/json; charset=utf-8",
	            success: function(result, status, xhr) {
	                if(callback) {
	                    callback(result);
	                }
	            },
	            error: function(xhr, status, er) {
	                if(error) {
	                    error(er);
	                }
	            }
	        })
	    }
	    
		 function remove(param, callback, error) {
	        
	        var USER_ID = param.USER_ID; 
	        var ITEM_NO = param.ITEM_NO; 
	        
	        $.ajax({
	            type: 'delete',
	            url: '/myPage/cart/delete/' + USER_ID + "/" + ITEM_NO, 
	            success: function(deleteResult, status, xhr) {
	                if(callback) {
	                    callback(deleteResult);
	                }
	            },
	            error: function(xhr, status, er) {
	                if(error) {
	                    error(er);
	                }
	            }
	        })
	    }
	    
	    return {
	        getList: getList,
	        add: add,
	        remove: remove,
			//SendData : SendData
		};
	})();
</body>
</html>