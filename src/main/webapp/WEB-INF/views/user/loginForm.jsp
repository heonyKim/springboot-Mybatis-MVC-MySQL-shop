<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>	
<!-- <link rel="icon" type="image/png" href="/bootstrap/user/login/images/icons/favicon.ico"/> -->
<link rel="stylesheet" type="text/css" href="/bootstrap/user/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/user/login/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/user/login/css/util.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/user/login/css/main.css">


<!-- Page Content -->
<div class="container">

	<div class="row">
	
		<!--================login_part Area =================-->
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100">
					<form class="login100-form validate-form"
						action="/user/loginProcess" method="POST">
						<span class="login100-form-title p-b-26"> Welcome </span>
						<span class="login100-form-title p-b-48"> <i class="zmdi zmdi-font"></i></span>

						<div class="wrap-input100 validate-input" data-validate="Valid email is: a@b.c">
							Email
							<input class="input100" type="text" name="email">
							<span class="focus-input100" placeholder="Email"></span>
						</div>

						<div class="wrap-input100 validate-input" data-validate="Enter password">
							Password
							<span class="btn-show-pass" onclick="viewPassword()">
								<i class="fa fa-eye-slash fa-lg"></i>
							</span>
							<input class="input100" type="password" name="password">
							<span class="focus-input100" placeholder="Password"></span>
						</div>

						<div class="container-login100-form-btn">
							<div class="wrap-login100-form-btn">
								<div class="login100-form-bgbtn"></div>
								<button class="login100-form-btn" type="submit">Login</button>
							</div>
						</div>

						<div class="text-center p-t-115">
							<span class="txt1"> Don’t have an account? </span>
							<a class="txt2" href="/user/joinForm"> Sign Up </a>
						</div>
					</form>
				</div>
			</div>
		</div>


		<div id="dropDownSelect1"></div>
		<!--================login_part end =================-->

	</div>
	<!-- /.row -->

</div>
<!-- /.container -->
<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script>

function viewPassword(){
	var password=document.getElementsByName("password")[0];
	var type=password.getAttribute('type');
	var span=document.getElementsByClassName('btn-show-pass');
	
	if(type==='password'){
		password.setAttribute('type','text');
		$(".btn-show-pass").html("");
		$(".btn-show-pass").html("<i class='fa fa-eye fa-lg'></i>");
	}
	if(type==='text'){
		password.setAttribute('type','password');
		$(".btn-show-pass").html("");
		$(".btn-show-pass").html("<i class='fa fa-eye-slash fa-lg'></i>");
	}
}
</script>