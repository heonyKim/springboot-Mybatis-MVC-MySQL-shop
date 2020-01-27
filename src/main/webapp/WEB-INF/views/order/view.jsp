<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" rel="stylesheet">
<section class="confirmation_part section_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-sm-12">
				<h3 class="mb-4">주문 정보 <span style="font-size:1rem;">(주문번호 : ${orderNo})</span></h3>
				<table class="table" style="width:100%;">
					<thead>
						<tr>
							<th style="width:60%;">상품</th>
							<th style="width:auto; padding-left: 0;padding-right: 0;">수량</th>
							<th style="width:20%;">금액</th>
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
					결제 금액 : <b><span id="resultAmt"></span>원</b>
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
				<div class="col-md-12 form-group">
					배송상태 : <span id="deliveryNm"></span>
				</div>
			</div>
			
			<div class="col-md-12 form-group">
				<button type="button" id="btnList" class="btn btn-info pull-right" style="margin-bottom: 15px;">목록</button>
			</div>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script src="/js/order.js"></script>
<script>
	orderResult("${orderNo}");
	
	$("#btnList").on("click", function(){
		location.href="/order/list";
	});
</script>