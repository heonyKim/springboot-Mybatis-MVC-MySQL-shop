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
				{"data": "rowNum",
					render: function(data, type, row){return "";}},
				{"data": "title"},
				{"data": "email"},
				{"data": "insDt",
					render: function(data, type, row){return getDateFormat(data);}
				}
			],
			columnDefs: [
				{"targets":[0], "width": "10%"},
				{"targets":[1], "width": "0%", "visible": false},
				{"targets":[2], "width": "60%"},
				{"targets":[3], "width": "15%"},
				{"targets":[4], "width": "15%"}
		    ]
		});
		
		document.getElementsByTagName("th")[1].innerText = "제목";
		
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
				{"data": "answerContent",
					render: function(data, type, row){
						if(data == "답변대기"){ 
							return "<b style='color:blue'>" + data + "</b>";
						} else {
							return data;
						}
					}
				},
				{"data": "content"},
				{"data": "email"},
				{"data": "insDt",
					render: function(data, type, row){return getDateFormat(data);}
				}
			],
			columnDefs: [
				{"targets":[0], "width": "10%"},
				{"targets":[1], "width": "10%", "visible": true},
				{"targets":[2], "width": "50%"},
				{"targets":[3], "width": "15%"},
				{"targets":[4], "width": "15%"}
		    ]
		});
		
		document.getElementsByTagName("th")[2].innerText = "내용";
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
		var divFg = $("#divReply").length;
		if(divFg == 1){
			var answerId = $("#answerId").val();
			appendHtml += `<button type="button" id="btnReplyDelete" onClick="commentDelete(` + answerId + `)" class="btn btn-danger mb-1">답글 지우기</button>`;
		} else {
			appendHtml += `<button type="button" id="btnReplyWrite" onClick="addBoardReplyForm(` + id + `)" class="btn btn-success mb-1">답글 쓰기</button>`;
		}
	} else {
		appendHtml += `<button type="button" id="btnUpdate" onClick="location.href='/admin/board/updateForm/` + id + `'" class="btn btn-warning mb-1">수정</button>`;
		appendHtml += `<button type="button" id="btnDelete" onClick="location.href='/admin/board/delete/` + id + `'" class="btn btn-danger mb-1">삭제</button>`;
	}
	$("#divBtns").append(appendHtml);
}

function addBoardReplyForm(id){
	removeBoardReplyForm(); 
	appendHtml = ``;
	appendHtml += `<div id="replyForm" class="card-body">`;
	appendHtml += `	<form action="/admin/comment/write" method="post">`;
	appendHtml += `		<div class="form-group">`;
	appendHtml += `			<textarea class="form-control" name="content" rows="10" placeholder="Please insert ther contents of comment's answer here"></textarea>`;
	appendHtml += `		</div>`;
	appendHtml += `		<input type="hidden" name="parentId" value="` + id + `" />`;
	appendHtml += `		<div class="text-right">`;
	appendHtml += `			<button type="submit" id="btnWrite" class="btn btn-success mb-1">작성</button>`;
	appendHtml += `			<button type="button" id="btnCancel" onClick="removeBoardReplyForm();" class="btn btn-danger mb-1">취소</button>`;
	appendHtml += `		</div>`;
	appendHtml += `	</form>`;
	appendHtml += `</div>`;
	
	$("#originalForm").after(appendHtml);
}

function removeBoardReplyForm(){
	$("#replyForm").remove();
}

function commentDelete(answerId){
	$.ajax({
		url: "/admin/comment/delete/" + answerId,
		type: "post", 
		dataType: "json",
		success: function(data){
			if(data.result === "success"){
				$("#divReply").remove();
				$("#btnReplyDelete").remove();
				$("#divBtns").append(`<button type="button" id="btnReplyWrite" onClick="addBoardReplyForm(` + $("#id").val() + `)" class="btn btn-success mb-1">답글 쓰기</button>`);
				alert("답글이 정상적으로 삭제되었습니다.");
			} else {
				alert("답글 삭제 중 오류가 발생하였습니다.\n다시 시도해 주세요.");
			}
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
			alert("답글 삭제 중 오류가 발생하였습니다.\n다시 시도해 주세요.");
		}
	});
}