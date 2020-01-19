<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="/WEB-INF/views/admin/include/header.jsp"%>
		<!-- Page level plugins -->
		<link href="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	</head>
	
	<body id="page-top">
		<div id="wrapper">
		
			<%@include file="/WEB-INF/views/admin/include/sidebar.jsp"%>
	
			<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">
					
					<%@include file="/WEB-INF/views/admin/include/topbar.jsp"%>
	
					<!-- Container Fluid-->
					<div class="container-fluid" id="container-wrapper">
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800">게시판관리 > 목록</h1>
						</div>
	
						<!-- Row -->
						<div class="row">
							<!-- DataTable with Hover -->
							<div class="col-lg-12">
								<div>
									<select class="form-control mb-3" id="categoryCd" name="categoryCd" style="width: auto;"></select>
								</div>
								<div class="card mb-4" id="boardForm">
									<div class="table-responsive p-3">
										<table class="table align-items-center table-flush table-hover" style="width: 100%" id="boardTable">
											<thead class="thead-light">
												<tr>
													<th>번호</th>
													<th>상태</th>
													<th>제목</th>
													<th>작성자</th>
													<th>작성일</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!--Row-->
					</div>
					<!---Container Fluid-->
				</div>
	
				<%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
				
			</div>
		</div>
	
		<%@include file="/WEB-INF/views/admin/include/scripts.jsp" %>
		<!-- Page level plugins -->
		<script src="/bootstrap/admin/vendor/datatables/jquery.dataTables.min.js"></script>
		<script src="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
		<script src="/js/board.js"></script>
		
		<!-- Page level custom scripts -->
		<script>
			$(document).ready(function() {
				$("#categoryCd").html(codeRequest("BOARD"));
				if(!("${param.category}" == "" || "${param.category}" == "undefined" || "${param.category}" == "null")){
					$("#categoryCd").val("${param.category}");
				}
				boardList($("#categoryCd").val());
			});
			
			$("#categoryCd").on("change", function() {
				var code = $("#categoryCd").val();
				boardList(code);
				addBoardWriteBtn(code);
			});

			$("#boardTable").on("click", "tr", function(){
				boardData = $("#boardTable").DataTable().row(this).data();
				if($("#categoryCd").val() == "99"){
					location.href = "/admin/comment/view/" + boardData.id;
				} else {
					location.href = "view/" + boardData.id;
				}
			});
		</script>
	</body>
</html>