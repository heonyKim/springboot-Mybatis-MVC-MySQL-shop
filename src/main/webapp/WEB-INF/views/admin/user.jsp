<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="/WEB-INF/views/admin/include/header.jsp" %>
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
							<h1 class="h3 mb-0 text-gray-800">회원관리</h1>
						</div>
	
						<!-- Row -->
						<div class="row">
							<div class="col-lg-12">
							
								<div class="card mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">삭제대상</h6>
										<div>
											 - 7일 이상된 탈퇴 회원 정보 : <span id="delUserCnt" style="color:red; font-weight:bold;"></span>건 &nbsp; &nbsp;
											<button type="button" id="btnDel" class="btn btn-danger mb-1">삭제</button>
										</div>
									</div>
								</div>
									
								<div class="card mb-4">
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">목록</h6>
									</div>
									<div class="table-responsive p-3">
										<table class="ui table" style="width:100%;" id="userTable">
											<thead class="thead-light">
												<tr>
													<th>이메일</th>
													<th>주소</th>
													<th>연락처</th>
													<th>메일인증</th>
													<th>가입일시</th>
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
		<script src="/js/user.js"></script>
		<!-- excel,pdf,copy -->
		<script type="text/javascript" src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/1.10.15/js/dataTables.bootstrap4.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.bootstrap4.min.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
		<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
		
		<!-- Page level custom scripts -->
		<script>
			$(document).ready(function() {
				checkUserCnt();
				userList();
			});
		</script>
	</body>
</html>