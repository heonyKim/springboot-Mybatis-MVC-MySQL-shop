<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
					<!-- Container Fluid -->
					<div class="container-fluid" id="container-wrapper">
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800">코드관리</h1>
						</div>
	
						<!-- row -->
						<div class="row">
							<div class="col-lg-6">
								<div class="card mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">상세정보</h6>
									</div>
									<div class="card-body">
										<form id="codeForm">
											<div class="form-group">
												<label for="codeNm">코드명</label>
												<input class="form-control  mb-3" type="text" id="codeNm" name="codeNm" placeholder="코드명   ex)상의, 하의, ...">
											</div>
	
											<div class="form-group">
												<label for="codeGbn">코드구분</label>
												<input class="form-control  mb-3" type="text" id="codeGbn" name="codeGbn" placeholder="코드구분(영어대문자만 가능)   ex)BOARD, CATEGORY, ...">
											</div>
	
											<div class="form-group">
												<label for="code">코드</label>
												<input class="form-control  mb-3" type="number" id="code" name="code" placeholder="코드(숫자, 2글자)   ex)01, 02, ...">
											</div>
	
											<div class="form-group">
												<label for="useFg">사용여부</label>
												<select class="form-control mb-3" id="useFg" name="useFg">
													<option value="Y">Y</option>
													<option value="N">N</option>
												</select>
											</div>
	
											<input class="form-control" type="hidden" id="id" name="id" value="0" />
										</form>
										<div class="text-right">
											<button type="button" onClick="formClear();" id="btnClear" class="btn btn-primary mb-1">초기화</button>
											<button type="button" id="btnIns" class="btn btn-success mb-1">입력</button>
											<button type="button" id="btnUpd" class="btn btn-warning mb-1">수정</button>
										</div>
									</div>
								</div>
							</div>
	
							<div class="col-lg-6">
								<div class="card mb-4">
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">목록</h6>
									</div>
									<div class="table-responsive p-3">
										<table class="ui table" style="width:100%" id="codeTable">
											<thead class="thead-light">
												<tr>
													<th>코드구분</th>
													<th>코드</th>
													<th>코드명</th>
													<th>사용여부</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- row -->
					</div>
					<!-- Container Fluid -->
				</div>
				
				<%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
				
			</div>
		</div>
	
		<%@include file="/WEB-INF/views/admin/include/scripts.jsp" %>
		<!-- Page level plugins -->
		<script src="/bootstrap/admin/vendor/datatables/jquery.dataTables.min.js"></script>
		<script src="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
		<script src="/js/code.js"></script>
	
		<!-- Page level custom scripts -->
		<script>
			$(document).ready(function() {
				formClear();
				codeList();
			});
			
			$("#codeTable").on("click", "tr", function(){
				rowData = $("#codeTable").DataTable().row(this).data();
				if(rowData !== null){
					formChange();
				}
			});
		</script>
	</body>
</html>