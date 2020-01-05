<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<section class="checkout_area section_padding">
	<div class="container">
		<div class="billing_details">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="mt-3 mb-4">주문 정보</h3>
					<table class="table">
						<thead>
							<tr>
								<th>상품</th>
								<th>가격</th>
								<th>수량</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody id="cartList">
						</tbody>
					</table>
					
					<h3 class="mt-5 mb-4">배송 정보</h3>
					<form method="post" novalidate="novalidate">
						<div class="col-md-12 form-group">
							<label for="name">수령인</label>
							<input type="text" class="form-control" id="name" name="name" placeholder="수령인을 입력하세요." />
						</div>
						<div class="col-md-12 form-group">
							<label for="phone">연락처</label>
							<input type="text" class="form-control" id="phone" name="phone" placeholder="연락처를 입력하세요." value="${principal.user.phone}" />
						</div>
						<div class="col-md-12 form-group">
							<label for="addr">배송지</label>
							<input type="text" class="form-control" id="addr" name="addr" placeholder="배송지를 입력하세요." value="${principal.user.addr}" />
						</div>
					</form>
					
					<h3 class="mt-5 mb-4">결제 정보</h3>
					<form method="post" novalidate="novalidate">
						<div class="col-md-12 form-group">
							<label for="paymentCd">결제수단</label><br />
							&nbsp; <input type="radio" id="rdCash" name="paymentCd" />
							<label for="rdCash">현금</label>
							&nbsp; <input type="radio" id="rdCard" name="paymentCd" />
							<label for="rdCard">카드</label>
						</div>
						<div class="col-md-12 form-group">
							<button type="button" class="btn btn-info pull-right" style="margin-bottom: 15px;">주문하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script src="/js/order.js"></script>
<script>
	orderCartList();
</script>