<html>
  <head>     
    <title>My First chart using FusionCharts - JSON data URL</title>     
    <script type="text/javascript" src="../../js/FusionCharts.js"></script>
  </head>   
  <body>     
    <div id="chartContainer1">FusionCharts will load here!</div>          
    <script type="text/javascript">     

      var myChart = new FusionCharts( "../../Charts/FCF_Column3D.swf", 
                                      "myChartId", "400", "300", "0", "0" );
      myChart.setJSONUrl("data.json");
      myChart.render("chartContainer1");
      
       
    </script>        
  </body> 
</html>