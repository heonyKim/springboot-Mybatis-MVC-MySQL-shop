function userList(){
	$("#userTable").DataTable({
		/* excel,pdf,copy */
		dom: "Blfrtip",
		buttons: [ "excel", "pdf", "copy" ],
		/* excel,pdf,copy */
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
			{"data": "roleNm"},
			{"data": "authFg"},
			{data: "insDt",
					render: function(data, type, row){return getDateFormat(data);}
			}
		]
	});
}