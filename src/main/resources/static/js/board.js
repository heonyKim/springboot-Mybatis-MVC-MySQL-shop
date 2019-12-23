function boardList(categoryCd){
	addBoardWriteBtn(categoryCd);
	
	if(categoryCd != "99"){
		$("#boardTable").DataTable({
			destroy:true,
			processing: true,
			serverSide: false,
			paging: true,
			pagingType: "simple_numbers",
			order: false,
			ordering: false,
			info: true,
			filter: true,
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
			ajax: {
				url : "/admin/board/list/" + categoryCd
			},
			columns: [
				{"data": "rowNum"},
				{"data": "title"},
				{"data": "email"},
				{"data": "insDt",
					render: function(data, type, row){return getDateFormat(data);}
				}
			]
		});
	} else {
		$("#boardTable").DataTable({
			destroy:true,
			processing: true,
			serverSide: false,
			paging: true,
			pagingType: "simple_numbers",
			order: false,
			ordering: false,
			info: true,
			filter: true,
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
			ajax: {
				url : "/admin/comment/list/"
			},
			columns: [
				{"data": "rowNum"},
				{"data": "title"},
				{"data": "email"},
				{"data": "insDt",
					render: function(data, type, row){return getDateFormat(data);}
				}
			]
		});
	}
}

function addBoardWriteBtn(categoryCd){
	$("#boardWriteBtn").remove();
	
	if(categoryCd != "99"){
		appendHtml = ``;
		appendHtml += `<div id="boardWriteBtn" class="text-right p-3">`;
		appendHtml += `	<button onClick="location.href='/admin/board/writeForm/` + categoryCd + `'" type="button" class="btn btn-success mb-1">글 작성</button>`;
		appendHtml += `</div>`;
		
		$("#boardForm").append(appendHtml);
	}
}

function addBoardBtn(categoryCd, id){
	$("#btnReply").remove();
	
	appendHtml = ``;
	if(categoryCd == "99"){
		appendHtml += `<button type="button" id="btnReply" onClick="addBoardReplyForm(` + id + `)" class="btn btn-success mb-1">답글 쓰기</button>`;
	} else {
		appendHtml += `<button type="button" id="btnUpdate" onClick="location.href="'admin/board/updateForm/` + id + `'" class="btn btn-warning mb-1">수정</button>`;
		appendHtml += `<button type="button" id="btnDelete" onClick="location.href='/admin/board/delete/` + id + `'" class="btn btn-danger mb-1">삭제</button>`;
	}
	$("#divBtns").append(appendHtml);
}

function addBoardReplyForm(id){
	console.log(id);
	appendHtml = ``;
	appendHtml += `<div id="replyForm" class="card-body">`;
	appendHtml += `	<form action="/admin/board/write" method="post">`;
	appendHtml += `		<div class="form-group">`;
	appendHtml += `			<textarea class="form-control" name="content" rows="10" placeholder="Please insert ther contents of post here"></textarea>`;
	appendHtml += `		</div>`;
	appendHtml += `		<input type="hidden" name="title" value="리뷰 답글" />`;
	appendHtml += `		<input type="hidden" name="parentId" value="` + id + `" />`;
	appendHtml += `		<input type="hidden" name="categoryCd" value="99" />`;
	appendHtml += `		<div class="text-right">`;
	appendHtml += `			<button type="submit" id="btnWrite" class="btn btn-success mb-1">작성</button>`;
	appendHtml += `			<button type="button" id="btnCancel" class="btn btn-danger mb-1">취소</button>`;
	appendHtml += `		</div>`;
	appendHtml += `	</form>`;
	appendHtml += `</div>`;
	console.log(appendHtml);
	
	$("#originalForm").after(appendHtml);
}