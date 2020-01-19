<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/nav.jsp" %>
<!-- rating Star CSS -->
<!-- <link rel="stylesheet" href="/css/ratingbar.css"> -->
<!-- style CSS -->
<link rel="stylesheet" href="/css/style.css">

<!--================Single Product Area =================-->
<div class="product_image_area section_padding">
	<div class="container">
		<div class="row s_product_inner">
			<div class="col-lg-5">
				<div class="product_slider_img">
					<div id="vertical">
						<div>
							<img src="${product.filePath}" style="width: 458px; height: 560px;" />
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5 offset-lg-1">
				<div class="s_product_text">
					<h3>${product.productNm}</h3>
					<h2 id="priceArea"></h2>
					<ul class="list">
						<li><a class="active" href="/product/list/${product.categoryCd}">
								<span>Category</span> : ${product.categoryNm}
							</a>
						</li>
						<li></li>
					</ul>
					<div class="card_area">
						<form action="/cart/add" method="post">
							<div class="product_count d-inline-block">
								<input type="hidden" value="${product.id}" name="productId" id="productId">
								<input type="hidden" value="${product.salePrice}">
								<span class="inumber-decrement">
									<a style="cursor: pointer;" onclick="eaMinus()">
										<i class="fa fa-minus"></i>
									</a>
								</span>
								<input class="input-number" id="cnt" name="cnt" type="text" value="1" min="0" max="10">
								<span class="number-increment">
									<a style="cursor: pointer;" onclick="eaPlus()">
										<i class="fa fa-plus"></i>
									</a>
								</span>
							</div>
							<div class="add_to_cart">
								<input type="submit" value="카트에 담기" class="btn_3">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--================End Single Product Area =================-->
<hr>
<!--================Product Description Area =================-->
<section class="product_description_area">
	<div class="container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item">
				<a class="nav-link  active" id="home-tab" data-toggle="tab" href="#home"
				role="tab" aria-controls="home" aria-selected="true">Description</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact"
				role="tab" aria-controls="contact" aria-selected="false">Comments</a>
			</li>
		</ul>
		
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
				<div class="container">
					<p align="center">${product.description}</p>
				</div>
			</div>

			<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
				<div class="row">
					<div class="col-lg-6">
						<div class="comment_list">
							<div class="row total_rate">
								<div class="col-12">
									<div class="box_total" style="background-color: white;">
										<h5>Overall</h5>
										<h4>4.0</h4>
										<h6></h6>
										<div class="star-ratings">
											<div class="star-ratings-top">
												<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
											</div>
											<div class="star-ratings-bottom">
												<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<br>
							<br>
							<div id="commentTotalArea">
							
								<!-- comment area start-->
								<input type="hidden" id="commentArea">
								<!-- comment area end -->
								<hr>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<c:if test="${principal.user != null}">
							<div class="review_box">
								<h4>Post a comment</h4>
								<p>Your Rating:</p>
								<form class="row contact_form" id="commentWrite" novalidate="novalidate">
									<div id="ratingDiv" style="margin-top: -20px; margin-left: 10px; margin-bottom: 20px;">
										<select id="rating" name="rating">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>
									<input type="hidden" name="productId" value="${product.id}">
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="content" id="content" rows="10" placeholder="Message">
											</textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="button" onclick="commentWrite();" class="btn_3">
											등록
										</button>
									</div>
								</form>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================End Product Description Area =================-->


<%@include file="/WEB-INF/views/include/footer.jsp" %>
<script src="/js/star_barrating/jquery.barrating.min.js"></script>
<script>

function eaPlus(){
	var count=$('input[name=cnt]').val();
	if($('input[name=cnt]').val()>=1){
		count++;
		$('input[name=cnt]').val(count);
	}
}

function eaMinus(){
	var count=$('input[name=cnt]').val();
	if($('input[name=cnt]').val()>1){
		count--;
		$('input[name=cnt]').val(count);
	}
}

/* rating bar value*/
//change this to adjust the rating display
var bvTireRating = 2.5;
// multiply by 20 to get percentage

var price = numberWithCommas(${product.salePrice});
$('#priceArea').append("￦"+price);

var productId="productId="+$("#productId").val();
var principalId=null;
principalId=${principal.user.id}
commentLoad();

