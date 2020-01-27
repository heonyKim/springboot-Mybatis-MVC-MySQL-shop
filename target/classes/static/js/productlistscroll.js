
var page = 6;
var categoryCd = $("#categoryCd").val();
$(window).scroll(function() {
	
	if ($(window).scrollTop()+1>=($(document).height()-window.innerHeight)) {
		$('html, body').css('overflow', '');
		$('html, body').css({'overflow': 'hidden'});
		$(window).on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
		
    	$.ajax({
    		async:false,
    		url:`/product/category/list/${categoryCd}/${page}`,
    		type:"POST",
    		success:async function(data){
    			var listAll = JSON.parse(data);
    			if(listAll.length<=0){
    				$('html, body').css('overflow', '');
    				$(window).off('scroll touchmove mousewheel');
    				return false;
    			}
    			

				$("#loading").fadeIn();
    			await setTimeout(function(){
    				for(var i=0;i<listAll.length;i++){
        				var html="";
        				var price=listAll[i].price;
        				if(listAll[i].saleId>0){
        					html+=`<div class='col-lg-4 col-md-4 mb-4'><div class='card h-100'>`;
        					html+=`<div class="thumbnail-wrapper"><div class="thumbnail"><div class="thumbnail-centered"><a href="/product/${listAll[i].id}">`;
        					html+=`<img class="thumbnail-img"src="${listAll[i].filePath}" alt=""></a></div></div></div>`;
        					html+=`<div class='card-body'><h4 class='card-title'><a style="font-size: 1.0rem;font-weight:600;" href='/product/${listAll[i].id}'>${listAll[i].productNm}</a>`;
        					html+=`</h4><span style='color: #777777; text-decoration: line-through;'>`;
        					html+=`${numberWithCommas(listAll[i].price)}원</span>`;
        					html+=`<h5><span style="color: #FF0000;">${numberWithCommas(listAll[i].salePrice)}원</span>`;
        					html+=`</h5><p class='card-text'>~${listAll[i].endDate}</p></div><div class='card-footer'>`;
        					if(listAll[i].ratingAvg!=0.0){
        						html+=`<b style='color:#EBE028;'>&#9733;</b>${(listAll[i].ratingAvg).toFixed(2)}`;
        					}else{
        						html+=`<small>리뷰가 없습니다</small>`;
        					}
        					html+=`</div></div></div>`;
        				}else{
        					html+=`<div class='col-lg-4 col-md-4 mb-4'><div class='card h-100'>`;
        					html+=`<div class="thumbnail-wrapper"><div class="thumbnail"><div class="thumbnail-centered"><a href="/product/${listAll[i].id}">`;
        					html+=`<img class="thumbnail-img"src="${listAll[i].filePath}" alt=""></a></div></div></div>`;
        					html+=`<div class='card-body'><h4 class='card-title'><a href='/product/${listAll[i].id}'>${listAll[i].productNm}</a>`;
        					html+=`</h4><h5>${numberWithCommas(listAll[i].price)}원`;
        					html+=`</h5></div><div class='card-footer'>`;
        					if(listAll[i].ratingAvg!=0.0){
        						html+=`<b style='color:#EBE028;'>&#9733;</b>${(listAll[i].ratingAvg).toFixed(2)}`;
        					}else{
        						html+=`<small>리뷰가 없습니다</small>`;
        					}
        					html +=`</div></div></div>`;
        				}
        				$("#categoryProductArea").append(html);
        			}$("#loading").fadeOut();
        			$('html, body').css('overflow', '');
    			},1000);
    			page=page+6;
    		}
    	});
    }
});


