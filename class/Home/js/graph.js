$(function () {	
    if($('#monthlysales').length > 0){
        $('#monthlysales').highcharts({
            chart: {
                type: 'bar'
            },
            title: {
                text: 'Monthly sales'
            },
            subtitle: {
                text: 'my job by category'
            },
            xAxis: {
                categories: ['Trapping', 'Barcode', 'Color Sep', 'MC', 'Artwork'],
                title: {
                    text: null
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Quantity ',
                    align: 'high'
                },
                labels: {
                    overflow: 'justify'
                }
            },
            tooltip: {
                valueSuffix: ' item'
            },
            plotOptions: {
                bar: {
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -40,
                y: 100,
                floating: true,
                borderWidth: 1,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor || '#FFFFFF'),
                shadow: true
            },
            credits: {
                enabled: false
            },
            series: [{
                name: 'April 2014',
                data: [50, 75, 38, 14, 90]
            }, {
                name: 'May 2014',
                data: [20, 21, 93, 17, 50]
            }, {
                name: 'June 2014',
                data: [39, 47, 120, 11, 14]
            }]
        });
    }
	
    
    if($('#myperformance').length > 0){
        $('#myperformance').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: 'My performance'
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: 'My performance',
                data: [
                    ['Verified within SLA',   75.0],
                    {
                        name: 'Exceed SLA',
                        y: 25.0,
                        sliced: true,
                        selected: true
                    }
                ]
            }]
        });
    }

    if($('#pendingjob').length > 0){
        $('#pendingjob').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'My pending jobs'
            },
            xAxis: {
                type: 'category',
                labels: {
                    rotation: -45,
                    align: 'right',
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif'
                    }
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Jobs'
                }
            },
            legend: {
                enabled: false
            },
            tooltip: {
                pointFormat: 'Jobs: <b>{point.y:.1f} </b>',
            },
            series: [{
                name: 'Job',
                data: [
                    ['Checking(New case)', 15],
                    ['Checking(Reverted case)', 25],
                    ['Upload to customer', 3]
                ],
                dataLabels: {
                    enabled: true,
                    rotation: -90,
                    color: '#FFFFFF',
                    align: 'right',
                    x: 4,
                    y: 10,
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif',
                        textShadow: '0 0 3px black'
                    }
                }
            }]
        });
    }

	var chart;
	// Build the chart
    if($('#qcpasscategory').length > 0){
        $('#qcpasscategory').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: 'QC pass category'
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: 'QC passes category',
                data: [
                    ['1st time passes',   80],
                    {
                        name: '2nd time passes',
                        y: 14.0,
                        sliced: true,
                        selected: true
                    },
                    {
                        name: '3rd time passes',
                        y: 9.0,
                        sliced: true,
                        selected: true
                    },
                    {
                        name: 'More than 3 times',
                        y: 7.0,
                        sliced: true,
                        selected: true
                    }
                ]
            }]
        });
    }

    if($('#actvsforcst').length > 0){
        $('#actvsforcst').highcharts({
            chart: {
                zoomType: 'xy'
            },
            title: {
                text: 'PAST 6-MONTH ACTUAL VS FORECASTED SALES'
            },
            xAxis: [{
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
            }],
            yAxis: [{ // Primary yAxis
                labels: {
                    format: '${value}',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
                title: {
                    text: 'Actual sales value',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                }
            }, { // Secondary yAxis
                title: {
                    text: 'Forecast sales',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                labels: {
                    format: '${value} ',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                opposite: true
            }],
            tooltip: {
                shared: true
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                x: 120,
                verticalAlign: 'top',
                y: 100,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            series: [{
                name: 'Value',
                type: 'column',
                yAxis: 1,
                data: [45, 80, 106.4, 129.2, 144.0, 176.0],
                tooltip: {
                    valueSuffix: ' '
                }
    
            }, {
                name: 'Forecast',
                type: 'spline',
                data: [50, 100, 80, 65, 75, 175],
                tooltip: {
                    valueSuffix: ' '
                }
            }]
        }); 
    }


    if($('#custorder').length > 0){
        $('#custorder').highcharts({
            chart: {
                type: 'bar'
            },
            title: {
                text: 'Total order'
            },
            subtitle: {
                text: 'Order by category'
            },
            xAxis: {
                categories: ['Trapping', 'Barcode', 'Color Sep', 'MC', 'Artwork'],
                title: {
                    text: null
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Quantity ',
                    align: 'high'
                },
                labels: {
                    overflow: 'justify'
                }
            },
            tooltip: {
                valueSuffix: ' item'
            },
            plotOptions: {
                bar: {
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -40,
                y: 100,
                floating: true,
                borderWidth: 1,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor || '#FFFFFF'),
                shadow: true
            },
            credits: {
                enabled: false
            },
            series: [{
                name: 'April 2014',
                data: [50, 75, 38, 14, 90]
            }, {
                name: 'May 2014',
                data: [20, 21, 93, 17, 50]
            }, {
                name: 'June 2014',
                data: [39, 47, 120, 11, 14]
            }]
        });
    }
    
    if($('#custpendingaction').length > 0){
        $('#custpendingaction').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'Cases'
            },
            subtitle: {
                text: 'Pending on my action'
            },
            xAxis: { 
                categories: [
                    'Trapping',
                    'Barcode',
                    'Color Sep',
                    'MC',
                    'Artwork'
                ]
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Cases'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: "Category",
                data: [1, 0, 5, 1, 1]
            }]
        });
    }
    if($('#custpassorder').length > 0){
     $('#custpassorder').highcharts({
            title: {
                text: 'Pass 12 month order',
                x: -20 //center
            },
            subtitle: {
                text: 'by category',
                x: -20
            },
            xAxis: {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
            },
            yAxis: {
                title: {
                    text: 'Cases'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '°C'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                name: 'Trapping',
                data: [10, 7, 8, 15, 18, 13, 17, 19, 4, 3, 1,4]
            }, {
                name: 'Barcode',
                data: [6, 4, 15, 6, 16, 23, 27, 24, 1, 3, 9, 7]
            }, {
                name: 'Color Sep',
                data: [8, 1, 4, 7, 7, 4, 8, 11, 21, 5, 8,7]
            }, {
                name: 'MC',
                data: [7, 6, 1, 4, 9, 7, 4, 7, 5, 16, 12,11]
            }, {
                name: 'Artwork',
                data: [4, 7, 14,5, 15, 16, 3, 7, 15, 3, 14,7]
            }
            ]
        });
    }

});