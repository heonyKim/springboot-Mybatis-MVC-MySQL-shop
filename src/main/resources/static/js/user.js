$("#btnDel").click(function() {
	userDelete();
});

function checkUserCnt(){
	$.ajax({
		url: "/admin/user/check",
		type: "get", 
		dataType: "json",
		success: function(data){
			$("#delUserCnt").text(data.data);
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
}

function userList(){
	$("#userTable").DataTable({
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
		ajax: {
			"url":"/admin/user/list"
		},
		columns: [
			{"data": "email"},
			{"data": "addr"},
			{"data": "phone"},
			{"data": "authFg"},
			{"data": "insDt",
				render: function(data, type, row){return getDateFormat(data);}
			}
		],
		columnDefs: [
			{"targets":[0], "width": "20%"},
			{"targets":[1], "width": "40%"},
			{"targets":[2], "width": "15%"},
			{"targets":[3], "width": "10%"},
			{"targets":[4], "width": "15%"},
		]
	});
}

function userDelete(){
	if(confirm("7일 이상된 탈퇴한 회원정보를 삭제하시겠습니까?")){
		$.ajax({
			url: "/admin/user/delete",
			type: "post", 
			dataType: "json",
			success: function(data){
				if(data.data === "success"){
					alert("7일 이상된 탈퇴 회원 정보가 정상적으로 삭제되었습니다.");
				} else {
					alert("정보 삭제 중 오류가 발생하였습니다.\n다시 시도해 주세요.");
				}
			},
			error: function(request, status, error){
				console.log("code:" + request.status);
				console.log("message:" + request.responseText);
				console.log("error:" + error);
				alert("정보 삭제 중 오류가 발생하였습니다.\n다시 시도해 주세요.");
			}
		});
		
		location.reload();
	}
}