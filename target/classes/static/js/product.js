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
		],
		columnDefs: [
			{"targets":[0], "width": "15%"},
			{"targets":[1], "width": "70%"},
			{"targets":[2], "width": "15%"},
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
		reader.readAsDataURL(f);
		
		reader.onload = function(){
			var img = document.createElement("img");
			img.src = reader.result;
			img.onload = function(){
				var canvas = document.createElement("canvas");
				var ctx = canvas.getContext("2d");
				ctx.drawImage(img,0,0);
				var MAX_WIDTH=500;
				var MAX_HEIGHT=500;
				var width = this.width;
				var height =this.height;
				
				if (width > height) {
					if (width > MAX_WIDTH) {
						height *= MAX_WIDTH / width;
						width = MAX_WIDTH;
					}
				} else {
					if (height > MAX_HEIGHT) {
						width *= MAX_HEIGHT / height;
						height = MAX_HEIGHT;
					}
				}
				canvas.width = width;
				canvas.height = height;
				ctx = canvas.getContext("2d");
				ctx.drawImage(img,0,0,width,height);
				var dataUrl=canvas.toDataURL("image/png");
				$("#productPic").attr("src", dataUrl);
				
				var blob = dataUrlToBlob(dataUrl);
				var uploadForm = new FormData();
				uploadForm.append("productFile",blob,f.name);
				uploadProductPic(uploadForm);
			};
		};
	}
}

function uploadProductPic(uploadForm){
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

function dataUrlToBlob(dataUrl){
	var BASE64_MARKER = ";base64,";
	
	if (dataUrl.indexOf(BASE64_MARKER) === -1) {
		var parts = dataUrl.split(",");
		var contentType = parts[0].split(":")[1];
		var raw = parts[1];
		return new Blob([raw], {
			type: contentType
		});
	}
	
	var parts = dataUrl.split(BASE64_MARKER);
	var contentType = parts[0].split(":")[1]; // 'image/png'
	var raw = window.atob(parts[1]);
	var uInt8Array = new Uint8Array(raw.length);
	var i=0;
	while(i<raw.length){
		uInt8Array[i] = raw.charCodeAt(i);
		i++;
	}
	return new Blob([uInt8Array],{type:contentType});
}