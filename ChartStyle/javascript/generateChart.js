
	  function getURLParameter(name) {
    	  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
	  }

	  var average = JSON.parse(getURLParameter('var1'));
	  var neigh_average = 140;
	  
	  var json = JSON.parse(getURLParameter('var3'));

      google.load("visualization", "1", {packages:["corechart"]});
	  google.setOnLoadCallback(drawChart);
	  function drawChart() {
	  		
		  var data = new google.visualization.DataTable();
		  data.addColumn('string', 'Years');
		  data.addColumn('number', 'Consumption');
		  data.addColumn('number', 'Average');
		  data.addColumn('number', 'Neighborhood Average');
		  var t,q;
		  data.addRow(['', 0, average, neigh_average]);
		  for(var i=0;i<json.length;i++){
		        var obj = json[i];
		        for(var key in obj){
				  	if(key=='timestamp'){
				       t = obj[key];
				    }
				    else{
				       q = obj[key];
				    }
			  	}
			  	data.addRow([t, q, average, neigh_average]);
		  }
		  data.addRow(['', 0, average, neigh_average]);
		
	  	  var options = {
    		title : 'Consumption Chart',
    		vAxis: {title: "Consumption"},
    		hAxis: {title: "Timestamp"},
    		seriesType: "bars",
    		series: {1: {type: "line"},
    				 2: {type: "line"}}
 		  };
	
	  	  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	  	  chart.draw(data, options);
	}
/*	
	  google.load("visualization", "1", {packages:["corechart"]});
	  google.setOnLoadCallback(drawTimeline);
	  function drawTimeline() {
	  		
		  var data = new google.visualization.DataTable();
		  data.addColumn('string', 'Years');
		  data.addColumn('number', 'Consumption');

		  var t,q;
		  data.addRow(['', 0]);
		  for(var i=0;i<json.length;i++){
		        var obj = json[i];
		        for(var key in obj){
				  	if(key=='timestamp'){
				       t = obj[key];
				    }
				    else{
				       q = obj[key];
				    }
			  	}
			  	data.addRow(['', 4]);
		  }
		  data.addRow(['', 0]);
		
	  	  var options = {
    		title : '',
    		vAxis: {title: "Husband", gridlines: {color: 'transparent'}, maxValue: 10, textPosition: 'none'},
    		hAxis: {title: ""},
    		seriesType: "bars",
    		legend: {position: 'none'},
    		lineWidth: 0
 		  };
	
	  	  var tl = new google.visualization.ComboChart(document.getElementById('timeline'));
	  	  tl.draw(data, options);
	}

*/
/*
	google.setOnLoadCallback(drawTimeline);
	
	function drawTimeline() {
	  var container = document.getElementById('timeline');
	  var tl = new google.visualization.Timeline(container);
	  var dataTable = new google.visualization.DataTable();
	  dataTable.addColumn({ type: 'string', id: 'Family Member' });
	  dataTable.addColumn({ type: 'string', id: 'Device' });
	  dataTable.addColumn({ type: 'date', id: 'Start' });
	  dataTable.addColumn({ type: 'date', id: 'End' });
	  dataTable.addRows([
	    [ 'Husband', 'Shower',       new Date(2014, 11, 13),  new Date(2014, 11, 14) ],
	    [ 'Wife', 'Tap',    new Date(2014, 11, 15),  new Date(2014, 11, 16) ],
	    [ 'Wife', 'Shower',    new Date(2014, 11, 16),  new Date(2014, 11, 17) ],
	    [ 'Husband', 'Shower',       new Date(2014, 11, 16),  new Date(2014, 11, 17) ]]);
	  var options = {
	    //timeline: { colorByRowLabel: true }
        colors: ['#2E4272', '#255C69', '#255C69', '#255C69'],
	  };

	  

  	  tl.draw(dataTable, options);
	}
*/
