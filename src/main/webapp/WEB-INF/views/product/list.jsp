<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="/css/imagelayout.css" rel="stylesheet">
<%@include file="/WEB-INF/views/include/nav.jsp"%>

<!-- Page Content -->
<div class="container">
	<div class="row">
		<div class="col-12">
			<%@include file="/WEB-INF/views/include/side.jsp"%>
			<div class="row" id="categoryProductArea">
				<input type="hidden" id="categoryCd" value="${list[0].categoryCd}">
				<div class="col-lg-12">
					<h1 class="my-4">${list[0].categoryNm}</h1>
				</div>
				<c:forEach var="list" items="${list}">
					<c:choose>
						<c:when test="${list.saleId>0}">
							<!-- saleProduct -->
							<div class="col-lg-4 col-md-4 mb-4">
								<div class="card h-100">
									<div class="thumbnail-wrapper">
										<div class="thumbnail">
											<div class="thumbnail-centered">
												<a href="/product/${list.id}" style="font-size: 1.0rem;font-weight:600;">
													<img class="thumbnail-img" src="${list.filePath}" alt="">
												</a>
											</div>
										</div>
									</div>

									<div class="card-body">
										<h4 class="card-title">
											<a href="/product/${list.id}" style="text-decoration: none;">${list.productNm}</a>
										</h4>
										<span style="color: #777777; text-decoration: line-through;">
											<fmt:formatNumber value="${list.price}" type="number"></fmt:formatNumber>원
										</span>
										<h5>
											<span style="color: #FF0000;">
												<fmt:formatNumber value="${list.salePrice}" type="number"></fmt:formatNumber>원
											</span>
										</h5>
										<p class="card-text">~${list.endDate}</p>
									</div>
									<div class="card-footer">
										<c:choose>
											<c:when test="${list.ratingAvg !=0.00}">
												<b style="color: #EBE028;">&#9733;</b>
												<fmt:formatNumber value="${list.ratingAvg}" pattern="0.00"></fmt:formatNumber>
											</c:when>
											<c:otherwise>
												<small>리뷰가 없습니다</small>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-lg-4 col-md-4 mb-4">
								<div class="card h-100">
									<div class="thumbnail-wrapper">
										<div class="thumbnail">
											<div class="thumbnail-centered">
												<a href="/product/${list.id}">
													<img class="thumbnail-img" src="${list.filePath}" alt="">
												</a>
											</div>
										</div>
									</div>
									<div class="card-body">
										<h4 class="card-title">
											<a href="/product/${list.id}" style="text-decoration: none;">${list.productNm}</a>
										</h4>
										<h5>
											<fmt:formatNumber value="${list.price}" pattern="#,###"></fmt:formatNumber>원
										</h5>
									</div>
									<div class="card-footer">
										<c:choose>
											<c:when test="${list.ratingAvg !=0.00}">
												<b style="color: #EBE028;">&#9733;</b>
												<fmt:formatNumber value="${list.ratingAvg}" pattern="0.00"></fmt:formatNumber>
											</c:when>
											<c:otherwise>
												<small>리뷰가 없습니다</small>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<!-- PRODUCT LIST END-->

		</div>
		<!-- /.col-lg-12 -->
		<div id="loading" class="col-12"
			style="display: none; text-align: center; position: fixed; width: 100%; bottom: 120px; left: 0;">
			<i class="fa fa-refresh fa-spin" style="font-size: 30px"></i>
		</div>
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<script>
	checkList();
	function checkList(){
		if($(".card-title").text() === ""){
			appendHtml = "<div class='col-lg-12 text-center mt-4 mb-5'> 상품 목록이 존재하지 않습니다. </div>"
			$("#categoryProductArea").after(appendHtml);
		}
	}
</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script src="/js/productlistscroll.js"></script>
