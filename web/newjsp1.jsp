<!DOCTYPE HTML>
<html>
<head>  
  <script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      theme: "light1",    // "light1", "dark1", "dark2"
      title:{
       text: "Changing Theme"
      },
      data: [
      {        
        type: "column",
        dataPoints: [
        
        { x: 10, y: 71 },
        { x: 20, y: 55},
        { x: 30, y: 50 },
        { x: 40, y: 65 },
        { x: 50, y: 95 },
        { x: 60, y: 68 },
        { x: 70, y: 28 },
        { x: 80, y: 34 },
        { x: 90, y: 14}
        ]
      }
      ]
    });

    chart.render();
  }
  </script>
 
  <script src="resources/js/jquery.canvasjs.min.js.js" type="text/javascript"></script>
</head>
<body>
  <div id="chartContainer" style="height: 300px; width: 100%;">
  </div>
</body>
</html>