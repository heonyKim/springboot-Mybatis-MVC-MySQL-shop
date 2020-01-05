<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>

<section class="confirmation_part section_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="order_details_iner">
					<h3 class="text-center">결제가 성공적으로 완료되었습니다.</h3>
					<h3 class="text-center">주문해 주셔서 감사합니다.</h3>
				</div>
				
				<h3 class="mt-5 mb-4">주문 정보</h3>
				<table class="table">
					<thead>
						<tr>
							<th>상품</th>
							<th>수량</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody id="orderList">
					</tbody>
				</table>
			</div>
			<div class="col-lg-6 mb-4">
				<h3 class="mt-5 mb-4">결제 정보</h3>
				<div class="col-md-12 form-group">
					결제수단 : <span id="paymentNm"></span>
				</div>
				<div class="col-md-12 form-group">
					상품 총 금액 : <span id="amount"></span>원
				</div>
				<div class="col-md-12 form-group">
					할인 금액 : <span id="discountAmt"></span>원
				</div>
				<div class="col-md-12 form-group">
					결제 금액 : <span id="resultAmt"></span>원
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<h3 class="mt-5 mb-4">배송 정보</h3>
				<div class="col-md-12 form-group">
					수령인 : <span id="recipient"></span>
				</div>
				<div class="col-md-12 form-group">
					연락처 : <span id="phone"></span>
				</div>
				<div class="col-md-12 form-group">
					배송지 : <span id="addr"></span>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script src="/js/order.js"></script>
<script>
	orderResult("${orderNo}");
</script>