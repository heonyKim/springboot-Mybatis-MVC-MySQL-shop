function formClear(){
	$("#productNm").val("");
	$("#price").val("");
	$("#description").val("");
	$("#categoryCd").val("");
	$("#id").val("0");
	
	$("#filePath").val("");
	$("#productFile").val("");
	$("#productPic").attr("src", "/bootstrap/admin/img/error.svg");
	
	$("#btnIns").removeAttr("disabled");
	$("#btnUpd").removeAttr("disabled");
	$("#btnDel").removeAttr("disabled");
	
	$("#btnIns").removeAttr("style");
	$("#btnUpd").removeAttr("style");
	$("#btnDel").removeAttr("style");
	
	$("#btnUpd").attr("disabled", "disabled");
	$("#btnDel").attr("disabled", "disabled");
	
	$("#btnUpd").css("opacity","0.3");
	$("#btnDel").css("opacity","0.3");
	
	$("#btnIns").removeAttr("onClick");
	$("#btnUpd").removeAttr("onClick");
	$("#btnDel").removeAttr("onClick");
	
	$("#btnIns").attr("onClick", "productInsert();");
}

function formChange(){
	$("#productNm").val(rowData.productNm);
	$("#price").val(rowData.price);
	$("#description").val(rowData.description);
	$("#categoryCd").val(rowData.categoryCd);
	$("#id").val(rowData.id);
	
	$("#filePath").val(rowData.filePath);
	$("#productFile").val("");
	if(rowData.filePath != null && rowData.filePath != undefined){
		$("#productPic").attr("src", rowData.filePath);
	} else {
		$("#productPic").attr("src", "/bootstrap/admin/img/error.svg");
	}
	
	$("#btnIns").attr("disabled", "disabled");
	$("#btnIns").css("opacity","0.3");
	$("#btnIns").removeAttr("onClick");
	
	$("#btnUpd").removeAttr("disabled");
	$("#btnUpd").removeAttr("style");
	$("#btnUpd").attr("onClick", "productUpdate();");
	
	$("#btnDel").removeAttr("disabled");
	$("#btnDel").removeAttr("style");
	$("#btnDel").attr("onClick", "productDelete();");
}

function productList(){
	$("#productTable").DataTable({
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
			"url": "/admin/product/list",
			"dataType" : "json"
		},
		columns: [
			{data: "categoryNm"},
			{data: "productNm"},
			{data: "price"}
		]
	});
}

function productInsert(){
	var productForm = $("#productForm").serialize();
	
	var filePathCheck = $("#filePath").val();
	if(filePathCheck == "" || filePathCheck == undefined || filePathCheck == null){
		alert("상품 사진이 없거나 사진 업로드에 시간이 지연되고 있습니다.\n잠시 후 다시 시도해 주세요.");
		return;
	}
	
	$.ajax({
		url: "/admin/product/insert",
		type: "post", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: productForm,
		dataType: "json",
		success: function(data){
			if(data.result === "success"){
				$("#productTable").DataTable().ajax.reload();
				formClear();
				alert("정상적으로 입력되었습니다.");
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

function productUpdate(){
	var productForm = $("#productForm").serialize();
	
	var filePathCheck = $("#filePath").val();
	if(filePathCheck == "" || filePathCheck == undefined || filePathCheck == null){
		alert("상품 사진이 없거나 사진 업로드에 시간이 지연되고 있습니다.\n잠시 후 다시 시도해 주세요.");
		return;
	}
	
	$.ajax({
		url: "/admin/product/update",
		type: "post", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: productForm,
		dataType: "json",
		success: function(data){
			if(data.result === "success"){
				$("#productTable").DataTable().ajax.reload();
				$("#productFile").val("");
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

function productDelete(){
	var productForm = $("#productForm").serialize();
	
	$.ajax({
		url: "/admin/product/delete",
		type: "post", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: productForm,
		dataType: "json",
		success: function(data){
			if(data.result === "success"){
				$("#productTable").DataTable().ajax.reload();
				formClear();
				alert("정상적으로 삭제되었습니다.");
			} else {
				alert("데이터 삭제 중 오류가 발생하였습니다.\n다시 시도해 주세요.");
			}
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function handleImgFile(e){
	var f = e.target.files[0];
	
	if(!f.type.match("image.*")){
		alert("이미지만 등록할 수 있습니다.");
		return;
	} else {
		var reader = new FileReader();
		
		reader.onload = function(e){
			$("#productPic").attr("src", e.target.result);
		}
		
		reader.readAsDataURL(f);
		
		uploadProductPic();
	}
}


function uploadProductPic(){
	var uploadForm = new FormData($('#uploadForm')[0]);

	$.ajax({
		async : false,
		url: "/admin/product/upload",
		type: "post", 
		enctype: "multipart/form-data",
		processData: false,
		contentType: false,
		data: uploadForm,
		dataType: "json",
		success: function(data){
			if(data.result === "fail"){
				alert("파일 업로드 중 오류가 발생하였습니다.\n다시 시도해 주세요.");
			} else {
				$("#filePath").val(data.result);
			}
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}