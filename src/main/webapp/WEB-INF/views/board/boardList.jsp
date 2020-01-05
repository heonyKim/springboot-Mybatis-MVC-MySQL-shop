<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>
<link href="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- board Datatables Area-->

<style>
#boardTable>tbody>tr{
	text-align:center;
	cursor: pointer;
}
</style>
<div class="content">
	<div class="container">
	<div class="row">
<div class="col-lg-12">
		<table class="row-border" style="width:100%" id="boardTable">
			<thead>
				<tr style="text-align: center">
					<th style="width:5%">NO</th>
					<th style="width:65%">제목</th>
					<th style="width:10%">작성자</th>
					<th style="width:20%">작성일자</th>
				</tr>
			</thead>
		</table>
		</div>
		</div>
</div>
</div>
<!-- board Datatables Area-->
<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script src="/bootstrap/admin/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/bootstrap/admin/vendor/datatables/jquery.dataTables.js"></script>
<script src="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
<script>

var href = document.location.href;
var endpoint = href.lastIndexOf("/");
var categoryCd = href.substring(href.length,endpoint+1);
boardList();
function boardList(){
	$("#boardTable").DataTable({
		processing : true,
		serverSide : false,
		paging : true,
		order: false,
		ordering: false,
		info : true,
		filter : true,
		language : {
			"zeroRecords" : "데이터가 없습니다.",
			"lengthMenu" : "_MENU_ 개씩 보기",
			"search" : "검색:",
			"info" : "_PAGE_ / _PAGES_",
			"paginate" : {
				"previous" : "<",
				"next" : ">"
			}
		},
		ajax : {
			url : '/board/list/list/'+categoryCd
		},
		columns : [
			{data:"id"},
			{data:"title"},
			{data:"email",
				render:function(data,type,row){
					var username=data.split('@')[0];
					return username;
				}},
			{data:"insDtToString"}
		]
	});
	
	$("#boardTable").on("click","tr",function(){
		rowValue=$("#boardTable").DataTable().row(this).data();
		location.href="/board/view/"+rowValue.id;
	});
}


</script>