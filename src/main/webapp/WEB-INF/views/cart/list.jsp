<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/nav.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://use.fontawesome.com/c560c025cf.js"></script>
<style>
.quantity {
    float: left;
    margin-right: 15px;
    background-color: #eee;
    position: relative;
    width: 80px;
    overflow: hidden
}

.quantity input {
    margin: 0;
    text-align: center;
    width: 15px;
    height: 15px;
    padding: 0;
    float: right;
    color: #000;
    font-size: 20px;
    border: 0;
    outline: 0;
    background-color: #F6F6F6
}

.quantity input.qty {
    position: relative;
    border: 0;
    width: 100%;
    height: 40px;
    padding: 0;
    text-align: center;
    font-weight: 400;
    font-size: 15px;
    border-radius: 0;
    background-clip: padding-box
}

.quantity .minus, .quantity .plus {
    line-height: 0;
    background-clip: padding-box;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    -webkit-background-size: 6px 30px;
    -moz-background-size: 6px 30px;
    color: #bbb;
    font-size: 20px;
    position: absolute;
    height: 50%;
    border: 0;
    right: 0;
    padding: 0;
    width: 25px;
    z-index: 3
}

.quantity .minus:hover, .quantity .plus:hover {
    background-color: #dad8da
}

.quantity .minus {
    bottom: 0
}
.shopping-cart {
    margin-top: 20px;
}
</style>
<div class="container">
   <div class="card shopping-cart">
            <div class="card-header bg-dark text-light">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                Shipping cart
                <a href="" class="btn btn-outline-info btn-sm pull-right">Continiu shopping</a>
                <div class="clearfix"></div>
            </div>
            <div class="card-body">
                    <!-- PRODUCT -->
                    <c:forEach var="list" items="${list}">
                    <div name="product${list.id}">
                    <div class="row">
                    	<input type="hidden" value="${list.id}" class="cartId" name="id">
                    	<input type="hidden" value="${list.productId}" id="productId" name="productId">
                        <div class="col-12 col-sm-12 col-md-2 text-center">
                                <img class="img-responsive" src="${list.filePath}" alt="prewiew" max-width="120" height="80">
                        		<br>
                        </div>
                        <div class="col-12 col-sm-12 text-md-center col-md-6">
                            <h6 class="product-name"><strong>${list.productNm}</strong></h6>
                        </div>
                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                            <div class="col-5 col-sm-5 col-md-5 text-md-right" style="padding-top: 5px">
                                <h6><strong>
                                ￦<fmt:formatNumber value="${list.price}"></fmt:formatNumber><input type="hidden" value="${list.price}" name="price" id="price">
                                </strong></h6>
                            </div>
                            
                            <div class="col-5 col-sm-5 col-md-5">
                                <div class="quantity">
                                    <input type="number" step="1" max="99" min="1" name="cnt"value="${list.cnt}" title="Qty" class="qty"
                                           size="4">
                                </div>
                            </div>
                            
                            <div class="col-2 col-sm-2 col-md-2 text-right">
                                <button type="button" name="delete" class="btn btn-outline-danger btn-xs">
                                    
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    	<hr>
                    </div>
                    </c:forEach>
                    <!-- END PRODUCT -->
                    <script>
                    $('button[name=delete]').click(function(){
                    	var n = $('button[name=delete]').index(this);
                    	var listId=$(".cartId:eq("+n+")").val();
                    	var id = 'id='+$(".cartId:eq("+n+")").val();
                    	$.ajax({
                    		url:"/cart/delete",
                    		type:"post",
                    		data:id,
                    		dataType:"json",
                    		success:function(data){
                    			$('div[name=product'+listId+']').remove();
                    		}
                    	})
                    })
                    </script>
                    
                <div class="pull-right">
                    <a href="" class="btn btn-outline-secondary pull-right">
                        Update shopping cart
                    </a>
                </div>
            </div>
            <div class="card-footer">
                <div class="coupon col-md-5 col-sm-5 no-padding-left pull-left">
                    <div class="row">
                        <div class="col-6">
                            <input type="text" class="form-control" placeholder="cupone code">
                        </div>
                        <div class="col-6">
                            <input type="submit" class="btn btn-default" value="Use cupone">
                        </div>
                    </div>
                </div>
                <div class="pull-right" style="margin: 10px">
                    <a href="" class="btn btn-success pull-right">Checkout</a>
                    <div class="pull-right" style="margin: 5px">
                        Total price: <b>50.00€</b>
                    </div>
                </div>
            </div>
        </div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>