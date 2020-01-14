<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>
<link href="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style>
#boardTable>tbody>tr{
	cursor: pointer;
}
</style>

<div class="content mb-5">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4 id="categoryNm" class="mb-3 font-weight-bold text-primary">게시판</h4>
			</div>
			<div class="col-lg-12">
				<table class="table align-items-center table-flush table-hover" id="boardTable" style="width: 100%">
					<thead class="thead-light">
						<tr class="text-center">
							<th style="width: 10%">NO</th>
							<th style="width: 70%">제목</th>
							<th style="width: 20%">작성일자</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
		
<script src="/bootstrap/admin/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<script>
 	if(!("${param.category}" == "" || "${param.category}" == "undefined" || "${param.category}" == "null")){
 		categoryCd = "${param.category}";
 	} else {
 		categoryCd = "01";
 	}
 	
 	$("#categoryNm").text(getCodeNm('BOARD', categoryCd));
 
	function boardList() {
		$("#boardTable").DataTable({
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
			ajax : {
				url : "/board/list/" + categoryCd
			},
			columns : [
				{data : "rowNum",
					render: function(data, type, row){
						var tag = `<div class="text-center">` + data + `</div>`;
						return tag;
					}
				},
				{data : "title"},
				{data : "insDt",
					render: function(data, type, row){
						var tag = `<div class="text-center">` + data + `</div>`;
						return tag;
					}
				}
			]
		});
	}
	
	$(document).ready(function() {
		boardList();
	});
	
	$("#boardTable").on("click", "tr", function() {
		rowValue = $("#boardTable").DataTable().row(this).data();
		location.href = "/board/view/" + rowValue.id;
	});
</script>