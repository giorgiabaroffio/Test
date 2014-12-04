        $(function() {
			goalChart = new Highcharts.Chart(
			{
				chart: {
					type: 'column',
					renderTo: 'goalChartContainer',
					//plotBorderWidth: '3px',
					//plotBorderColor: '#aaaaaa',
					//width: 200

				},
				title: {
					text: '',
				},
				xAxis: {
					categories: ['Next Goal'],
					labels:
					{
					  enabled: false
					}
				},
				legend: {
					enabled: false
				},
				yAxis: {
					title: null,
					min: 0,
					max: 110,
					labels:
					{
					  enabled: false
					},
					tickInterval: 110,
					plotLines: [{
						value : 100,
						color : 'orange',
						dashStyle : 'shortdash',
						width : 4,
						label : {
							text : 'Next Goal: Advanced Saver',
							style: {
								color: 'orange',
								fontWeight: 'bold'
							}
						},
						zIndex: 4
					}, 
					]
				},
				
				exporting: {
					enabled: false
				},
				series: [{
					name: 'Collected credits',
					data: [50.0],
					marker: {
						enabled: false
					},
					pointWidth: 28,
					zIndex: 1
				}]
					
			},function(goalChart){
				goalChart.renderer.image("ChartStyle/images/testtube.png", 0, 0, goalChart.chartWidth, goalChart.chartHeight-10).attr({
				  zIndex: 3
				}).add();
				});
				goalChart.series[0].update({ data: [50.0], marker: {enabled: false}, pointWidth: goalChart.chartWidth});
		});
		