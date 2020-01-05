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
					<div class="col-lg-12"><h1 class="my-4">SALE</h1></div>
					<c:forEach var="saleList" items="${saleList}">
					<div class="col-lg-4 col-md-4 mb-4">
								<div class="card h-100">
									<a href="/product/${saleList.id}"><img class="card-img-top" src="${saleList.filePath}" alt=""></a>
									<div class="card-body">
										<h4 class="card-title">
											<a href="/product/${saleList.id}">[할인]${saleList.productNm}</a>
										</h4>
										<span style="color: #777777; text-decoration: line-through;"><fmt:formatNumber value="${saleList.price}" type="number"></fmt:formatNumber>원</span>
										<h5>
											<fmt:formatNumber value="${saleList.salePrice}" type="number"></fmt:formatNumber>
											원
										</h5>
										<p class="card-text">~${saleList.endDate}</p>
									</div>
									<div class="card-footer">
										<b style="color:#EBE028;">&#9733;</b> ${saleList.ratingAvg}
									</div>
								</div>
							</div>
					</c:forEach>
					
				</div>
				
				<hr>
					<!-- BEST3 END -->
				
			</div>
			<!-- /.col-lg-12 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>