function commentLoad(){
	$.ajax({
		async:false,
		url:"/comment",
		data:productId,
		type:'POST',
		success:function(data){
			var jsonComment = JSON.parse(data);
			var htmlComment="";
			var productRatingSum = 0;
			if(jsonComment.length > 0){
			for(i=0; i<jsonComment.length; i++){
				var commentId = jsonComment[i].id;
				productRatingSum += jsonComment[i].rating;
				htmlComment += "<hr>";
				htmlComment += "<div class='review_item' id='user_review_"+commentId+"'>";
				htmlComment += "<div class='media'>";
				htmlComment += "<div class='media-body'>";
				htmlComment += "<h4>"+jsonComment[i].email+"</h4>";
				htmlComment += "<h5>"+jsonComment[i].insDt + "</h5>";
				htmlComment += "<div class='star-user-ratings' style='float:left;'>";
				htmlComment += "<div style='width:"+((jsonComment[i].rating)*20)+"%;' class='star-user-ratings-top'>";
				htmlComment += "<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>";
				htmlComment += "</div><div class='star-user-ratings-bottom'>";
				htmlComment += "<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>";
				htmlComment += "</div></div>";
				
				if(jsonComment[i].insId==principalId){
				htmlComment += "<a class='delete_btn' style='cursor:pointer;' onclick='commentDelete("+commentId+")'>삭제</a>";	
				}
				htmlComment += "<a style='display:none;' class='reply_btn' onclick='replyLoad("+commentId+")'>펼쳐보기</a></div></div>"
				htmlComment += "<p>"+jsonComment[i].content+"</p><br></div>";
			}
			var productRatingMean=productRatingSum/jsonComment.length;
			$(".box_total h6").html("("+(jsonComment.length)+"개의 리뷰)");
			$(".box_total h4").html("");
			$(".box_total h4").html(productRatingMean.toFixed(2));
			$("#commentArea").after(htmlComment);

			var starRating = productRatingMean.toFixed(2)*20;
			// set the width of the stars
			$('.star-ratings-top').width(starRating+'%'); 
			} else {
				$(".box_total h6").html("(리뷰가 없습니다.)");
				$(".box_total h4").html("0.0");
				$('.star-ratings-top').width(0+'%'); 
				$("#commentArea").after("<p>등록된 댓글이 없습니다.</p>");
			}
		}
	});
}

function replyLoad(id){
	var commentId="commentId="+id;
	$.ajax({
		async:false,
		url:"/comment/reply",
		data:commentId,
		type:'POST',
		success:function(data){
			var jsonReply = JSON.parse(data);
			var htmlReply = "";
			for(i=0; i<jsonReply.length; i++){
				htmlReply += "<div class='review_item reply' id='user_review_reply'>";
				htmlReply += "<div class='media'>";
				htmlReply += "<div class='media-body'><h4 style='color:blue;'>"+jsonReply[i].email+"</h4>";
				htmlReply += "<h5>"+jsonReply[i].insDt + "</h5></div></div>";
				htmlReply += "<p>"+jsonReply[i].content+"</p><div>";
			}
			$("#user_review_"+id).after(htmlReply);
		}
	});
}

setTimeout(function replyClick(){
	$(".reply_btn").trigger("click");	
},500);

$(function() {
	$('#rating').barrating({
		theme: 'css-stars'
	});
});


function commentWrite(){
	var formData = $("#commentWrite").serialize();
	$.ajax({
		async:false,
		cache : false,
		url : "/comment/write",
		type : "POST",
		data : formData,
		success : function(data) {
			if(data=="success"){
				$("#commentTotalArea").html("");
				$("#commentTotalArea").append("<input type='hidden' id='commentArea'>");
				$("#commentTotalArea").append("<hr>");
				commentLoad();
				setTimeout(function replyClick(){
					$(".reply_btn").trigger("click");	
				},500);
			}
		},
		error : function(error) {
			console.log("error : " + error);
		}
	});
}

function commentDelete(id){
	var my_confirm = confirm('삭제하시겠습니까?');
	if(my_confirm){
		id="id="+id;
		$.ajax({
			async:false,
			cache : false,
			url : "/comment/delete",
			type : "POST",
			data : id,
			success : function(data) {
				if(data=="success"){
					$("#commentTotalArea").html("");
					$("#commentTotalArea").append("<input type='hidden' id='commentArea'>");
					$("#commentTotalArea").append("<hr>");
					commentLoad();
					setTimeout(function replyClick(){
					$(".reply_btn").trigger("click");	
					},500);
				}
			},
			error : function(error) {
			console.log("error : " + error);
			}
		});
	}else{
		return false;
	}
}
</script>