function formClear(){
	$(".card-body form input").val("");
	$(".card-body form select").val("01");

	$("#couponId").val("0");

	$("#insertBtn").val("입력");
	$("#insertBtn").removeAttr("disabled");
	$("#insertBtn").removeAttr("style", "opacity:0.3");
	
	$("#modifyBtn").val("수정");
	$("#modifyBtn").attr("disabled", "true");
	$("#modifyBtn").attr("style", "opacity:0.3");
}

function couponList(){
	$("#couponTable").DataTable({
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
			url : '/admin/coupon/list'
		},
		columns : [
			{data : "description"},
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
			{"targets":[2], "width": "18%"}
	    ]
	});
}

function reloadList() {
	$("#couponTable").DataTable().ajax.reload();
}

function couponView(){
	$("#couponId").val(rowValue.id);
	$("#code").val(rowValue.code);
	$("#description").val(rowValue.description);
	
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

function guid() {
	function s4() {
		return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	}
	return s4() + s4() + s4() + s4();
}

function show_uuid() {
	document.getElementById("code").value = guid();
}

function couponSubmit() {
	if(confirm("진행하시겠습니까?")) {
		var id = $("#couponId").val();
		var formData = $("#couponForm").serialize();
		
		if(couponInsertCheck() == true){
			if (id > 0) {
				$.ajax({
					cache : false,
					url : "/admin/coupon/update",
					type : "POST",
					data : formData,
					success : function(data) {
						var myTable = $("#couponTable").DataTable();
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
					url : "/admin/coupon/insert",
					type : "POST",
					data : formData,
					success : function(data) {
						var myTable = $("#couponTable").DataTable();
						myTable.ajax.reload();
						formClear();
						alert("신규 쿠폰을 발급하였습니다.");
					},
					error : function(error) {
						console.log("error : " + error);
						alert("상세정보를 모두 기입하십시오.");
					}
				});
			}
		}
	}
}

function couponInsertCheck(){
	if($("#unitCd").val() == "02"){
		if($("#amount").val() <= 100){
			return true;
		} else {
			alert("할인율은 0~100 까지만 입력 가능합니다.");
			return false;
		}
	} else {
		return true;
	}
}