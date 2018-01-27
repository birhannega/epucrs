<!DOCTYPE html>
<html>
<head>
<title>jQuery Bar Chart</title>
 
<script src="resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<script src="resources/js/jquery.canvasjs.min.js.js" type="text/javascript"></script>

<script type="text/javascript">
window.onload = function() {
	$("#chartContainer").CanvasJSChart({ 
		title: { 
			text: "Number of students 2017/18" 
		}, 
		axisY: { 
			title: "total number of students " 
		}, 
		data: [ 
		{ 
			type: "bar", 
			toolTipContent: "{label}: no. of students {y}",
			dataPoints: [ 
				{ label: "Advanced Degree",             y: 198  }, 
				{ label: "Regular diploma",            y: 250}, 
				{ label: "police medical",    y: 248  }, 
				{ label: "Chevron",           y: 270}, 
				{ label: "GDPR",           y: 290}, 
				{ label: "RDR",             y: 320}, 
				{ label: "GDPN", y: 410  }, 
				{ label: "PMPTIR",           y: 464}, 
				{ label: "PGDR", y: 492  }, 
				{ label: "SDPMR",       y: 502} 
			] 
		} 
		] 
	});   
}
</script>
</head>
<body>
<div id="chartContainer" style="width: 50%; height: 300px"></div>
</body>
</html>