<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link href="/css/imagelayout.css" rel="stylesheet">
<%@include file="/WEB-INF/views/include/nav.jsp" %>
<!-- Page Content -->
<div class="container">
	<div class="row">
		<div class="col-12">
			<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid"
							src="https://heonydesign.000webhostapp.com/shop/slider1.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid"
							src="https://heonydesign.000webhostapp.com/shop/slider2.jpg"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid"
							src="https://heonydesign.000webhostapp.com/shop/slider3.jpg"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<%@include file="/WEB-INF/views/include/side.jsp"%>
			
			<!------------------ BEST3 AREA ------------------>
			<div class="row">
				<div class="col-lg-12">
					<h1 class="my-4">Best3</h1>
				</div>
				<c:forEach var="best" items="${best}">
					<c:choose>
						<c:when test="${best.saleId>0}">
							<!-- saleProduct -->
							<div class="col-lg-4 col-md-4 mb-4">
								<div class="card h-100">
									<div class="thumbnail-wrapper">
										<div class="thumbnail">
											<div class="thumbnail-centered">
												<a href="/product/${best.id}">
													<img class="thumbnail-img" src="${best.filePath}" alt="">
												</a>
											</div>
										</div>
									</div>

									<div class="card-body">
										<h4 class="card-title">
											<a href="/product/${best.id}" style="text-decoration: none;font-size: 1.0rem;font-weight:600;">${best.productNm}</a>
										</h4>
										<span style="color: #777777; text-decoration: line-through;">
											<fmt:formatNumber value="${best.price}" type="number"></fmt:formatNumber>원
										</span>
										<h5>
											<fmt:formatNumber value="${best.salePrice}" type="number"></fmt:formatNumber>원
										</h5>
										<p class="card-text">~${best.endDate}</p>
									</div>
									
									<div class="card-footer">
										<c:choose>
											<c:when test="${best.ratingAvg !=0.00}">
												<b style="color: #EBE028;">&#9733;</b>
												<fmt:formatNumber value="${best.ratingAvg}" pattern="0.00"></fmt:formatNumber>
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
												<a href="/product/${best.id}">
													<img class="thumbnail-img" src="${best.filePath}" alt="">
												</a>
											</div>
										</div>
									</div>

									<div class="card-body">
										<h4 class="card-title">
											<a href="/product/${best.id}" style="text-decoration: none; font-size: 1.0rem;font-weight:600;">${best.productNm}</a>
										</h4>
										<h5>
											<fmt:formatNumber value="${best.price}" pattern="#,###"></fmt:formatNumber>원
										</h5>
									</div>
									<div class="card-footer">
										<c:choose>
											<c:when test="${best.ratingAvg !=0.00}">
												<b style="color: #EBE028;">&#9733;</b>
												<fmt:formatNumber value="${best.ratingAvg}" pattern="0.00"></fmt:formatNumber>
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
			<hr>
			<!------------------ BEST3 END ------------------>
			
			
			<!------------------ PRODUCT LIST AREA------------------>
			<div class="row" id="mainProductArea">
				<div class="col-lg-12">
					<h1 class="my-4">All Product</h1>
				</div>
				<c:forEach var="listAll" items="${listAll}">
					<c:choose>
						<c:when test="${listAll.saleId>0}">
							<!-- saleProduct -->
							<div class="col-lg-4 col-md-4 mb-4">
								<div class="card h-100">
									<div class="thumbnail-wrapper">
										<div class="thumbnail">
											<div class="thumbnail-centered">
												<a href="/product/${listAll.id}"> <img
													class="thumbnail-img" src="${listAll.filePath}" alt="">
												</a>
											</div>
										</div>
									</div>
									<div class="card-body">
										<h4 class="card-title">
											<a href="/product/${listAll.id}"
												style="text-decoration: none;font-size: 1.0rem;font-weight:600;">${listAll.productNm}</a>
										</h4>
										<span style="color: #777777; text-decoration: line-through;"><fmt:formatNumber
												value="${listAll.price}" type="number"></fmt:formatNumber>원</span>
										<h5>
											<fmt:formatNumber value="${listAll.salePrice}" type="number"></fmt:formatNumber>
											원
										</h5>
										<p class="card-text">~${listAll.endDate}</p>
									</div>
									<div class="card-footer">


										<c:choose>
											<c:when test="${listAll.ratingAvg !=0.00}">
												<b style="color: #EBE028;">&#9733;</b>
												<fmt:formatNumber value="${listAll.ratingAvg}" pattern="0.00"></fmt:formatNumber>
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
												<a href="/product/${listAll.id}"> <img
													class="thumbnail-img" src="${listAll.filePath}" alt="">
												</a>
											</div>
										</div>
									</div>
									<div class="card-body">
										<h4 class="card-title">
											<a href="/product/${listAll.id}" style="font-size: 1.0rem;font-weight:600;">${listAll.productNm}</a>
										</h4>
										<h5>
											<fmt:formatNumber value="${listAll.price}" type="number"></fmt:formatNumber>원
										</h5>
									</div>
									<div class="card-footer">
										<c:choose>
											<c:when test="${listAll.ratingAvg !=0.00}">
												<b style="color: #EBE028;">&#9733;</b>
												<fmt:formatNumber value="${listAll.ratingAvg}" pattern="0.00"></fmt:formatNumber>
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
		<div id="loading" class="col-12" style="display: none; text-align: center; position: fixed; width: 100%; bottom: 120px; left: 0;">
			<i class="fa fa-refresh fa-spin" style="font-size: 30px"></i>
		</div>
	</div>
	<!-- /.row -->
	
</div>
<!-- /.container -->
<div id="enters"></div>
<%@include file="/WEB-INF/views/include/footer.jsp" %>
<script src="/js/mainscroll.js"></script>