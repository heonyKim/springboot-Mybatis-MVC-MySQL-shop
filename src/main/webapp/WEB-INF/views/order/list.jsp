<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>

<section class="confirmation_part section_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="mb-4">주문 정보</h3>
				<table class="table" id="orderTable">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>주문내역</th>
							<th>주문일자</th>
							<th>결제금액</th>
							<th>배송상태</th>
						</tr>
					</thead>
					<tbody id="orderList">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script src="/js/order.js"></script>
<script>
	$(document).ready(function() {
		orderListAll();
		
		$("#orderTable").on("click", "tr", function(){
			location.href = "/order/view/" + $(this).children().eq(0).text();
		});
	});
</script>