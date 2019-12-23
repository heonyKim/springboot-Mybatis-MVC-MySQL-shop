<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/nav.jsp" %>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/bootstrap/user/join/css/roboto-font.css">
<!-- Main Style Css -->
<link rel="stylesheet" href="/bootstrap/user/join/css/style.css" />
<div class="container">

	<div class="row">

		<!-- /.col-lg-3 -->


		
		<div class="page-content">
			<div class="form-v5-content">
				<form class="form-detail" action="#" method="post">
					<h2>회원정보수정 페이지</h2>
					<div class="form-row">
						<label for="full-name">Full Name</label>
						<input type="text" name="full-name" id="full-name" class="input-text" placeholder="Your Name" required>
						<i class="fas fa-user"></i>
					</div>
					<div class="form-row">
						<label for="your-email">Your Email</label>
						<input type="text" name="email" id="your-email" class="input-text" placeholder="Your Email" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}">
						<i class="fas fa-envelope"></i>
					</div>
					<div class="form-row">
						<label for="password">Password</label>
						<input type="password" name="password" id="password" class="input-text" placeholder="Your Password" required>
						<i class="fas fa-lock"></i>
					</div>
					<div class="form-row-last">
						<input type="submit" name="register" class="register" value="가입">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- /.row -->

</div>
<!-- /.container -->
<%@include file="/WEB-INF/views/include/footer.jsp"%>
