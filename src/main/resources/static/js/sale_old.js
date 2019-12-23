function saleSubmit() {
	var result = confirm("진행하시겠습니까?");
	if(result) {
		var id = $("#saleId").val();
		var formData = $("#saleForm").serialize();

		if (id > 0) {
			$.ajax({
				cache : false,
				url : "/admin/sale/update",
				type : "POST",
				data : formData,
				success : function(data) {
					var myTable = $("#saleTable").DataTable();
					myTable.ajax.reload();
					alert("수정이 완료되었습니다.");
				},
				error : function(error) {
					alert("error : " + error);
				}
			});

			return false;
		}

		$.ajax({
			cache : false,
			url : "/admin/sale/insert",
			type : 'POST',
			data : formData,
			success : function(data) {
				var myTable = $('#saleTable').DataTable();
				myTable.ajax.reload();
				alert("할인적용을 완료하였습니다.");
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

/* 상품 카테고리(#productCategoryCd) 조회 */
$(document).ready(
		function() {
			$.ajax({
				url : "/admin/sale/load1",
				type : 'POST',
				success : function(data) {
					var json = JSON.parse(data);
					for (key in json) {
						$("#productCategoryCd").append(
								"<option value='" + json[key].code + "'>"
										+ json[key].codeNm + "</option>");
					}
				}
			})
		});

/* 상품 세부 조회 초반 */
load2DefaultSet();
function load2DefaultSet() {
	$(document).ready(
			function() {
				$.ajax({
					url : "/admin/sale/load2",
					type : 'POST',
					data : {
						Num : '01'
					},
					success : function(data) {
						var json = JSON.parse(data);
						for (key in json) {
							$("#productId").append(
									"<option value='" + json[key].id + "'>"
											+ json[key].productNm + " ("
											+ json[key].price + "원)"
											+ "</option>");
						}
					}
				});
			});
}

/* 상품세부조회 */
$(function() {
	$('#productCategoryCd').change(
			function() {
				var Num = this.value;
				$("#productId").html("");

				$.ajax({
					url : "/admin/sale/load2",
					type : 'POST',
					data : {
						Num : Num
					},
					success : function(data) {
						var json = JSON.parse(data);

						for (key in json) {
							$("#productId").append(
									"<option value='" + json[key].id + "'>"
											+ json[key].productNm + " ("
											+ json[key].price + "원)"
											+ "</option>");
						}
					}

				});

			});
});

/* DataTable */
$(document).ready(
		function() {
			$('#saleTable').DataTable({
				processing : true,
				serverSide : false,
				paging : true,
				pagingType : "simple_numbers",
				order: false,
				ordering: false,
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
					url : '/admin/sale/list'
				},
				columns : [
					{data : "productNm"},
					{data : "amount"},
					{data : "startDate"},
					{data : "endDate"}
				]
			});

			var table = $('#saleTable').DataTable();
			$('#saleTable tbody').on(
					'click',
					'tr',
					function() {
						var rowValue = table.row(this).data();
						console.log(rowValue);
						$("#productId").html("");
						$('#saleId').val(rowValue.id);
						$('#productCategoryCd').val(rowValue.categoryCd);
						$('#productId').append(
								"<option value='" + rowValue.productId + "'>"
										+ rowValue.productNm + " ("
										+ rowValue.price + "원)" + "</option>");
						$('#amount').val(rowValue.amount);
						$('#unitCd').val(rowValue.unitCd);
						$('#startDate').val(rowValue.startDate);
						$('#endDate').val(rowValue.endDate);
						$('#insId').val(rowValue.insId);
						$('#updId').val(rowValue.updId);
						$('#insertBtn').attr('disabled', 'true');
						$('#insertBtn').attr('style', 'opacity:0.3');
						$('#modifyBtn').removeAttr('disabled');
						$('#modifyBtn').removeAttr('style', 'opacity:0.3');

						var today = new Date();
						var dd = today.getDate() + '';
						var mm = today.getMonth() + 1 + ''; // January is 0!
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

/* 초기화 버튼 이벤트 */
$("#clearBtn").click(function() {
	$(".card-body form input").val("");
	$(".card-body form select").val("01");

	$("#saleId").val("0");
	$("#productId").html("");
	load2DefaultSet();
	$("#insertBtn").val("입력");
	$("#modifyBtn").val("수정");
	$("#modifyBtn").attr("disabled", "true");
	$("#modifyBtn").attr("style", "opacity:0.3");
	$("#insertBtn").removeAttr("disabled");
	$("#insertBtn").removeAttr("style", "opacity:0.3");
});
