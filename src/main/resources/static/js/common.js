function getDateFormat(date) {
	var chgDate = new Date(date);

	var year = chgDate.getFullYear();

	var month = chgDate.getMonth() + 1;
	if (month < 10){
		month = '0' + month;
	}
	
	var date = chgDate.getDate();
	if (date < 10){
		date = '0' + date;
	}
	
	var hour = chgDate.getHours();
	if (hour < 10){
		hour = '0' + hour;
	}
	
	var min = chgDate.getMinutes();
	if (min < 10){
		min = '0' + min;
	}
	
	return year + "-" + month + "-" + date + " " + hour + ":" + min;
}

function codeRequest(code){
	var categoryCdHtml = "";
	
	$.ajax({
		async: false,
		url: "/code/" + code,
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			$.each(data, function(index, item){
				if(item.id != 0 && typeof(item.id) != "undefined"){
					categoryCdHtml += `<option value="` + item.code + `">` + item.codeNm + `</option>`;
				} else {
					categoryCdHtml += `<option value="00">조회실패</option>`;
				}
			});
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
	
	return categoryCdHtml;
}

function codeRequestData(code){
	var codeList = [];
	
	$.ajax({
		async: false,
		url: "/code/" + code,
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			$.each(data, function(index, item){
				if(item.id != 0 && typeof(item.id) != "undefined"){
					codeList.push(item.code + ":" + item.codeNm);
				} else {
					codeList.push("00:조회실패");
				}
			});
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
	
	return codeList;
}

function getCodeNm(codeGbn, code){
	var codeNm = "";
	
	$.ajax({
		async: false,
		url: "/code/" + codeGbn + "/" + code,
		type: "get", 
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data: false,
		dataType: "json",
		success: function(data){
			codeNm = data.codeNm;
		},
		error: function(request, status, error){
			console.log("code:" + request.status);
			console.log("message:" + request.responseText);
			console.log("error:" + error);
		}
	});
	
	return codeNm;
}

function number_format(number, decimals, dec_point, thousands_sep) {
	// * example: number_format(1234.56, 2, ',', ' ');
	// * return: '1 234,56'
	number = (number + '').replace(',', '').replace(' ', '');
	var n = !isFinite(+number) ? 0 : +number, prec = !isFinite(+decimals) ? 0
			: Math.abs(decimals), sep = (typeof thousands_sep === 'undefined') ? ','
			: thousands_sep, dec = (typeof dec_point === 'undefined') ? '.'
			: dec_point, s = '', toFixedFix = function(n, prec) {
		var k = Math.pow(10, prec);
		return '' + Math.round(n * k) / k;
	};
	// Fix for IE parseFloat(0.55).toFixed(0) = 0;
	s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	if (s[0].length > 3) {
		s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	}
	if ((s[1] || '').length < prec) {
		s[1] = s[1] || '';
		s[1] += new Array(prec - s[1].length + 1).join('0');
	}
	return s.join(dec);
}