function imp(orderNo, amount, recipient){
//	alert(orderNo, amount, recipient);
	IMP.request_pay({
	    pg : 'kcp',
	    pay_method : 'card',
	    merchant_uid : orderNo,
	    name : orderNo,
	    amount : amount,
	    buyer_name : recipient,
	    m_redirect_url : 'http://localhost:8080/order/result/' + orderNo
	}, function(rsp) {
	    if ( rsp.success ) {
	    	updatePayment(orderNo, "02");
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    return msg;
	});
}