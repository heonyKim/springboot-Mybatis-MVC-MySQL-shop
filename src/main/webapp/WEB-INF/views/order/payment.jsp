<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/nav.jsp" %>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/bootstrap/user/order/flaticon.css">
<link rel="stylesheet" href="/bootstrap/user/order/themify-icons.css">
<link rel="stylesheet" href="/bootstrap/user/order/nice-select.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="/bootstrap/user/order/magnific-popup.css">

<!-- style CSS -->
<link rel="stylesheet" href="/bootstrap/user/order/style.css">

<!--================Checkout Area =================-->
  <section class="checkout_area section_padding">
    <div class="container">
      
      <div class="billing_details">
        <div class="row">
          <div class="col-lg-8">
            <h3>Billing Details</h3>
            <form class="row contact_form" action="#" method="post" novalidate="novalidate">
              <div class="col-md-6 form-group">
                <input type="text" class="form-control" id="first" name="name" placeholder="First name"/>
              </div>
              <div class="col-md-6 form-group">
                <input type="text" class="form-control" id="last" name="name" placeholder="Last name"/>
              </div>
              <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="company" name="company" placeholder="Company name" />
              </div>
              <div class="col-md-6 form-group">
                <input type="text" class="form-control" id="number" name="number" placeholder="Phone number"/>
              </div>
              <div class="col-md-6 form-group">
                <input type="email" class="form-control" id="email" name="compemailany" placeholder="Email Address"/>
              </div>
              <div class="col-md-12 form-group">
                <select class="country_select">
                  <option value="1">Country</option>
                  <option value="2">Country</option>
                  <option value="3">Country</option>
                </select>
              </div>
              <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="add1" name="add1" placeholder="Address line 01"/>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="add2" name="add2" placeholder="Address line 02"/>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="city" name="city" placeholder="Town/City"/>
              </div>
              <div class="col-md-12 form-group p_star">
                <select class="country_select">
                  <option value="1">District</option>
                  <option value="2">District</option>
                  <option value="3">District</option>
                </select>
              </div>
              <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="zip" name="zip" placeholder="Postcode/ZIP" />
              </div>
              <div class="col-md-12 form-group">
                <div class="creat_account">
                  <input type="checkbox" id="f-option2" name="selector" />
                  <label for="f-option2">Create an account?</label>
                </div>
              </div>
              <div class="col-md-12 form-group">
                <div class="creat_account">
                  <h3>Shipping Details</h3>
                  <input type="checkbox" id="f-option3" name="selector" />
                  <label for="f-option3">Ship to a different address?</label>
                </div>
                <textarea class="form-control" name="message" id="message" rows="1"
                  placeholder="Order Notes"></textarea>
              </div>
            </form>
          </div>
          <div class="col-lg-4">
            <div class="order_box">
              <h2>Your Order</h2>
              <ul class="list">
                <li>
                  <a href="#">Product
                    <span>Total</span>
                  </a>
                </li>
                <li>
                  <a href="#">Fresh Blackberry
                    <span class="middle">x 02</span>
                    <span class="last">$720.00</span>
                  </a>
                </li>
                <li>
                  <a href="#">Fresh Tomatoes
                    <span class="middle">x 02</span>
                    <span class="last">$720.00</span>
                  </a>
                </li>
                <li>
                  <a href="#">Fresh Brocoli
                    <span class="middle">x 02</span>
                    <span class="last">0</span>
                  </a>
                </li>
              </ul>
              <ul class="list list_2">
                <li>
                  <a href="#">Subtotal
                    <span>$2160.00</span>
                  </a>
                </li>
                <li>
                  <a href="#">Shipping
                    <span>Flat rate: $50.00</span>
                  </a>
                </li>
                <li>
                  <a href="#">Total
                    <span>$2210.00</span>
                  </a>
                </li>
              </ul>
              <div class="payment_item">
                <div class="radion_btn">
                  <input type="radio" id="f-option5" name="selector" />
                  <label for="f-option5">Check payments</label>
                  <div class="check"></div>
                </div>
                <p>
                  Please send a check to Store Name, Store Street, Store Town,
                  Store State / County, Store Postcode.
                </p>
              </div>
              <div class="payment_item active">
                <div class="radion_btn">
                  <input type="radio" id="f-option6" name="selector" />
                  <label for="f-option6">Paypal </label>
                  <img src="img/product/single-product/card.jpg" alt="" />
                  <div class="check"></div>
                </div>
                <p>
                  Please send a check to Store Name, Store Street, Store Town,
                  Store State / County, Store Postcode.
                </p>
              </div>
              <div class="creat_account">
                <input type="checkbox" id="f-option4" name="selector" />
                <label for="f-option4">I’ve read and accept the </label>
                <a href="#">terms & conditions*</a>
              </div>
              <a class="btn_3" href="#">Proceed to Paypal</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->

  <!--::footer_part end::-->


  <!-- easing js -->
  <script src="/bootstrap/user/order/jquery.magnific-popup.js"></script>
  <script src="/bootstrap/user/order/jquery.nice-select.min.js"></script>

  <!-- custom js -->
  <script src="/bootstrap/user/order/custom.js"></script>
<%@include file="/WEB-INF/views/include/footer.jsp" %>