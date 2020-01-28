// ADMIN
function formClear(){
	$("#orderNo").val("");
	$("#productList").val("");
	$("#recipient").val("");
	$("#addr").val("");
	$("#phone").val("");
	$("#paymentNm").val("");
	$("#amount").val("");
	$("#discountAmt").val("");
	$("#resultAmt").val("");
	$("#orderDt").val("");
	$("#deliveryCd").val("");
	
	$("#btnUpd").removeAttr("disabled");
	$("#btnUpd").removeAttr("style");
	$("#btnUpd").removeAttr("onClick");
	
	$("#btnUpd").attr("disabled", "disabled");
	$("#btnUpd").css("opacity","0.3");
}

function formChange(){
	orderView(rowData.orderNo);
	
	$("#btnUpd").removeAttr("disabled");
	$("#btnUpd").removeAttr("style");
	$("#btnUpd").attr("onClick", "orderUpdate();");
}

function orderList(){
	$("#orderTable").DataTable({
		processing: true,
		serverSide: false,
		paging: true,
		pagingType: "simple_numbers",
		order: false,
		ordering: false,
		info: true,
		filter: true,
		language: {
			"zeroRecords": "데이터가 없습니다.",
			"lengthMenu": "_MENU_ 개씩 보기",
			"search": "검색:",
			"info": "_PAGE_ / _PAGES_",
			"infoFiltered": "(전체 _MAX_개의 데이터 중 검색결과)",
			"paginate": {
				"previous": "이전",
				"next": "다음"
			}
		},
		ajax:{
			"url": "/admin/order/list",
			"dataType" : "json"
		},
		columns: [
			{data: "orderNo"},
			{data: "email"},
			{data: "deliveryNm"}
		],
		columnDefs: [
			{"targets":[0], "width": "25%"},
			{"targets":[1], "width": "50%"},
			{"targets":[2], "width": "25%"}
	    ]
	});
}

