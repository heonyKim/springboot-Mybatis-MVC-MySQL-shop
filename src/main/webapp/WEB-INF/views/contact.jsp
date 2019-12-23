<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/nav.jsp" %>
	<!-- Page Content -->
	<div class="container">
	
	<!----------------- MAP -------------------->
		<br>
		<div class="col-12">
		<div id="map" style="height:480px;"></div>
			<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=726751ea5a2e6d295e0cd9e91534d63a&libraries=services,clusterer,drawing"></script>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=726751ea5a2e6d295e0cd9e91534d63a"></script>
			<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(35.156059, 129.059576), //지도의 중심좌표.
				level: 1 //지도의 레벨(확대, 축소 정도)
			};
	
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		</script>
		</div>
      <!----------------- MAP END -------------------->
      <br>
		<div class="row">
		<!-------------------- CONTACT ---------------------->
				<div class="col-12">
 			<div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-home"></i></span>
            <div class="media-body">
              <h3>Buttonwood, California.</h3>
              <p>Rosemead, CA 91770</p>
            </div>
          </div>
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
            <div class="media-body">
              <h3>00 (440) 9865 562</h3>
              <p>Mon to Fri 9am to 6pm</p>
            </div>
          </div>
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-email"></i></span>
            <div class="media-body">
              <h3>support@colorlib.com</h3>
              <p>Send us your query anytime!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-8">
        
        </div>
        <div class="col-lg-4">
          
        </div>

		<!-------------------- CONTACT END---------------------->
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>
	