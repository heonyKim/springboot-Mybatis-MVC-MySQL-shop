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
							<h1 class="h3 mb-0 text-gray-800">게시판관리 > 글확인</h1>
						</div>
	
						<!-- Row -->
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">글확인</h6>
									</div>
									<div id="originalForm" class="card-body">
										<c:if test="${type eq 'board'}">
											<div style="font-weight: bold; font-size: 20px">
												${board.title}
											</div>
										</c:if>
										<c:choose>
											<c:when test="${type eq 'board'}">
												<div style="font-size: 8px; margin-top: 10px">
													<span style="margin-right: 15px">작성자 : ${board.email}</span>
													<span style="margin-right: 15px">작성일시 : ${board.insDt}</span>
													<span>최종 수정일시 : ${board.updDt}</span>
												</div>
												<hr />
												<div>
													${board.content}
												</div>
												<input type="hidden" id="categoryCd" value="${board.categoryCd}" />
												<input type="hidden" id="id" value="${board.id}" />
											</c:when>
											<c:otherwise>
												<div style="font-size: 8px; margin-top: 10px">
													<span style="margin-right: 15px">작성자 : ${comment.email}</span>
													<span style="margin-right: 15px">작성일시 : ${comment.insDt}</span>
													<span style="margin-right: 15px">상품명 : ${comment.productNm}</span>
													<span>평점 : ${comment.rating}</span>
												</div>
												<hr />
												<div>
													${comment.content}
												</div>
												<input type="hidden" id="categoryCd" value="99" />
												<input type="hidden" id="id" value="${comment.id}" />
											</c:otherwise>
										</c:choose>
										<input type="hidden" id="type" value="${type}" />
										
										<c:if test="${type eq 'comment'}">
											<c:if test="${not empty comment.answerContent}">
												<div id="divReply" class="card-body" style="background-color: #f0f0f0; margin-top:20px;">
													<h3>답변내용</h3>
													<div>
														${comment.answerContent}
													</div>
													<input type="hidden" id="parentId" name="parentId" value="${comment.parentId}" />
													<input type="hidden" id="answerId" name="answerId" value="${comment.answerId}" />
												</div>
											</c:if>
										</c:if>
										
										<div id="divBtns" class="text-right p-3">
											<button type="button" id="btnCancel" class="btn btn-primary mb-1">목록</button>
										</div>
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
				var type = $("#type").val();
				var id = $("#id").val();
				
				if(type == "board"){
					addBoardBtn(type, id);
				} else {
					addBoardBtn("99", id);
				}
			});
		
			$("#btnCancel").on("click", function(){
				var categoryCd = $("#categoryCd").val();
				location.href="/admin/board/list?category=" + categoryCd;
			});
		</script>
	</body>
</html>