function orderView(orderNo){
	$.ajax({
		async: false, 
		url: "/admin/order/view/" + orderNo,
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			$.each(data, function(index, item){
				$.each(item, function(index, jsonData){
					$("#orderNo").val(jsonData.orderNo);
					$("#productList").val(jsonData.productList);
					$("#recipient").val(jsonData.recipient);
					$("#addr").val(jsonData.addr);
					$("#phone").val(jsonData.phone);
					$("#paymentNm").val(jsonData.paymentNm);
					$("#amount").val(jsonData.amount);
					$("#discountAmt").val(jsonData.discountAmt);
					$("#resultAmt").val(jsonData.resultAmt);
					$("#orderDate").val(getDateFormat(jsonData.orderDt));
					$("#deliveryCd").val(jsonData.deliveryCd);
				});
			});
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function orderUpdate(){
	var orderForm = $("#orderForm").serialize();
	
	$.ajax({
		url: "/admin/order/update",
		type: "post", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: orderForm,
		dataType: "json",
		success: function(data){
			if(data.result === "success"){
				$("#orderTable").DataTable().ajax.reload();
				alert("정상적으로 변경되었습니다.");
			} else {
				alert("상태변경 중 오류가 발생하였습니다.\n입력한 정보를 다시 확인해 주세요.");
			}
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}


// USER
function orderCartList(){
	$.ajax({
		async: false, 
		url: "/order/cart/list",
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			var cartListHtml = ``;
			var sum = 0;
			
			$.each(data, function(index, item){
				$.each(item, function(index, jsonData){
					cartListHtml += `<tr>`;
					cartListHtml += `	<td style="vertical-align: middle; padding-left: 0px;">`;
					cartListHtml += `		<table>`;
					cartListHtml += `			<tr style="border-top: 2px solid white;">`;
					cartListHtml += `				<td style="width:20%; padding-left:0;">`;
					cartListHtml += `					<img src="` + jsonData.filePath + `" width="80px"/>`;
					cartListHtml += `				</td>`;
					cartListHtml += `				<td style="width:auto; padding-left:0;">`;
					cartListHtml += `					<span style="font-size: 10.5pt; font-weight: 500;">` + jsonData.productNm + `</span>`;
					cartListHtml += `				</td>`;
					cartListHtml += `			</tr>`;
					cartListHtml += `		</table>`;
					cartListHtml += `		<input type="hidden" value="` + jsonData.productId + `" />`;
					cartListHtml += `	</td>`;
					cartListHtml += `	<td style="vertical-align: middle; padding-left:0; padding-right:0;"><h6>` + number_format(jsonData.price) + `원</h6></td>`;
					cartListHtml += `	<td style="vertical-align: middle;"><h5>` + jsonData.cnt + `</h5></td>`;
					cartListHtml += `	<td style="vertical-align: middle; padding-left:0; padding-right:0;"><h5>` + number_format(jsonData.price * jsonData.cnt) + `원</h5></td>`;
					cartListHtml += `</tr>`;
					
					sum += jsonData.price * jsonData.cnt;
				});
			});
			
			var cartListResult = orderCartListResult(sum);
			$("#cartList").html(cartListHtml);
			$("#cartList").append(cartListResult);
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function orderCartListResult(sum){
	if(sum <= 0){
		sum = 0;
		$("#rdCash").attr("checked", "checked");
		$("#rdCard").attr("disabled", "disabled");
	}
	
	var cartListHtml = ``;
	cartListHtml += `<tr>`;
	cartListHtml += `	<td colspan="4" class="text-right">`;
	cartListHtml += `		<div class="mb-3">상품 총 금액 : <span id="totalAmt">` + number_format(sum) + `</span>원</div>`;
	if(sum > 0){
		cartListHtml += `		<div class="mb-3">`;
		cartListHtml += `			<input type="checkbox" id="couponFg" name="couponFg" onClick="applyCouponFg();" class="mb-3"/><label for="couponFg">&nbsp;쿠폰 적용</label>`;
		cartListHtml += `			&nbsp; <input type="text" id="coupon" name="coupon" placeholder="쿠폰번호를 입력하세요." disabled="disabled"/>`;
		cartListHtml += `			<button type="button" id="btnCoupon" onClick="applyCoupon();" disabled="disabled">적용</button>`;
		cartListHtml += `			<br/><span id="discountAmt" style="color: var(--red);"></span>`;
		cartListHtml += `			<input type="hidden" id="discount" value="0원"/>`;
		cartListHtml += `		</div>`;
	}
	cartListHtml += `		<div class="mb-3">`;
	cartListHtml += `			<h4 style="color: var(--blue);">최종 결제 금액 : <span id="resultAmt">` + number_format(sum) + `</span>원</h4>`;
	cartListHtml += `		</div>`;
	cartListHtml += `	</td>`;
	cartListHtml += `</tr>`;
	
	return cartListHtml;
}

function applyCouponFg(){
	if($("#couponFg").is(":checked") == true){
		$("#coupon").removeAttr("disabled");
		$("#btnCoupon").removeAttr("disabled");
	} else {
		$("#coupon").attr("disabled", "disabled");
		$("#btnCoupon").attr("disabled", "disabled");
	}
	
	$("#coupon").val("");
	$("#discountAmt").html("");
	$("#resultAmt").html(number_format($("#totalAmt").text()));
}

function applyCoupon(){
	var couponCode = $("#coupon").val();
	
	$.ajax({
		url: "/order/coupon",
		type: "post", 
		data: {"code" : couponCode},
		dataType: "json",
		success: function(data){
			if(data.data != "fail"){
				var discount = data.data.substring(0, data.data.length-1);
				var totalAmt = $("#totalAmt").text().replace(",", "");
				var resultAmt = $("#resultAmt").text().replace(",", "");
				
				var discountAmt = 0;
				var resultAmt = 0;
				if(data.data.substr(-1) == "%"){
					discountAmt = Math.round(totalAmt * (discount/100));
				} else {
					discountAmt = discount;
				}
				
				resultAmt = totalAmt - discountAmt;
				if(resultAmt <= 0){
					resultAmt = 0;
					discountAmt = totalAmt;
					
					$("#rdCash").attr("checked", "checked");
					$("#rdCard").attr("disabled", "disabled");
				}
				
				$("#discountAmt").html("할인 금액 : " + number_format(discountAmt) + "원");
				$("#resultAmt").html(number_format(resultAmt));
				$("#discount").val(data.data);
			} else {
				alert("쿠폰 코드가 유효하지 않거나 적용 가능한 기간이 아닙니다.");
				$("#discountAmt").html("");
				$("#resultAmt").html(number_format($("#totalAmt").text()));
			}
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function insertOrder(){
	var orderNo = getOrderNo();
	var listCnt = document.getElementsByTagName("table")[0].childNodes[3].childNodes.length;
	var sum = 0;
	
	var result = "";
	
	for(i=0; i<(listCnt-1); i++){
		console.log(document.getElementsByTagName("table")[0].childNodes[3].childNodes[i]);
		var productId = document.getElementsByTagName("table")[0].childNodes[3].childNodes[i].childNodes[1].childNodes[3].value;
		var price = document.getElementsByTagName("table")[0].childNodes[3].childNodes[i].childNodes[3].innerText.replace(",", "").replace("원", "");
		var cnt = document.getElementsByTagName("table")[0].childNodes[3].childNodes[i].childNodes[5].innerText;
		var discountAmt = $("#discount").val();
		if(discountAmt.substr(-1) == "%"){
			discountAmt = Math.round(price * cnt * (discountAmt.substring(0, discountAmt.length-1)/100));
		} else {
			discountAmt = discountAmt.substring(0, discountAmt.length-1) / ((listCnt-1));
		}
		sum += (price * cnt) - discountAmt;
		$.ajax({
			async: false, 
			url: "/order/insert",
			type: "post", 
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data: {
				"orderNo" : orderNo,
				"productId" : productId,
				"cnt" : cnt,
				"recipient" : $("#recipient").val(),
				"addr" : $("#addr").val(),
				"phone" : $("#phone").val(),
				"discountAmt" : discountAmt,
				"amount" : price * cnt,
				"paymentCd" : "00"
			},
			dataType: "json",
			success: function(data){
				if(data.data == "success"){
					result = "success";
				} else {
					result = "fail";
				}
			},
			error: function(request, status, error){
				console.log("code:" + request.status);
				console.log("message:" + request.responseText);
				console.log("error:" + error);
				
				result = "fail";
			}
		});
		
		if(result == "fail"){
			break;
		}
	}
	
	if(result == "success"){
		var paymentCd = $("#rdCash").is(":checked")? "01" : $("#rdCard").is(":checked")? "02" : "00";
		
		if(paymentCd == "02"){
			var str = imp(orderNo, sum, $("#recipient").val());
		} else {
			updatePayment(orderNo, paymentCd);
			location.href = "/order/result/" + orderNo;
		}
	}
}

function updatePayment(orderNo, paymentCd){
	$.ajax({
		async: false, 
		url: "/order/update",
		type: "post", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: {
			"orderNo" : orderNo,
			"paymentCd" : paymentCd
		},
		dataType: "json",
		success: function(data){
			if(data.data == "success"){
				result = "success";
			} else {
				result = "fail";
			}
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
	
	if(result == "success"){
		location.href = "/order/result/" + orderNo;
	}
}

function getOrderNo(){
	var orderNo = "";

	$.ajax({
		async: false, 
		url: "/order/check",
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			orderNo = data.data;
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
	
	return orderNo;
}

function insertCheck(){
	if($("#recipient").val() == ""){
		alert("수령인을 입력해주세요.");
		return false;
	} else if($("#phone").val() == "") {
		alert("연락처를 입력해주세요.");
		return false;
	} else if($("#addr").val() == "") {
		alert("주소를 입력해주세요.");
		return false;
	} else if(!($("#rdCash").is(":checked") || $("#rdCard").is(":checked"))) {
		alert("결제수단을 선택해주세요.");
		return false;
	} else {
		insertOrder();
	}
}

function orderResult(orderNo){
	$.ajax({
		async: false, 
		url: "/order/result/view",
		type: "get", 
		data: {"orderNo" : orderNo},
		dataType: "json",
		success: function(data){
			var orderListHtml = ``;
			var amount = 0;
			var discountAmt = 0;
			
			$.each(data, function(index, item){
				$.each(item, function(index, jsonData){
					orderListHtml += `<tr>`;
					orderListHtml += `	<td style="vertical-align: middle;">`;
					orderListHtml += `		<table><tr style="border-top: 2px solid white;"><td style="width:20%;padding-left:0;"><img src="` + jsonData.filePath + `" width="80px"/></td>`;
					orderListHtml += `		<td style="width:auto;padding-left:0;"><span style="font-size: 10.5pt; font-weight: 500;"><a href="/product/` + jsonData.productId + `" style="color: black; text-decoration: none;">` + jsonData.productNm + `</a></span></td></tr></table>`;
					orderListHtml += `		<input type="hidden" value="` + jsonData.productId + `" />`;
					orderListHtml += `	</td>`;
					orderListHtml += `	<td style="vertical-align: middle;"><h5>` + jsonData.cnt + `</h5></td>`;
					orderListHtml += `	<td style="vertical-align: middle; padding-left: 0;padding-right: 0;"><h6>` + number_format(jsonData.amount) + `원</h6></td>`;
					orderListHtml += `</tr>`;
					
					$("#recipient").html(jsonData.recipient);
					$("#phone").html(jsonData.phone);
					$("#addr").html(jsonData.addr);
					
					$("#paymentNm").html(jsonData.paymentNm);
					$("#deliveryNm").html(jsonData.deliveryNm);
					
					if(jsonData.deliveryNm == "입금확인중"){
						$("#paymentNm").append(" [입금 계좌 : (농협) 000-0000-0000-00]");
					}
					
					amount += jsonData.amount;
					discountAmt += jsonData.discountAmt;
				});
			});
			
			$("#amount").html(number_format(amount));
			$("#discountAmt").html(number_format(discountAmt));
			$("#resultAmt").html(number_format(amount - discountAmt));
			
			$("#orderList").html(orderListHtml);
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function orderListAll(){
	$.ajax({
		async: false, 
		url: "/order/list/all",
		type: "get", 
		data: false,
		dataType: "json",
		success: function(data){
			var orderListHtml = ``;
			
			$.each(data, function(index, item){
				if(item.length > 0){
					$.each(item, function(index, jsonData){
						orderListHtml += `<tr>`;
						orderListHtml += `	<td style="vertical-align: middle;"><h5>`+ jsonData.orderNo + `</h5></td>`;
						orderListHtml += `	<td style="vertical-align: middle;"><h5>`+ jsonData.productNm + `</h5></td>`;
						orderListHtml += `	<td style="vertical-align: middle;"><h5>` + jsonData.orderNo.substr(0, 8).replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3') + `</h5></td>`;
						orderListHtml += `	<td style="vertical-align: middle;"><h5>` + number_format(jsonData.amount - jsonData.discountAmt) + `원</h5></td>`;
						orderListHtml += `	<td style="vertical-align: middle;"><h5>` + jsonData.deliveryNm + `</h5></td>`;
						orderListHtml += `</tr>`;
					});
				} else {
					orderListHtml += `<tr>`;
					orderListHtml += `	<td style="vertical-align: middle;" colspan="5" class="text-center"><h5>주문한 내역이 없습니다.</h5></td>`;
					orderListHtml += `</tr>`;
				}
			});
			
			$("#orderList").html(orderListHtml);
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}