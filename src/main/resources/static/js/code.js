function formClear(){
	$("#codeNm").val("");
	$("#codeGbn").val("");
	$("#code").val("");
	$("#useFg").val("");
	$("#id").val("0");
	
	$("#codeNm").removeAttr("readonly");
	$("#codeGbn").removeAttr("readonly");
	$("#code").removeAttr("readonly");
	
	$("#btnIns").removeAttr("disabled");
	$("#btnUpd").removeAttr("disabled");
	
	$("#btnIns").removeAttr("style");
	$("#btnUpd").removeAttr("style");
	
	$("#btnUpd").attr("disabled", "disabled");
	
	$("#btnUpd").css("opacity","0.3");
	
	$("#btnIns").removeAttr("onClick");
	$("#btnUpd").removeAttr("onClick");
	
	$("#btnIns").attr("onClick", "codeInsert();");
}

function formChange(){
	$("#id").val(rowData.id);
	$("#codeNm").val(rowData.codeNm);
	$("#codeGbn").val(rowData.codeGbn);
	$("#code").val(rowData.code);
	$("#useFg").val(rowData.useFg);
	
	$("#codeNm").attr("readonly", "readonly");
	$("#codeGbn").attr("readonly", "readonly");
	$("#code").attr("readonly", "readonly");
	
	$("#btnIns").attr("disabled", "disabled");
	$("#btnIns").css("opacity","0.3");
	$("#btnIns").removeAttr("onClick");
	
	$("#btnUpd").removeAttr("disabled");
	$("#btnUpd").removeAttr("style");
	$("#btnUpd").attr("onClick", "codeUpdate();");
}

function codeList(){
	$("#codeTable").DataTable({
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
			"url": "/admin/code/list",
			"dataType" : "json"
		},
		columns: [
			{data: "codeGbn"},
			{data: "code"},
			{data: "codeNm"},
			{data: "useFg"}
		]
	});
}

function codeInsert(){
	var codeGbnChk = /^[A-Z]$/;
	if(codeGbnChk.test($("#codeGbn").val())){
		alert("코드구분은 대문자만 입력가능합니다. ex)BOARD, CATEGORY, ..");
		return false;
	} else if(!($("#code").val().length == 2)){
		alert("코드는 반드시 2자리 숫자여야 합니다. ex)01, 02, ..");
		return false;
	} else {
		var codeForm = $("#codeForm").serialize();
		$.ajax({
			url: "/admin/code/insert",
			type: "post", 
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data: codeForm,
			dataType: "json",
			success: function(data){
				if(data.result === "success"){
					$("#codeTable").DataTable().ajax.reload();
					formClear();
					alert("정상적으로 입력되었습니다.");
				} else if(data.result === "duplicate"){
					alert("이미 해당 코드로 입력된 자료가 있습니다.\n확인 후 다시 시도해 주세요.");
				} else {
					alert("데이터 입력 중 오류가 발생하였습니다.\n입력한 정보를 다시 확인해 주세요.");
				}
			},
			error: function(request, status, error){
				console.log("code:" + request.status);
				console.log("message:" + request.responseText);
				console.log("error:" + error);
			}
		});
	}
}

function codeUpdate(){
	var codeForm = $("#codeForm").serialize();
	
	$.ajax({
		url: "/admin/code/update",
		type: "post", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: codeForm,
		dataType: "json",
		success: function(data){
			if(data.result === "success"){
				$("#codeTable").DataTable().ajax.reload();
				alert("정상적으로 수정되었습니다.");
			} else {
				alert("데이터 수정 중 오류가 발생하였습니다.\n입력한 정보를 다시 확인해 주세요.");
			}
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}