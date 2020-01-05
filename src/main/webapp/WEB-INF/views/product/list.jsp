<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<%@include file="/WEB-INF/views/include/nav.jsp" %>
	<!-- Page Content -->
	<div class="container">

		<div class="row">
			

			<div class="col-12">
					<%@include file="/WEB-INF/views/include/side.jsp" %>
				
				<div class="row">
					<!-- BEST3 START -->
					<div class="col-lg-12"><h1 class="my-4">${list[0].categoryNm }</h1></div>
					<c:forEach var="list" items="${list}">
						<c:choose>
							<c:when test="${list.saleId>0}">	<!-- saleProduct -->
							<div class="col-lg-4 col-md-4 mb-4">
								<div class="card h-100">
									<a href="/product/${list.id}"><img class="card-img-top" src="${list.filePath}" alt=""></a>
									<div class="card-body">
										<h4 class="card-title">
											<a href="/product/${list.id}">${list.productNm}</a>
										</h4>
										<span style="color: #777777; text-decoration: line-through;"><fmt:formatNumber value="${list.price}" type="number"></fmt:formatNumber>원</span>
										<h5>
											<fmt:formatNumber value="${list.salePrice}" type="number"></fmt:formatNumber>
											원
										</h5>
										<p class="card-text">~${list.endDate}</p>
									</div>
									<div class="card-footer">
										<b style="color:#EBE028;">&#9733;</b> ${list.ratingAvg}
									</div>
								</div>
							</div>
							</c:when>
							
							<c:otherwise>
							<div class="col-lg-4 col-md-4 mb-4">
								<div class="card h-100">
									<a href="/product/${list.id}"><img class="card-img-top" style="max-width: 100%; height: auto;" src="${list.filePath}" alt=""></a>
									<div class="card-body">
										<h4 class="card-title">
											<a href="/product/${list.id}">${list.productNm}</a>
										</h4>
										<h5>
											<fmt:formatNumber value="${list.price}" pattern="#,###"></fmt:formatNumber>
											원
										</h5>
										<%-- <p class="card-text">${list.description}</p> 있으면 지저분함--%>
									</div>
									<div class="card-footer">
										<b style="color:#EBE028;">&#9733;</b> ${list.ratingAvg}
									</div>
								</div>
							</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
				</div>
				
				<hr>
					<!-- BEST3 END -->
				
				<!-- PRODUCT LIST END-->

			</div>
			<!-- /.col-lg-12 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>
