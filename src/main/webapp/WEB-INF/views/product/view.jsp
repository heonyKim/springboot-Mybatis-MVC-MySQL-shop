<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>
<!-- rating Star CSS -->
<!-- <link rel="stylesheet" href="/css/ratingbar.css"> -->
<!-- style CSS -->

<style>
.pag-link {
	display: inline-block;
	vertical-align: middle;
}

.pag-link.disabled>span, .pag-link.current>span, .pag-link>a {
	display: block;
	border-radius: 50%;
	font-size: 10pt;
	color: #bbbbbb;
	line-height: 1.42857;
	margin-right: 5px;
	padding: 7px 13px;
	position: relative;
	text-decoration: none;
	border: none;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.pag-link:active>a, .pag-link:hover>a, .pag-link:focus>a, .pag-link.current>span
	{
	font-size: 10pt;
	font-weight: bold;
	padding: 7px 13px;
}

.pag-link>a {
	background-color: transparent;
	color: black;
	border: 1px solid #dddddd;
	cursor: pointer;
}

.pag-link.disabled>span, .pag-link.current>span {
	background-color: #2F7DFC;
	color: #fff;
	cursor: inherit;
}

.pag-link:active>a, .pag-link:hover>a, .pag-link:focus>a {
	background-color: #dddddd !important;
	color: #000;
}
</style>
<link rel="stylesheet" href="/css/style.css">

<!--================Single Product Area =================-->
<div class="product_image_area section_padding">
	<div class="container">
		<div class="row s_product_inner">
			<div class="col-lg-5">
				<div class="product_slider_img">
					<div id="vertical">
						<div style="text-align: center;">
							<c:if test="${product.filePath == null}">
								<img src="/bootstrap/admin/img/error.svg" style="max-width: 50%; height: auto; opacity: 0.5;">
							</c:if>
							<img src="${product.filePath}" style="max-width: 100%; height: auto;" />
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">

				<c:choose>
					<c:when test="${product.saleId>0}">
						<div class="s_product_text" style="text-align: right;">
							<div style="text-align: left;">
								<h3>${product.productNm}</h3>
								<span style="color: #777777; text-decoration: line-through;">
									정가 : <fmt:formatNumber value="${product.price}" type="number"></fmt:formatNumber>원
								</span>
								<h2 id="priceArea">
									<span
										<c:if test="${product.delDt!=null}">style="text-decoration:line-through; color:#00000040;"</c:if>>
										<span style="color: black; font-weight: 100; font-size: 13pt"><small>할인가</small></span>
										<span style="color: #FF0000;">
											<fmt:formatNumber value="${product.salePrice}" type="number"></fmt:formatNumber>원</span>
										<span style="color: white; font-weight: 100; font-size: 15pt; background-color: red;">
											<small>&nbsp;20%<i class="fa fa-caret-down"></i>&nbsp;</small>
										</span>
									</span>
								</h2>
								<ul class="list">
									<li>
										<a class="active" href="/product/list/${product.categoryCd}">
											<span>상품 카테고리</span> : ${product.categoryNm}
										</a>
									</li>
								</ul>
							</div>
					</c:when>
					<c:otherwise>
						<div class="s_product_text" style="text-align: right;">
							<div style="text-align: left;">
								<h3>${product.productNm}</h3>
								<h2 id="priceArea">
									<span
										<c:if test="${product.delDt!=null}"> style="text-decoration:line-through; color:#00000040;"</c:if>>
										<fmt:formatNumber value="${product.price}" type="number"></fmt:formatNumber>원
									</span>
								</h2>
								<ul class="list">
									<li>
										<a class="active" href="/product/list/${product.categoryCd}">
											<span>상품 카테고리</span> : ${product.categoryNm}
										</a>
									</li>
									<li></li>
								</ul>
							</div>
					</c:otherwise>
				</c:choose>
				<div class="card_area">
					<form action="/cart/add" method="post" onsubmit="return cartAlert();">
						<c:if test="${product.delDt==null }">
							<ul class="star-ratings" style="margin: 0; text-align: left;">
								<li class="star-ratings-top"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></li>
								<li class="star-ratings-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></li>
							</ul>
							<div style="text-align: left; margin-top: 15px;">
								<small id="productReviewShotText" style="color: black; font-size: 10pt;"></small>
							</div>
							<div class="product_count d-inline-block">
								<input type="hidden" value="${product.id}" name="productId" id="productId">
								<span class="inumber-decrement">
									<a style="cursor: pointer;" onclick="eaMinus()">
										<i class="fa fa-minus"></i>
									</a>
								</span>
								<input class="input-number" id="cnt" name="cnt" type="text" value="1" min="0" max="10" numberOnly>
								<span class="number-increment">
									<a style="cursor: pointer;" onclick="eaPlus()">
										<i class="fa fa-plus"></i>
									</a>
								</span>
							</div>
							<div class="add_to_cart">
								<input type="submit" value="장바구니에 담기" class="btn_3">
							</div>
						</c:if>
					</form>
				</div>
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
		<ul class="nav nav-tabs" id="myTab" role="tablist"
			style="text-align: center;">
			<li class="nav-item">
				<a class="nav-link  active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">
					상품설명
				</a>
			</li>
			<c:if test="${product.delDt==null }">
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" 
						role="tab" aria-controls="contact" aria-selected="false">
						상품리뷰
					</a>
				</li>
			</c:if>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
				<div class="container">
					<p align="center">${product.description}</p>
				</div>
			</div>

			<c:if test="${product.delDt==null }">
				<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-2"></div>
						<div class="col-lg-8">
							<c:choose>
								<c:when test="${commentQualifiedFlag == 1}">
									<div class="review_box" style="margin-bottom: 100px;">
										<h4>리뷰 남기기</h4>
										<p>별점:</p>
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
													<textarea class="form-control" name="content" id="content" rows="20" placeholder="내용을 작성하세요.">
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
								</c:when>

								<c:otherwise>
									<div class="comment_list">
										<div class="row total_rate">
											<div class="col-12">
												<div class="box_total" style="border-bottom: 0; background: transparent;">
													상품을 구매하시면 리뷰를 작성 하실 수 있습니다.
												</div>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>


							<div class="comment_list">
								<div class="row total_rate">
									<!-- <div class="col-3"></div> -->
									<div class="col-12">
										<div class="box_total">
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
									<!-- <div class="col-3"></div> -->
								</div>
								<br>
								<br>
								<div id="commentTotalArea">
									<!-- comment area start-->
									<input type="hidden" id="commentArea">
									<!-- comment area END -->

								</div>
								<!-- pagination bar -->
								<!-- <li class="pag-link current" id="page-link1"><span><a style="cursor:pointer;" onclick="commentLoad(1)">1</a></span></li> -->
								<!-- pagination bar END-->
							</div>
						</div>
						<div class="col-lg-2"></div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</section>
<!--================End Product Description Area =================-->

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script src="/js/star_barrating/jquery.barrating.min.js"></script>
<script src="/js/pagination.js"></script>
<script>
function cartAlert() {
	var cartAlert = confirm("장바구니에 담으시겠습니까?");
	if (cartAlert) {
		return true;
	} else {
		return false;
	}

}

function eaPlus() {
	var count = $('input[name=cnt]').val();
	if ($('input[name=cnt]').val() >= 1) {
		count++;
		$('input[name=cnt]').val(count);
	}
}

function eaMinus() {
	var count = $('input[name=cnt]').val();
	if ($('input[name=cnt]').val() > 1) {
		count--;
		$('input[name=cnt]').val(count);
	}
}

/* rating bar value*/
//change this to adjust the rating display
var bvTireRating = 2.5;
// multiply by 20 to get percentage

var productId = "productId=" + $("#productId").val();
var principalId = null;
principalId = ${principal.user.id}
commentLoad(1);

function commentLoad(page){
	$.ajax({
		async : false,
		url : "/comment/" + page,
		data : productId,
		type : 'POST',
		success : function(data) {
			var jsonComment = JSON.parse(data);
			var htmlComment = "";
			var productRatingSum = 0;
			var page = 0;
			$("#commentTotalArea").html("");
			$("#commentTotalArea").append("<input type='hidden' id='commentArea'>");
			$("#commentTotalArea").append("<hr>");
			if (jsonComment.length > 0) {
				for (i = 0; i < jsonComment.length; i++) {
					var commentId = jsonComment[i].id;
					productRatingSum += jsonComment[i].rating;
					htmlComment += "<hr><div class='review_item' style='margin-bottom:0px;' id='user_review_"+commentId+"'><div class='media'>";

					var emailStar = jsonComment[i].email;
					emailSplit = emailStar.split('@');
					emailStar = emailSplit[0].substring(0, 4);
					emailStar = emailStar + "****";
					
					if (jsonComment[i].email === "(탈퇴한 회원입니다)") {
						htmlComment += "<div class='media-body'><div><span>"+ jsonComment[i].email + "&nbsp;</span>";
					} else {
						htmlComment += "<div class='media-body'><div><span>" + emailStar + "&nbsp;</span>";
					}
					htmlComment += "<span style='font-weight:100; color:#999999;'>&nbsp;" + jsonComment[i].insDt + "</span></div>";
					htmlComment += "<div class='star-user-ratings' style='float:left; margin:0;'>"
					htmlComment += "<div style='width:" + ((jsonComment[i].rating) * 20) + "%;' class='star-user-ratings-top'><span>★</span>"
					htmlComment += "<span>★</span><span>★</span><span>★</span><span>★</span>"
					htmlComment += "</div><div class='star-user-ratings-bottom'><span>★</span><span>★</span>"
					htmlComment += "<span>★</span><span>★</span><span>★</span></div></div>"

					if (jsonComment[i].insId == principalId) {
						htmlComment += "<a class='delete_btn' style='cursor:pointer;' onclick='commentDelete(" + commentId + ")'>삭제</a>";
					}
					htmlComment += "<a style='display:none;' class='reply_btn' onclick='replyLoad(" + commentId + ")'>펼쳐보기</a></div></div>"
					htmlComment += "<p>" + jsonComment[i].content + "</p><br></div>";
				}
				setTimeout(function replyClick() {
					$(".reply_btn").trigger("click");
				}, 300);
				var productRatingMean = productRatingSum / jsonComment.length;
				$(".box_total h6").html("(" + (jsonComment.length) + "개의 리뷰)");
				$("#productReviewShotText").html("");
				$("#productReviewShotText").html(jsonComment.length + "개의 리뷰 / " + (productRatingMean/5*100).toFixed(2) + "% 만족");
				$(".box_total h4").html("");
				$(".box_total h4").html(productRatingMean.toFixed(2));
				$("#commentArea").after(htmlComment);

				var starRating = productRatingMean.toFixed(2) * 20;
				// set the width of the stars
				$('.star-ratings-top').width(starRating + '%');

			} else {
				$(".box_total h6").html("(리뷰가 없습니다.)");
				$(".box_total h4").html("0.0");
				$("#productReviewShotText").html("리뷰가 없습니다.");
				$('.star-ratings-top').width(0 + '%');
				$("#commentArea").after("<p>등록된 리뷰가 없습니다.</p>");
			}
		}
	});
}

function replyLoad(id) {
	var commentId="commentId="+id;
	$.ajax({
		async : false,
		url : "/comment/reply",
		data : commentId,
		type : 'POST',
		success : function(data) {
			var jsonReply = JSON.parse(data);
			var htmlReply = "";
			for (i = 0; i < jsonReply.length; i++) {
				htmlReply += "<div class='review_item reply' id='user_review_reply'>";
				htmlReply += "<div class='media'>";
				htmlReply += "<div class='media-body'><h4 style='color:blue;'>" + jsonReply[i].email + "</h4>";
				htmlReply += "<h5>" + jsonReply[i].insDt + "</h5></div></div>";
				htmlReply += jsonReply[i].content + "</div>";
			}
			$("#user_review_" + id).after(htmlReply);
		}
	});
}

$(function() {
	$('#rating').barrating({
		theme : 'css-stars'
	});
});

function commentWrite(){	
	var formData = $("#commentWrite").serialize();

	$.ajax({
		async : false,
		cache : false,
		url : "/comment/write",
		type : "POST",
		data : formData,
		success : function(data) {
			if (data == "success") {
				$("#commentTotalArea").html("");
				$("#commentTotalArea").append("<input type='hidden' id='commentArea'>");
				$("#commentTotalArea").append("<hr>");
				commentLoad();
				setTimeout(function replyClick() {
					$(".reply_btn").trigger("click");
				}, 500);
			}
		},
		error : function(error) {
			console.log("error : " + error);
		}
	});
}

function commentDelete(id) {
	var my_confirm = confirm('삭제하시겠습니까?');
	if (my_confirm) {
		id="id="+id;
		$.ajax({
			async : false,
			cache : false,
			url : "/comment/delete",
			type : "POST",
			data : id,
			success : function(data) {
				if (data == "success") {
					$("#commentTotalArea").html("");
					$("#commentTotalArea").append(
							"<input type='hidden' id='commentArea'>");
					$("#commentTotalArea").append("<hr>");
					commentLoad();
					setTimeout(function replyClick() {
						$(".reply_btn").trigger("click");
					}, 500);
				}
			},
			error : function(error) {
				console.log("error : " + error);
			}
		});
	} else {return false;}
}

$("input:text[numberOnly]").on("keyup", function() {
	$(this).val($(this).val().replace(/[^0-9]/g, ""));
});
</script>