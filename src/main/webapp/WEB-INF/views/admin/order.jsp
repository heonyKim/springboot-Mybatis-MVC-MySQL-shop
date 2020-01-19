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
							<h1 class="h3 mb-0 text-gray-800">주문관리</h1>
						</div>
	
						<!-- row -->
						<div class="row">
							<div class="col-lg-6">
								<div class="card mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">상세정보</h6>
									</div>
									<div class="card-body">
										<form id="orderForm">
											<div class="form-group">
												<label for="orderNo">주문번호</label>
												<input class="form-control mb-3" type="text" id="orderNo" name="orderNo" placeholder="주문번호" readonly="readonly">
											</div>
											
											<div class="form-group">
												<label for="productList">주문상품정보</label>
												<textarea class="form-control" id="productList" name="productList" rows="3" disabled="disabled" placeholder="상품정보"></textarea>
											</div>

											<div class="form-group">
												<label for="recipient">수령인</label>
												<input class="form-control mb-3" type="text" id="recipient" name="recipient" placeholder="수령인" readonly="readonly">
											</div>

											<div class="form-group">
												<label for="addr">주소</label>
												<input class="form-control mb-3" type="text" id="addr" name="addr" placeholder="주소" readonly="readonly">
											</div>
	
											<div class="form-group">
												<label for="phone">연락처</label>
												<input class="form-control mb-3" type="text" id="phone" name="phone" placeholder="연락처" readonly="readonly">
											</div>
	
											<div class="form-group">
												<label for="paymentCdNm">결제수단</label>
												<input class="form-control mb-3" type="text" id="paymentNm" name="paymentNm" placeholder="결제수단" readonly="readonly">
											</div>
	
											<div class="form-group">
												<label for="amount">총 금액</label>
												<div class="input-group mb-3">
													<input type="text" class="form-control text-right" id="amount" name="amount" readonly="readonly" placeholder="주문금액">
													<div class="input-group-append">
														<span class="input-group-text">원</span>
													</div>
												</div>
											</div>
	
											<div class="form-group">
												<label for="discountAmt">할인금액</label>
												<div class="input-group mb-3">
													<input type="text" class="form-control text-right" id="discountAmt" name="discountAmt" readonly="readonly" placeholder="할인금액">
													<div class="input-group-append">
														<span class="input-group-text">원</span>
													</div>
												</div>
											</div>
	
											<div class="form-group">
												<label for="resultAmt">최종결제금액</label>
												<div class="input-group mb-3">
													<input type="text" class="form-control text-right" id="resultAmt" name="resultAmt" readonly="readonly" placeholder="실결제금액">
													<div class="input-group-append">
														<span class="input-group-text">원</span>
													</div>
												</div>
											</div>
	
											<div class="form-group">
												<label for="orderDate">주문일시</label>
												<input class="form-control mb-3" type="text" id="orderDate" name="orderDate" placeholder="주문일시" readonly="readonly">
											</div>
	
											<div class="form-group">
												<label for="deliveryCd">배송상태</label>
												<select class="form-control mb-3" id="deliveryCd" id="deliveryCd" name="deliveryCd"></select>
											</div>
										</form>
										<div class="text-right">
											<button type="button" id="btnUpd" class="btn btn-warning mb-1">배송상태 수정</button>
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
										<table class="table align-items-center table-flush table-hover" id="orderTable" style="width: 100%;">
											<thead class="thead-light">
												<tr>
													<th>주문번호</th>
													<th>구매자</th>
													<th>배송상태</th>
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
		<script src="/js/order.js"></script>
	
		<!-- Page level custom scripts -->
		<script>
			$(document).ready(function() {
				formClear();
				$("#deliveryCd").html(codeRequest("DELIVERY"));
				orderList();
			});

			$("#orderTable").on("click", "tr", function(){
				rowData = $("#orderTable").DataTable().row(this).data();
				if(rowData !== null){
					formChange();
				}
			});
		</script>
	</body>
</html>