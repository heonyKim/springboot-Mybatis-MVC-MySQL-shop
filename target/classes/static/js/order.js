function formClear(){
	$("#orderNo").val("");
	$("#productList").val("");
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