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
			<div class="form-v5-content"><
				<form class="form-detail" action="/user/join" method="post" onsubmit="return joinFormCheck()">
					<h2>회원가입 페이지</h2>
					<!-- emailFlag : 0이면 가입불가, 1이면 가입가능 -->
					<input type="hidden" name="emailFlag" id="emailFlag" value="0">
					<div class="form-row">
						<label for="your-email">Email</label>
						<a href="#your-email" id="emailCheck" class="btn btn-dark" style="width:70px; height:25px; text-align:center; margin-left:10px; padding-top:0px;">확인</a>
						<input type="text" name="email" id="your-email" class="input-text" placeholder="Email" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}">
						<!-- <i class="fas fa-envelope"></i> -->
					</div>
					<div class="form-row">
						<label for="password">Password</label>
						<input type="password" name="password" id="password" class="input-text" placeholder="Password" required >
						<!-- <i class="fas fa-lock"></i> -->
						<input type="password" id="passwordCheck" class="input-text" placeholder="Password Confirmation" required>
						<!-- <i class="fas fa-lock"></i> -->
					</div>
					<div class="form-row">
							<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
							<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>				
					</div>
						

					<div class="form-row">
						<label for="full-name">Address</label>
						<a href="#userAddress" class="btn btn-info" style="width:70px; height:25px; text-align:center; margin-left:10px; padding-top:0px;" onClick="goPopup();">검색</a>
						<input type="text" name="addr" id="userAddress" class="input-text" placeholder="Address" required>
						
						<!-- <i class="fas fa-user"></i> -->
						
					</div>
					<div class="form-row">
						<label for="full-name">Phone Number</label>
						<input type="text" name="phone" id="phoneNum" class="input-text" placeholder="Phone Number" required>
						<!-- <i class="fas fa-user"></i> -->
					</div>
					
					<div class="form-row-last">
						<input type="submit" class="register" value="가입">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- /.row -->

</div>
<!-- /.container -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var emailFlag = $("#emailFlag").val();//0
	$(function(){
		$("#emailCheck").click(function(){
			var email=$("#your-email").val();		//email
			if(email===null||email===""){
				alert("이메일을 입력해주세요.");
				emailFlag = 0;
				return false;
			}
			$.ajax({
				type:"POST",
				data:{email:email},
				url:"/user/join/emailCheck",
				success:function(data){
					if(data!=1){
						alert("사용가능한 이메일 입니다.");
						emailFlag = 1;
						$("#emailFlag").val("1");
					}else{
						alert("이미 존재하는 이메일 입니다.");
						emailFlag = 0;
						$("#emailFlag").val("0");
					}
				}
			});			
		});
	});

	
	function joinFormCheck(){
	 	var password = document.querySelector("#password");
	 	var passwordCheck = document.querySelector("#passwordCheck");

	 	
		if(emailFlag===1){
			if(password.value!=passwordCheck.value){
				password.focus;
				alert("비밀번호를 확인하세요.");
				return false;
			}else{
				
				return true;
			}
		}else{
			alert("이메일 중복체크를 확인하세요.");
			return false;
		}	
	}


	function goPopup(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	var juso = document.querySelector('#userAddress');
	    		juso.value = data.address;
	    		juso.value =juso.value +", ";
	        }
	    }).open();
		
	}
	
	
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#password").val();
			var pwd2 = $("#passwordCheck").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
		
	});
	
</script>


<%@include file="/WEB-INF/views/include/footer.jsp"%>
