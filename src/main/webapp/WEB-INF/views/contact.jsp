<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>
<!-- Page Content -->
<div class="container">
   <!----------------- MAP -------------------->
   <br>
   <div class="col-12">
      <div id="map" style="height: 480px;"></div>
      <!-- services와 clusterer, drawing 라이브러리 불러오기 -->
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=726751ea5a2e6d295e0cd9e91534d63a&libraries=services,clusterer,drawing"></script>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=726751ea5a2e6d295e0cd9e91534d63a"></script>
      <script>
         var markers = [
             {
                position: new kakao.maps.LatLng(35.156040, 129.059490),
               text: '부산IT교육센터'
             }
         ];

         var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
         
         var options = { //지도를 생성할 때 필요한 기본 옵션
            center : new kakao.maps.LatLng(35.156059, 129.059576), //지도의 중심좌표.
            level : 1, //지도의 레벨(확대, 축소 정도)
            marker : markers
         };
         
         var map = new kakao.maps.StaticMap(container, options); //지도 생성 및 객체 리턴

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
               <h3>부산IT교육센터</h3>
               <p>부산광역시 부산진구 부전2동 중앙대로 708, 부산 파이낸스센터 4~5층</p>
            </div>
         </div>
         <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
            <div class="media-body">
               <h3>051-753-5600</h3>
               <p>월~금, 오전 9시 ~ 오후 6시</p>
            </div>
         </div>
         <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-email"></i></span>
            <div class="media-body">
               <h4>admin@busanitshop.com</h4>
               <p>문의사항은 이메일로 보내주시기 바랍니다.</p>
            </div>
         </div>
      </div>
      <div class="col-lg-8"></div>
      <div class="col-lg-4"></div>

      <!-------------------- CONTACT END---------------------->
   </div>
</div>
<!-- /.container -->
<%@include file="/WEB-INF/views/include/footer.jsp"%>