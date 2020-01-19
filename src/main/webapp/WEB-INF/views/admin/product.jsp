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
							<h1 class="h3 mb-0 text-gray-800">상품관리</h1>
						</div>
	
						<!-- row -->
						<div class="row">
							<div class="col-lg-6">
								<div class="card mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">상세정보</h6>
									</div>
									<div class="card-body">
										<form id="productForm">
											<div class="form-group">
												<label for="productNm">상품명</label>
												<input class="form-control mb-3" type="text" id="productNm" name="productNm" placeholder="상품명">
											</div>
	
											<div class="form-group">
												<label for="price">가격</label>
												<div class="input-group mb-3">
													<input type="text" class="form-control text-right" id="price" name="price" placeholder="0">
													<div class="input-group-append">
														<span class="input-group-text">원</span>
													</div>
												</div>
											</div>
	
											<div class="form-group">
												<label for="categoryCd">카테고리</label>
												<select class="form-control mb-3" id="categoryCd" name="categoryCd">
													<option>목록</option>
												</select>
											</div>
	
											<div class="form-group">
												<label for="description">상품설명</label>
												<textarea class="form-control" id="description" name="description" rows="3" placeholder="상품에 대한 설명을 입력하세요."></textarea>
											</div>

											<input class="form-control" type="hidden" id="id" name="id" value="0" />
											<input class="form-control" type="hidden" id="filePath" name="filePath" />
										</form>
										
										<form id="uploadForm" enctype="multipart/form-data" method="post">
											<div class="form-group">
												<label for="productFile">상품사진</label>
												<input class="form-control mb-3" type="file" id="productFile" name="productFile">
												<input style = "display:none;" type="file" id="resizeProductFile" name="resizeProductFile">
											</div>
											
											<div class="form-group text-center">
												<img id="productPic" src="/bootstrap/admin/img/error.svg" width="100px"/>
											</div>
										</form>
										<div class="text-right">
											<button type="button" onClick="formClear();" id="btnClear" class="btn btn-primary mb-1">초기화</button>
											<button type="button" id="btnIns" class="btn btn-success mb-1">입력</button>
											<button type="button" id="btnUpd" class="btn btn-warning mb-1">수정</button>
											<button type="button" id="btnDel" class="btn btn-danger mb-1">삭제</button>
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
										<table class="ui celled table" style="width: 100%;"  id="productTable">
											<thead class="thead-light">
												<tr>
													<th>카테고리</th>
													<th>상품명</th>
													<th>가격</th>
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
				
				<%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
				
			</div>
		</div>
	
		<%@include file="/WEB-INF/views/admin/include/scripts.jsp" %>
		<!-- Page level plugins -->
		<script src="/bootstrap/admin/vendor/datatables/jquery.dataTables.min.js"></script>
		<script src="/bootstrap/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
		<script src="/js/product.js"></script>
	
		<!-- Page level custom scripts -->
		<script>
			$(document).ready(function() {
				formClear();
				$("#categoryCd").html(codeRequest("PRODUCT"));
				productList();
			});
			
			$("#productTable").on("click", "tr", function(){
				rowData = $("#productTable").DataTable().row(this).data();
				if(rowData !== null){
					formChange();
				}
			});

			$("#productFile").on("change", handleImgFile);
		</script>
	</body>
</html>