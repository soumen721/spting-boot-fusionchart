<html>
<head>
<title>My first chart using FusionCharts Suite XT</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/fusioncharts/js/fusioncharts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/fusioncharts/js/themes/fusioncharts.theme.fint.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>var myContextPath = "${pageContext.request.contextPath}"</script>

<script type="text/javascript">
	var returnedJson;

		$( document ).ready(function() {
			$.ajax({
				url : "http://localhost:9090/spring-boot/productslist/"+$("#myselect").val()
			}).then(function(data) {
				//alert("IN CallL:" + JSON.stringify(data, null, 4));
				returnedJson = data;
				
				returnedJson=JSON.parse(returnedJson);
				
				var revenueChart = new FusionCharts({
					"type" : "column3d",
					"renderAt" : "chartContainer",
					"width" : "900",
					"height" : "350",
					"dataFormat" : "json",
					"dataSource" : {
						"chart" : {
							"caption": "Product Details Pricing Report",
					        "palette": "2",
					        "animation": "1",
					        "formatnumberscale": "1",
					        "decimals": "0",
					        "numberprefix": "$",
					        "pieslicedepth": "30",
					        "startingangle": "125",
					        "showborder": "0",
					        "xAxisName" : "Product Name",
							"yAxisName" : "Product Price",
							"plotTooltext": "Product Name : $label<br>Product Price : $datavalue"
							//"theme" : "fint"
						},
						"data" : returnedJson
					}
				});
				
				revenueChart.render();
			});
		});
	
	function callChart(){
		returnedJson=JSON.parse(returnedJson);
		
		var revenueChart = new FusionCharts({
			"type" : "column3d",
			"renderAt" : "chartContainer",
			"width" : auto,
			"height" : "350",
			"dataFormat" : "json",
			"dataSource" : {
				"chart" : {
					"caption": "Product Details Pricing Report",
			        "palette": "2",
			        "animation": "1",
			        "formatnumberscale": "1",
			        "decimals": "0",
			        "numberprefix": "$",
			        "pieslicedepth": "30",
			        "startingangle": "125",
			        "showborder": "0",
			        "xAxisName" : "Product Name",
					"yAxisName" : "Product Price",
					"plotTooltext": "Product Name : $label<br>Product Price : $datavalue"
					//"theme" : "fint"
				},
				"data" : returnedJson
			}
		});
		
		revenueChart.render();
	};
	
</script>
</head>
<body >
	<div id="chartContainer" style="cursor: pointer;">Click Here TO View Report</div>
</body>
</html>