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
							<h1 class="h3 mb-0 text-gray-800">쿠폰관리</h1>
						</div>
	
						<!-- row -->
						<div class="row">
							<div class="col-lg-6">
								<div class="card mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">상세정보</h6>
									</div>
									<div class="card-body">
										<form id="couponForm" method="post">
											<div class="form-group">
												<label for="couponCd">쿠폰코드</label>
												<input class="form-control mb-3" type="text" size="20" id="code" name="code" placeholder="쿠폰 코드(임의의 문자열 또는 랜덤 생성 문자열)를 입력하세요" required="required">
												<button type="button" onclick="show_uuid()" class="btn btn-primary mb-1">쿠폰번호발급</button>
											</div>
											
											<div class="form-group">
												<label for="couponNm">쿠폰명</label>
												<input class="form-control mb-3" type="text" id="description" name="description" placeholder="쿠폰명" required="required">
											</div>
	
											<div class="form-group">
												<label for="amount">할인값</label>
												<input class="form-control mb-3" type="text" id="amount" name="amount" placeholder="할인값(숫자만 입력)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required">
											</div>
	
											<div class="form-group">
												<label for="unitCd">단위</label>
												<select class="form-control mb-3" id="unitCd" name="unitCd"></select>
											</div>
	
											<div class="form-group">
												<label for="startDate">쿠폰 유효시작일</label>
												<input class="form-control mb-3" type="text" id="startDate" name="startDate"  placeholder="쿠폰 시작일(년도, 월, 일 8자리로 입력) ex)20200131" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" maxlength="8">
											</div>
	
											<div class="form-group">
												<label for="endDate">쿠폰 유효종료일</label>
												<input class="form-control mb-3" type="text" id="endDate" name="endDate"  placeholder="쿠폰 종료일(년도, 월, 일 8자리로 입력) ex)20200131" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" maxlength="8">
											</div>
											
											<input type="hidden" id="couponId" name="id" value="0">
										</form>
										<div class="text-right">
											<button type="button" id="clearBtn" class="btn btn-primary mb-1">초기화</button>
											<button type="button" id="insertBtn" class="btn btn-success mb-1"  onclick="couponSubmit();">입력</button>
											<button type="button" id="modifyBtn" class="btn btn-warning mb-1"  onclick="couponSubmit();" style="opacity: 0.3;" disabled="disabled">수정</button>
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
									
										<table class="ui celled table" style="width:100%" id="couponTable">
											<thead class="thead-light">
												<tr>
													<th>쿠폰명</th>
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
		<script src="/js/coupon.js"></script>
		
		<!-- Page level custom scripts -->
		<script>
			$(document).ready(function() {
				formClear();
				$("#unitCd").html(codeRequest("UNIT"));
				couponList();
			});
			
			$("#clearBtn").click(function() {
				formClear();
			});
			
			$("#couponTable").on("click", "tr", function(){
				rowValue = $("#couponTable").DataTable().row(this).data();
				if(rowValue !== null){
					couponView();
				}
			});
		</script>
	</body>
</html>