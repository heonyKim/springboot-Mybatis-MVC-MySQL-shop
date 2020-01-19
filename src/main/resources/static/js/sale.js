function formClear(){
	$(".card-body form input").val("");
	$(".card-body form select").val("01");

	$("#saleId").val("0");
	$("#productCategoryCd").removeAttr("disabled");
	$("#productId").removeAttr("disabled");
	$("#productId").html("");
	$("#priceArea").html("");
	getProduct("01");
	
	$("#insertBtn").val("입력");
	$("#insertBtn").removeAttr("disabled");
	$("#insertBtn").removeAttr("style", "opacity:0.3");
	
	$("#modifyBtn").val("수정");
	$("#modifyBtn").attr("disabled", "true");
	$("#modifyBtn").attr("style", "opacity:0.3");
}

function getProduct(categoryCd){
	$.ajax({
		url : "/admin/sale/load/product",
		type : 'POST',
		data : {num : categoryCd},
		success : function(data) {
			var json = JSON.parse(data);

			var optionHtml = "";
			var priceHtml = "";
			for (key in json) {
				optionHtml += "<option value='" + json[key].id + "'>";
				optionHtml += json[key].productNm + " (" + number_format(json[key].price) + "원)";
				optionHtml += "</option>"
				var price = json[key].price;
				priceHtml += `<input type="hidden" id="${json[key].id}price" value="${json[key].id}s${json[key].price}">`;
			}
			$("#productId").html(optionHtml);
			$("#priceArea").html(priceHtml);
			
		}
	});
}

function saleList(){
	$("#saleTable").DataTable({
		processing : true,
		serverSide : false,
		paging : true,
		pagingType : "simple_numbers",
		order: false,
		ordering: false,
		info : true,
		filter : true,
		language : {
			"zeroRecords" : "데이터가 없습니다.",
			"lengthMenu" : "_MENU_ 개씩 보기",
			"search" : "검색:",
			"info" : "_PAGE_ / _PAGES_",
			"infoFiltered" : "(전체 _MAX_개의 데이터 중 검색결과)",
			"paginate" : {
				"previous" : "이전",
				"next" : "다음"
			}
		},
		ajax : {
			url : '/admin/sale/list'
		},
		columns : [
			{data : "productNm"},
			{data : "amount",
				render: function(data, type, row){return data + "" + row.unitNm;}
			},
			{data: "startDate",
				render: function(data, type, row){
					var year = data.substr(0,4);
				    var month = data.substr(4,2);
				    var day = data.substr(6,2);                        
				    
					return year + "-" + month + "-" + day;
				}
			},
			{data: "endDate",
				render: function(data, type, row){
					var year = data.substr(0,4);
				    var month = data.substr(4,2);
				    var day = data.substr(6,2);                        
				    
					return year + "-" + month + "-" + day;
				}
			}
		],
		columnDefs: [
			{"targets":[0], "width": "49%"},
			{"targets":[1], "width": "15%"},
			{"targets":[2], "width": "18%"},
			{"targets":[3], "width": "18%"}
	    ]
	});
}

function saleView(){
	$("#productId").html("");
	$("#priceArea").html("");
	$("#saleId").val(rowValue.id);
	$("#productCategoryCd").val(rowValue.categoryCd);
	$("#productCategoryCd").attr("disabled", "disabled");
	
	var optionHtml = "";
	var priceHtml = "";
	optionHtml += "<option value='" + rowValue.id + "'>";
	optionHtml += rowValue.productNm + " (" + number_format(rowValue.price) + "원)";
	optionHtml += "</option>"
	priceHtml += `<input type="text" id="${rowValue.id}price" value="${rowValue.id}s${rowValue.price}">`;
	$("#productId").html(optionHtml);
	$("#priceArea").html(priceHtml);
	$("#productId").attr("disabled", "disabled");
	
	$("#amount").val(rowValue.amount);
	$("#unitCd").val(rowValue.unitCd);
	$("#startDate").val(rowValue.startDate);
	$("#endDate").val(rowValue.endDate);
	
	$("#insertBtn").attr("disabled", "true");
	$("#insertBtn").attr("style", "opacity:0.3");
	
	$("#modifyBtn").removeAttr("disabled");
	$("#modifyBtn").removeAttr("style", "opacity:0.3");

	var endDate = $("#endDate").val();
	var today = new Date();
	today = getDateFormat(today).replace(/-/g, "").substr(0, 8);

	if (endDate - today < 0) {
		$("#modifyBtn").attr("disabled", "true");
		$("#modifyBtn").attr("style", "opacity:0.3");
	}
}

function saleSubmit() {
	if(confirm("진행하시겠습니까?")) {
		var unitCd=document.getElementById("unitCd").value;
		var id = $("#saleId").val();
		var formData = $("#saleForm").serialize();
		
		var amount = document.getElementById("amount").value; 
		
		var productId = document.getElementById("productId").value; 
		var price = $(`#${productId}price`).val();
		price = price.split('s');
		price = price[1];
		
		if(unitCd==='01'){
			if(price-amount>=100){
				if (id > 0) {
					$.ajax({
						cache : false,
						url : "/admin/sale/update",
						type : "POST",
						data : formData,
						success : function(data) {
							var myTable = $("#saleTable").DataTable();
							myTable.ajax.reload();
							alert("수정이 완료되었습니다.");
						},
						error : function(error) {
							alert("error : " + error);
						}
					});
				} else {
					$.ajax({
						cache : false,
						url : "/admin/sale/insert",
						type : 'POST',
						data : formData,
						success : function(data) {
							var myTable = $('#saleTable').DataTable();
							myTable.ajax.reload();
							formClear();
							alert("할인적용을 완료하였습니다.");
						},
						error : function(error) {
							console.log("error : " + error);
							alert("상세정보를 모두 기입하십시오.");
						}
					});
				}
			} else {
				alert("할인된 최종 금액이 100원 이상 이어야 합니다.");
			}
		} else {
			if(amount<=100){
				if (id > 0) {
					$.ajax({
						cache : false,
						url : "/admin/sale/update",
						type : "POST",
						data : formData,
						success : function(data) {
							var myTable = $("#saleTable").DataTable();
							myTable.ajax.reload();
							alert("수정이 완료되었습니다.");
						},
						error : function(error) {
							alert("error : " + error);
						}
					});
				} else {
					$.ajax({
						cache : false,
						url : "/admin/sale/insert",
						type : 'POST',
						data : formData,
						success : function(data) {
							var myTable = $('#saleTable').DataTable();
							myTable.ajax.reload();
							formClear();
							alert("할인적용을 완료하였습니다.");
						},
						error : function(error) {
							console.log("error : " + error);
							alert("상세정보를 모두 기입하십시오.");
						}
					});
				}
			} else {
				alert("할인율은 0~100 까지만 입력 가능합니다.");
			}
		}
	}
}