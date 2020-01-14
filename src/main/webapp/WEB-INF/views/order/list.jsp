<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.semanticui.min.css" rel="stylesheet">
<section class="confirmation_part section_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="mb-4">주문 정보</h3>
				<table class="ui table" id="orderTable" style="width:100%">
					<thead>
						<tr>
							<th style="color:#007bff;">주문번호</th>
							<th style="color:#007bff;">주문내역</th>
							<th style="color:#007bff;">주문일자</th>
							<th style="color:#007bff;">결제금액</th>
							<th style="color:#007bff;">배송상태</th>
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
		$("#orderTable tbody tr").css("cursor","pointer");
		$("#orderTable").on("click", "tr", function(){
			location.href = "/order/view/" + $(this).children().eq(0).text();
		});
	});
</script>