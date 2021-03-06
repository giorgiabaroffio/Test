
	function getURLParameter(name) {
    	return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
	}

	var neigh_average = 140;	  
	var json = JSON.parse(getURLParameter('var2'));
	
	var dataSerie0 = [];
	var dataSerie1 = [];
	var dataSerie2 = [];
	var dataSerie3 = [];
	var init_sum = 0;
	var init_count = 0;
	
	
	for(var i=0;i<json.length;i++){
		var obj = json[i];
		for(var key in obj){
			if(key=='timestamp'){
			   t = obj[key];
			}
			else{
			   q = obj[key];
			   init_sum = init_sum + q;
			   init_count = init_count + 1;
			}
		}
		dataSerie0.push([Date.parse(t),q]);
		dataSerie1.push([Date.parse(t),1]);
		dataSerie2.push([Date.parse(t),2]);
		dataSerie3.push([Date.parse(t),3]);
	}

	var init_avg = Math.floor(init_sum/init_count);

	var categoryImgs = ["ChartStyle/images/clock.png","ChartStyle/images/man.png","ChartStyle/images/woman.png","ChartStyle/images/son.png"];
		var charts;
		var avg = 0.5;

         $(function() {
			charts = new Highcharts.StockChart(
				{
					chart: {
						type: 'line',
						renderTo: 'container',
						zoomType: 'x'
					},
					title: {
						text: ''
					},
					rangeSelector: {
						enabled : false
					},
					xAxis: {
						events: {
							setExtremes: function (e) {
								setExtremesHandler(e,updateLines);
							}
						}
					},
					scrollbar: {
                        enabled: false,
                        liveRedraw: false
                    },
					exporting: {
						enabled: false
					},
					yAxis: [
					{
						min: 0,
						height: 150,
						title: {
							text: 'Water Consumption'
						},
						
						plotLines : [{
								
								value : 4,
								color : 'green',
								dashStyle : 'shortdash',
								width : 4,
								label : {
									text : 'Neighborhood average',
									style: {
										color: 'green',
										fontWeight: 'bold'
									}
								},
								zIndex: 2
							}, 
							{
								id: 'Average',
								value : init_avg,
								color : 'red',
								dashStyle : 'shortdash',
								width : 4,
								label : {
									text : 'Your average',
									style: {
										color: 'red',
										fontWeight: 'bold'
									}
								},
								zIndex: 3
							}],
						
						
						plotBands: {
							label: { 
								text: 'block rates',
								
							},
							color: 'orange', // Color value
							from: '0', // Start of the plot band
							to: '50', // End of the plot band
							zIndex: 1
						}
						
					},
					{
						title: {
							text: 'Family Consumption'
						},
						gridLineWidth: 0,
						labels:
						{
						  style: {
										color: 'white',
									}
						},
						min : 0.5,
						max : 3.5,
						top: 150,
						bottom: 200,
						height: 150,
						offset: 0,
						plotBands: [{
							/*
							label: { 
								text: 'Dad', 
							},
							*/
							color: '#E5E5E1',
							from: '0.6',
							to: '1.4'
						  },
						  {
							/*
							label: { 
								text: 'Mum', 
							},
							*/
							color: '#E5E5E1',
							from: '1.6',
							to: '2.4'
						  },
						  {
							/*
							label: { 
								text: 'Son', 
							},
							*/
							color: '#E5E5E1',
							from: '2.6',
							to: '3.4'
						  }
						  ],
						labels: {
							align: 'left',
							x: 5,
							useHTML: true,  
							/*							
							formatter: function () {
								alert(this.value);
								return '<div class="myToolTip" title="Hello ' 
							   + this.value +'">' +  categoryImgs[this.value] + '</div>';
							}
							*/
							formatter: function(){
								return '<img src="'+categoryImgs[this.value]+'"></img>';                        
							}
						}
					}],
					navigator: {
						series: {
							data: dataSerie0
						},
						adaptToUpdatedData: false,
					},
					
					series: [{
						name: 'Consumption',
						type: 'column',
						//data: [['1147651200000',49.9], ['1149120000000', 71.5], ['1151884800000', 106.4], ['1154390400000',129.2], ['1157068800000', 144.0], ['1159747200000', 176.0], ['1162339200000', 135.6], ['1164931200000', 148.5], ['1167782400000', 216.4], ['1170288000000',194.1], ['1172707200000',95.6], ['1175472000000',54.4]],
						//data: [49.9,71.5,106.4,129.2,144.0,176.0,135.6,148.5,216.4,194.1,95.6,54.4],
						data: dataSerie0,
						//dataGrouping: { approximation: "sum",	enabled: true, forced: true, units: [['day',[1]]]},
						showInLegend: false,
						color: '#7CB5EC',
						zIndex: 4

					},{
						name: 'Dad',
						yAxis: 1,
						//data: [	0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 0.0],
						//data: [	null, 1.0, null, null, null, null, 1.0, 1.0, null, null, 1.0, null],
						data: dataSerie1,
						//dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['day',[1]]]},
						showInLegend: false,
						marker : {
							enabled : true,
							symbol: 'url(ChartStyle/images/tap-water-icon.png)'
						},
						lineWidth : 0,
						enableMouseTracking: false
					}, {
						name: 'Mum',
						yAxis: 1,
						//data: [0.0, 2.0, 2.0, 0.0, 0.0, 2.0, 0.0, 2.0, 0.0, 0.0, 0.0, 2.0],
						//data: [null, 2.0, 2.0, null, null, 2.0, null, 2.0, null, null, null, 2.0],
						data: dataSerie2,
						//dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['day',[1]]]},
						showInLegend: false,
						marker : {
							enabled : true,
							symbol: 'url(ChartStyle/images/tap-water-icon.png)'
						},
						lineWidth : 0,
						enableMouseTracking: false
					}, {
						name: 'Son',
						yAxis: 1,
						//data: [3.0, 0.0, 0.0, 3.0, 3.0, 3.0, 0.0, 0.0, 3.0, 0.0, 0.0, 3.0],
						//data: [3.0, null, null, 3.0, 3.0, 3.0, null, null, 3.0, null, null, 3.0],
						data: dataSerie3,
						//dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['day',[1]]]},
						showInLegend: false,
						marker : {
							enabled : true,
							symbol: 'url(ChartStyle/images/tap-water-icon.png)'
						},
						lineWidth : 0,
						enableMouseTracking: false
					}]
					
				},function opt(charts){
					charts.yAxis[0].plotLinesAndBands[0].label.toFront();
					charts.yAxis[0].plotLinesAndBands[1].label.toFront();
					charts.yAxis[0].plotLinesAndBands[2].label.toFront();
			});
    });
		
		function setExtremesHandler(e, callback){
			//console.log(Highcharts.dateFormat(null, e.min));
			//console.log(Highcharts.dateFormat(null, e.max));
			var data = charts.series[0].data;
			var sum = 0;
			var count = 0;
			for(var i=0;i<data.length;i++){
				if(data[i].x - e.min >= 0&&e.max - data[i].x >= 0){
					sum = sum + data[i].y;
					count = count + 1;
				}
			}
			if(count!=0){
				var avg = Math.floor(sum/count);
				charts.yAxis[0].removePlotLine('Average');
				callback(avg);

			}
			
			
		}
		
		function updateLines(avg) {
			// Callback, update lines
			charts.yAxis[0].addPlotLine({
                id: 'Average',
				value : avg,
				color : 'red',
				dashStyle : 'shortdash',
				width : 4,
				label : {
					text : 'Your average',
					style: {
						color: 'red',
						fontWeight: 'bold'
					}
				},
				zIndex: 3
            });
		}

		function dayRange() {
			charts.series[0].update({ dataGrouping: { approximation: "sum",	enabled: true, forced: true, units: [['day',[1]]]}});
			charts.series[1].update({ dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['day',[1]]]}});
			charts.series[2].update({ dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['day',[1]]]}});
			charts.series[3].update({ dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['day',[1]]]}});
		}
		function weekRange() {
			charts.series[0].update({ dataGrouping: { approximation: "sum",	enabled: true, forced: true, units: [['week',[1]]]}});
			charts.series[1].update({ dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['week',[1]]]}});
			charts.series[2].update({ dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['week',[1]]]}});
			charts.series[3].update({ dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['week',[1]]]}});
			//alert(charts.xAxis[0].getExtremes().min);
			//alert(charts.xAxis[0].getExtremes().max);
		}
		function monthRange(){
			charts.series[0].update({ dataGrouping: { approximation: "sum",	enabled: true, forced: true, units: [['month',[1]]] } });
			charts.series[1].update({ dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['month',[1]]]}});
			charts.series[2].update({ dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['month',[1]]]}});
			charts.series[3].update({ dataGrouping: { approximation: "average",	enabled: true, forced: true, units: [['month',[1]]]}});
		}


