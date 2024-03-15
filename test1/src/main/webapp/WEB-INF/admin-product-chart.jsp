<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
	<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div id="chart">
        <apexchart type="bar" height="350" :options="chartOptions" :series="series"></apexchart>
        </div>
	</div>
</body>
</html>

<script type="text/javascript">
var app = new Vue({
	el: '#app',
    components: {
      apexchart: VueApexCharts,
    },
    data: {
      
      series: [],
      chartOptions: {
        chart: {
          type: 'bar',
          height: 350
        },
        plotOptions: {
          bar: {
            horizontal: false,
            columnWidth: '55%',
            endingShape: 'rounded'
          },
        },
        dataLabels: {
          enabled: false
        },
        stroke: {
          show: true,
          width: 2,
          colors: ['transparent']
        },
        xaxis: {
        	categories: ["1","2","3","4","5","6","7","8","9","10","11","12"],
        },
        yaxis: {
          title: {
            text: '(판매 수량)'
          }
        },
        fill: {
          opacity: 1
        },
        tooltip: {
          y: {
            formatter: function (val) {
            	
              return "&#8361;" + val.toLocaleString('ko-KR') + "원"
            }
          }
        }
      },
      list : []
      
    }
    
    ,methods: {
    	fnList: function() {
            var self = this;
            var nparmap = {
            			
            };
            $.ajax({
                url:"AdminProductChart.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	self.list = data.ProductList;
                	console.log(data);
                	var localList = [];
                	var veganList = [];
                	var orgList =[];
                	var glutenList =[];
                	for(var i=0; i<data.ProductList.length; i++){
                		if(data.ProductList[i].code == "local"){
                			localList.push(data.ProductList[i].totalPay);
                		}if(data.ProductList[i].code == "vegan") {
                			veganList.push(data.ProductList[i].totalPay);
                		}if(data.ProductList[i].code == "org") {
                			orgList.push(data.ProductList[i].totalPay);
                		}if(data.ProductList[i].code == "gluten") {
                			glutenList.push(data.ProductList[i].totalPay);
                		}
                		
                	}
                	
                	
                	
                	
                	
              
                	self.series.push({
                        name: "로컬푸드",
                        data: localList
                    });
                	self.series.push({
                        name: "비건푸드",
                        data: veganList
                    });
                	self.series.push({
                        name: "유기농푸드",
                        data: orgList
                    });
                	self.series.push({
                        name: "글루텐프리",
                        data: glutenList
                    });
                	
                }
            });
        },
        
        fnmmmmmm : function(){
        	
        }
        
    	
    	
    	
    }
    , created: function () {
    	var self = this;
    	self.fnList();
    	
    }
  })
</script>