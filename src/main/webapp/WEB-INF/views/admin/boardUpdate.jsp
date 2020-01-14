<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
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
							<h1 class="h3 mb-0 text-gray-800">게시판관리 > 글수정</h1>
						</div>
	
						<!-- Row -->
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">글 수정</h6>
									</div>
									<div class="card-body">
										<form action="/admin/board/update" method="post">
											<div class="form-group">
												<input class="form-control mb-3" type="text" "id="title" name="title" placeholder="제목을 입력하세요." value="${board.title}">
											</div>
	
											<div class="form-group">
												<textarea class="form-control" id="summernote" name="content" rows="10" placeholder="내용을 입력하세요.">${board.content}</textarea>
											</div>
											
											<input type="hidden" name="id" value="${board.id}" />
																					
											<div class="text-right">
												<button type="submit" class="btn btn-success mb-1">수정</button>
												<button type="button" id="btnCancel" class="btn btn-danger mb-1">취소</button>
											</div>
										</form>
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
		
		<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
		<script src="/summernote/summernote-bs4.js"></script>
	
		<!-- Page level custom scripts -->
		<script>
			$("#btnCancel").on("click", function(){
				location.href="/admin/board/view/" + ${board.id};
			});
			
			$("#summernote").summernote({
				placeholder: '내용을 입력하세요.',
				tabsize: 2,
				height: 200
			});
			
			$('.dropdown-toggle').dropdown();
		</script>
	</body>
</html>