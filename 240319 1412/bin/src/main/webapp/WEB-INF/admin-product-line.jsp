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
<div id = "app">
	 <div id="chart">
        <apexchart type="line" height="350" :options="chartOptions" :series="series"></apexchart>
      </div>
      </div>
</body>
</html>

<script type="text/javascript">
var app =  new Vue({
    el: '#app',
    components: {
      apexchart: VueApexCharts,
    },
    data: {
      
      series: [{
          name: "Desktops",
          data: [10, 441, 35, 541, 449, 62, 69, 961, 148]
      }],
      chartOptions: {
        chart: {
          height: 350,
          type: 'line',
          zoom: {
            enabled: false
          }
        },
        dataLabels: {
          enabled: false
        },
        stroke: {
          curve: 'straight'
        },
        title: {
          text: 'Product Trends by Month',
          align: 'left'
        },
        grid: {
          row: {
            colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
            opacity: 0.5
          },
        },
        xaxis: {
          categories: ['1','2','3','4','5','6','7','8','9','10',
        	  '11','12','13','14','15','16','17','18','19','20',
        	  '21','22','23','24','25','26','27','28','29','30','31'],
        }
      },
      
      
    },
    
  })
</script>