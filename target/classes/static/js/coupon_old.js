function couponSubmit() {

	var result = confirm("진행하시겠습니까?");
	if (result) {
		var id = $('#couponId').val();
		var insId = $('#insId').val();

		var formData = $("#couponForm").serialize();

		console.log("id : " + id);

		if (id > 0) {
			$.ajax({
				cache : false,
				url : "/admin/coupon/update",
				type : 'POST',
				data : formData,
				success : function(data) {
					var myTable = $('#couponTable').DataTable();
					myTable.ajax.reload();
					alert("수정이 완료되었습니다.");
				},
				error : function(error) {
					console.log("진입5");
					alert("error : " + error);
				}
			});

			return false;
		}

		$.ajax({
			cache : false,
			url : "/admin/coupon/insert",
			type : 'POST',
			data : formData,
			success : function(data) {
				var myTable = $('#couponTable').DataTable();
				myTable.ajax.reload();
				alert("신규 쿠폰을 발급하였습니다.");
			},
			error : function(error) {
				console.log("error : " + error);
				alert("상세정보를 모두 기입하십시오.");
			}
		});
		return false;

	} else {
		return false;
	}
}

loadTable();
/* DataTable */
function loadTable() {
	$(document).ready(function() {
		$('#couponTable').DataTable({
			processing : true,
			serverSide : false,
			paging : true,
			pagingType : "simple_numbers",
			ordering : true,
			info : true,
			filter : true,
			language : {
				"zeroRecords" : "데이터가 없습니다.",
				"lengthMenu" : "_MENU_ 개씩 보기",
				"search" : "검색:",
				"info" : "_PAGE_ / _PAGES_",
				"infoFiltered" : "(전체 _MAX_개의 데이터 중 검색결과)",
				"paginate" : {
					"previous" : "이전",
					"next" : "다음"
				}
			},
			ajax : {
				url : '/admin/coupon/list'
			},
			columns : [ {
				data : "code"
			}, {
				data : "description"
			}, {
				data : "amount"
			}, {
				data : "startDate"
			}, {
				data : "endDate"
			} ]
		});

		var table = $('#couponTable').DataTable();
		$('#couponTable tbody').on('click', 'tr', function() {
			var rowValue = table.row(this).data();
			$('#couponId').val(rowValue.id);
			$('#code').val(rowValue.code);
			$('#description').val(rowValue.description);
			$('#amount').val(rowValue.amount);
			$('#unitCd').val(rowValue.unitCd);
			$('#startDate').val(rowValue.startDate);
			$('#endDate').val(rowValue.endDate);
			$('#insId').val(rowValue.insId);
			$('#insertBtn').attr('disabled', 'true');
			$('#insertBtn').attr('style', 'opacity:0.3');
			$('#modifyBtn').removeAttr('disabled');
			$('#modifyBtn').removeAttr('style', 'opacity:0.3');

			var today = new Date();
			var dd = today.getDate() + '';
			var mm = today.getMonth() + 1 + ''; //January is 0!
			var yyyy = today.getFullYear() + '';
			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}
			today = yyyy + mm + dd;
			var endDate = $('#endDate').val();

			if (endDate - today < 0) {
				console.log("진입");
				$('#modifyBtn').attr('disabled', 'true');
				$('#modifyBtn').attr('style', 'opacity:0.3');
			}
		});

	});

}

/* 초기화 버튼 이벤트*/
$('#clearBtn').click(function() {
	$('.card-body form input').val("");
	$('.card-body form select').val("01");
	$('#couponId').val("0");
	$('#insId').val("0");
	$('#insertBtn').val("입력");
	$('#modifyBtn').val("수정");
	$('#modifyBtn').attr('disabled', 'true');
	$('#modifyBtn').attr('style', 'opacity:0.3');
	$('#insertBtn').removeAttr('disabled');
	$('#insertBtn').removeAttr('style', 'opacity:0.3');
});

/* 쿠폰번호발급(short UUID 출력) */
function guid() {
	function s4() {
		return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	}
	return s4() + s4() + s4() + s4();
}
function show_uuid() {
	document.getElementById('code').value = guid();
}
function reloadList() {
	$('#couponTable').DataTable().ajax.reload();
}
