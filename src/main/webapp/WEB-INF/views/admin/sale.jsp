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
							<h1 class="h3 mb-0 text-gray-800">할인관리</h1>
						</div>
	
						<!-- row -->
						<div class="row">
							<div class="col-lg-6">
								<div class="card mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">상세정보</h6>
									</div>
									<div class="card-body">
										<form id="saleForm" method="POST">
											<div class="form-group">
												<label for="productCategoryCd">상품카테고리</label>
												<select class="form-control mb-3" name="productCategoryCd" id="productCategoryCd"></select>
											</div>
											
											<div class="form-group">
												<label for="productId">상품</label>
												<select class="form-control mb-3" name="productId" id="productId"></select>
											</div>
											<!-- hidden price -->
											<div id="priceArea" style="display:none;">
											<!-- hidden price -->
											</div>
											<div class="form-group">
												<label for="amount">할인값</label>
												<input class="form-control mb-3" type="text" id="amount" name="amount" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
											</div>
	
											<div class="form-group">
												<label for="unitCd">단위</label>
												<select class="form-control mb-3" name="unitCd" id="unitCd"></select>
											</div>
	
											<div class="form-group">
												<label for="startDate">할인시작일</label>
												<input class="form-control mb-3" type="text" id="startDate" name="startDate" placeholder="년도,월,일 8자리로 입력. 예)19910220" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
											</div>
	
											<div class="form-group">
												<label for="endDate">할인종료일</label>
												<input class="form-control mb-3" type="text" id="endDate" name="endDate" placeholder="년도,월,일 8자리로 입력. 예)19910220" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
											</div>
	
											<input type="hidden" id="saleId" name="id" value="0">
										</form>
										<div class="text-right">
											<button type="button" id="clearBtn" class="btn btn-primary mb-1">초기화</button>
											<button type="button" id="insertBtn" class="btn btn-success mb-1" onclick="saleSubmit();">입력</button>
											<button type="button" id="modifyBtn" class="btn btn-warning mb-1" onclick="saleSubmit();" style="opacity: 0.3;" disabled="disabled">수정</button>
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
										<table class="ui celled table" style="width:100%" id="saleTable">
											<thead class="thead-light">
												<tr>
													<th>상품명</th>
													<th>할인내용</th>
													<th>시작일</th>
													<th>종료일</th>
												</tr>
											</thead>
											
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Container Fluid -->
				</div>
	
				<%@include file="/WEB-INF/views/admin/include/footer.jsp"%>
	
			</div>
		</div>
		
		<%@include file="/WEB-INF/views/admin/include/scripts.jsp"%>
		<!-- Page level plugins -->
		<script src="/bootstrap/admin/vendor/datatables/jquery.dataTables.min.js"></script>
		<script src="/bootstrap/admin/vendor/datatables/jquery.dataTables.js"></script>
		<script src="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
		<script src="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
		<script src="/js/sale.js"></script>
		
		<!-- Page level custom scripts -->
		<script>
			$(document).ready(function() {
				formClear();
				$("#unitCd").html(codeRequest("UNIT"));
				$("#productCategoryCd").html(codeRequest("PRODUCT"));
				getProduct("01");
				saleList();
			});
			
			$("#clearBtn").click(function() {
				formClear();
			});
			
			$("#productCategoryCd").change(function() {
				var categoryCd = $("#productCategoryCd").val();
				getProduct(categoryCd);
			});
			
			$("#saleTable").on("click", "tr", function(){
				rowValue = $("#saleTable").DataTable().row(this).data();
				if(rowValue !== null){
					saleView();
				}
			});
		</script>
	</body>
</html>