<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/nav.jsp" %>

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
                <img src="${product.filePath}" style="width:458px; height:560px;"/>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-5 offset-lg-1">
          <div class="s_product_text">
            <h3>${product.productNm}</h3>
            <h2 id="priceArea"></h2>
            <ul class="list">
              <li>
                <a class="active" href="/product/list/${product.categoryCd}">
                  <span>Category</span> : ${product.categoryNm}
                 </a>
              </li>
              <li>
              </li>
            </ul>
            <div class="card_area">
            <form action="/cart/add" method="post">
              <div class="product_count d-inline-block">
                <span class="inumber-decrement"> <i class="fa fa-minus"></i></span>
                <input type="hidden" value="${product.id}" name="productId">
                <input class="input-number" name="cnt" type="text" value="1" min="0" max="10">
                <span class="number-increment"> <i class="fa fa-plus"></i></span>
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
          <a class="nav-link  active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
            aria-selected="true">Description</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
            aria-selected="false">Comments</a>
        </li>
       
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
        <div class="container">
          <p align="center">
            ${product.description}
          </p>
        </div>

        </div>
      
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
          <div class="row">
            <div class="col-lg-6">
              <div class="comment_list">
              <div class="row total_rate">
              	<!-- <div class="col-3"></div> -->
                <div class="col-12">
                  <div class="box_total" style="background-color:white;">
                    <h5>Overall</h5>
                    <h4>4.0</h4>
                    <ul class="list">
                      <li>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                          <i class="fa fa-star"></i>
                      </li>
                    </ul>
                    <h6>(03 Reviews)</h6>
                    
                  </div>
                </div>
               	<!-- <div class="col-3"></div> -->
              </div>
              <br><br>
                <div class="review_item">
                  <div class="media">
                  
                    <div class="media-body">
                      <h4>Comment</h4>
                      <h5>12th Feb, 2017 at 05:56 pm</h5>
                      <a class="reply_btn" href="#">Reply</a>
                    </div>
                  </div>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo
                  </p>
                </div>
                <div class="review_item reply">
                  <div class="media">
                   
                    <div class="media-body">
                      <h4>Comment22</h4>
                      <h5>12th Feb, 2017 at 05:56 pm</h5>
                      <a class="reply_btn" href="#">Reply</a>
                    </div>
                  </div>
                  <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco laboris nisi ut aliquip ex ea commodo
                  </p>
                </div>
                <hr>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="review_box">
                <h4>Post a comment</h4>
                <p>Your Rating:</p>
                <ul class="list">
                  <li>
                    <a href="#">
                      <i class="fa fa-star"></i>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-star"></i>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-star"></i>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-star"></i>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-star"></i>
                    </a>
                  </li>
                </ul>
                <form class="row contact_form" action="contact_process.php" method="post" id="contactForm"
                  novalidate="novalidate">
                  
                  <div class="col-md-12">
                    <div class="form-group">
                      <textarea class="form-control" name="message" id="message" rows="10"
                        placeholder="Message"></textarea>
                    </div>
                  </div>
                  <div class="col-md-12 text-right">
                    <button type="submit" value="submit" class="btn_3">
                      Submit Now
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>
  </section>
  <!--================End Product Description Area =================-->
	
	
	

<%@include file="/WEB-INF/views/include/footer.jsp" %>
<script>
 var price = numberWithCommas(${product.price});
	$('#priceArea').append("￦"+price);
</script>