function newUserCnt(){
	$.ajax({
		async: false,
		url: "/admin/main/newUserCnt",
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			$("#newUserCnt").html(number_format(data.cnt) + " 명");
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function accountCheckCnt(){
	$.ajax({
		async: false,
		url: "/admin/main/accountCheckCnt",
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			$("#accountCheckCnt").html(number_format(data.cnt) + " 건");
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function orderCheckCnt(){
	$.ajax({
		async: false,
		url: "/admin/main/orderCheckCnt",
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			$("#orderCheckCnt").html(number_format(data.cnt) + " 개");
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function sellAmountSum(){
	$.ajax({
		async: false,
		url: "/admin/main/sellAmountSum",
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			$("#sellAmountSum").html(number_format(data.cnt) + " 원");
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function dailySellAmount(){
	$.ajax({
		async: false,
		url: "/admin/main/dailySellAmount",
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			var dateList = [];
			var amountList = [];
			$.each(data, function(index, item){
				$.each(item, function(index, jsonData){
					dateList.push(jsonData.orderDate);
					amountList.push(jsonData.amount);
				});
			});
			
			chart(dateList, amountList);
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function sellAmountPercentOfCategory() {
	var colorList = ['bg-warning', 'bg-success', 'bg-info', 'bg-secondary', 'bg-danger', 'bg-primary'];
	
	$.ajax({
		async: false,
		url: "/admin/main/sellAmountPercentOfCategory",
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			var divHtml = "";
			
			$.each(data, function(index, item){
				$.each(item, function(index, jsonData){
					divHtml += `<div class="mb-4">`;
					divHtml += `	<div class="small text-gray-500">`;
					divHtml += `		` + jsonData.categoryNm;
					divHtml += `		<div class="small float-right">`;
					divHtml += `			<b>` + jsonData.percent + `%</b>&nbsp; &nbsp;`;
					divHtml += `		</div>`;
					divHtml += `	</div>`;
					divHtml += `	<div class="progress" style="height: 11px;">`;
					divHtml += `		<div class="progress-bar ` + colorList[index] + `" role="progressbar" style="width: ` + jsonData.percent + `%" aria-valuenow="` + jsonData.percent + `" aria-valuemin="0" aria-valuemax="100"></div>`;
					divHtml += `	</div>`;
					divHtml += `</div>`;
				});
			});
			
			$("#divCategoryPercent").html(divHtml);
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

/* CHART 기본 제공 스크립트 : 홈페이지에 맞게 수정함 */

Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function chart(dateList, amountList){
	var ctx = document.getElementById("myAreaChart");
	var myLineChart = new Chart(
		ctx, {
			type : 'line',
			data : {
				labels : dateList,
				datasets : [ {
					label : "금액",
					lineTension : 0.3,
					backgroundColor : "rgba(78, 115, 223, 0.5)",
					borderColor : "rgba(78, 115, 223, 1)",
					pointRadius : 3,
					pointBackgroundColor : "rgba(78, 115, 223, 1)",
					pointBorderColor : "rgba(78, 115, 223, 1)",
					pointHoverRadius : 3,
					pointHoverBackgroundColor : "rgba(78, 115, 223, 1)",
					pointHoverBorderColor : "rgba(78, 115, 223, 1)",
					pointHitRadius : 10,
					pointBorderWidth : 2,
					data : amountList,
				} ],
			},
			options : {
				maintainAspectRatio : false,
				layout : {
					padding : {
						left : 10,
						right : 25,
						top : 25,
						bottom : 0
					}
				},
				scales : {
					xAxes : [ {
						time : {
							unit : 'date'
						},
						gridLines : {
							display : false,
							drawBorder : false
						},
						ticks : {
							maxTicksLimit : 7
						}
					} ],
					yAxes : [ {
						ticks : {
							maxTicksLimit : 5,
							padding : 10,
							// Include a dollar sign in the ticks
							callback : function(value, index, values) {
								return number_format(value) + '원';
							}
						},
						gridLines : {
							color : "rgb(234, 236, 244)",
							zeroLineColor : "rgb(234, 236, 244)",
							drawBorder : false,
							borderDash : [ 2 ],
							zeroLineBorderDash : [ 2 ]
						}
					} ],
				},
				legend : {
					display : false
				},
				tooltips : {
					backgroundColor : "rgb(255,255,255)",
					bodyFontColor : "#858796",
					titleMarginBottom : 10,
					titleFontColor : '#6e707e',
					titleFontSize : 14,
					borderColor : '#dddfeb',
					borderWidth : 1,
					xPadding : 15,
					yPadding : 15,
					displayColors : false,
					intersect : false,
					mode : 'index',
					caretPadding : 10,
					callbacks : {
						label : function(tooltipItem, chart) {
							var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
							return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + '원';
						}
					}
				}
			}
		});
}