<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/nav.jsp" %>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
@keyframes check {
	0% {height: 0;width: 0;}
	25% {height: 0;width: 10px;}
	50% {height: 20px;width: 10px;}
}
.checkbox{
	background-color:#fff;
	display:inline-block;
	height:28px;margin:0 .25em;
	width:28px;
	border-radius:4px;
	border:1px solid #ccc;
	float:right
}
.checkbox span{
	display:block;
	height:28px;
	position:relative;
	width:28px;
	padding:0
}
.checkbox span:after{
	-moz-transform:scaleX(-1) rotate(135deg);
	-ms-transform:scaleX(-1) rotate(135deg);
	-webkit-transform:scaleX(-1) rotate(135deg);
	transform:scaleX(-1) rotate(135deg);
	-moz-transform-origin:left top;
	-ms-transform-origin:left top;
	-webkit-transform-origin:left top;
	transform-origin:left top;
	border-right:4px solid #fff;
	border-top:4px solid #fff;
	content:'';display:block;
	height:20px;left:3px;
	position:absolute;
	top:15px;width:10px
}
.checkbox span:hover:after{border-color:#999}
.checkbox input{display:none}
.checkbox input:checked + span:after{
	-webkit-animation:check .8s;
	-moz-animation:check .8s;
	-o-animation:check .8s;
	animation:check .8s;
	border-color:#555
}
.checkbox input:checked + .default:after{border-color:#444}
.checkbox input:checked + .primary:after{border-color:#2196F3}
</style>

<link rel="stylesheet" type="text/css"
	href="/bootstrap/user/join/css/roboto-font.css">
<!-- Main Style Css -->
<link rel="stylesheet" href="/bootstrap/user/join/css/style.css" />
<div class="container">

	<div class="row">
		<!-- /.col-lg-3 -->
		<div class="page-content">
			<div class="form-v5-content" style="margin: 75px 0;">
				<form class="form-detail" action="/user/join" method="post" onsubmit="return joinFormCheck()">
					<h2>회원가입</h2>
					<!-- emailFlag : 0이면 가입불가, 1이면 가입가능 -->
					<input type="hidden" name="emailFlag" id="emailFlag" value="0">

					<div class="form-row">
						<label for="your-email">이메일</label>
							<a href="#your-email" id="emailCheck" class="btn btn-info"
							style="background-color: #007bff; width: 70px; height: 25px; text-align: center; margin-left: 10px; padding-top: 0px;">
							확인
							</a>
						<input type="text" name="email" id="your-email" class="input-text"
							placeholder="이메일 입력" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}"
							oninvalid="this.setCustomValidity('올바른 이메일 형식(id@address)으로 입력해주세요.')" oninput = "setCustomValidity ('')">

					</div>
					<div class="form-row">
						<label for="password">비밀번호</label> &nbsp;&nbsp;
						<span class="alert alert-danger" style="display: none; padding: 3px; font-size: 10pt;" id="alert-danger">
							비밀번호 불일치
						</span>
						<input type="password" name="password" id="password"
							class="input-text"	placeholder="비밀번호" required>
						<input type="password" id="passwordCheck" class="input-text"
							placeholder="비밀번호 확인" required>
					</div>

					<div class="form-row">
						<label for="full-name">주소</label>
						<a href="#userAddress" class="btn btn-info"
							style="background-color: #007bff; width: 70px; height: 25px; text-align: center; margin-left: 10px; padding-top: 0px;"
							onClick="goPopup();">검색
						</a>
						<input type="text" name="addr1" id="userAddress1" 
							class="input-text" placeholder="주소 입력" required readonly>
						<input type="text" name="addr2" id="userAddress2"
							class="input-text" placeholder="상세주소 입력" required>
					</div>
					
					<div class="form-row">
						<label for="full-name">휴대폰 번호</label> &nbsp;&nbsp;
						<span class="alert alert-danger"
							style="display: none; padding: 3px; font-size: 10pt;" id="phone-danger">
							숫자만 입력하세요
						</span>
						<input type="text" name="phone" id="phoneNum"
							onkeypress="inNumber();" class="input-text" placeholder="휴대폰 번호" required
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					</div>

					<div class="form-row">
						<li class="list-group-item" style="width: 100%; text-align: left;">
							<label class="checkbox">
								<input type="checkbox" id="termCheck" value="1">
								<span class="primary"></span>
							</label>
							<font style="font-size: 10pt;">
							(필수)회원가입 약관 동의
								<a href="#myModal" data-toggle="modal">
									<b style="color: #007bff;">자세히 보기</b>
								</a>
							</font>
							
							<!-- Modal -->
							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">회원약관</h5>
											<button type="button" class="close" data-dismiss="modal">×</button>
										</div>
										<div class="modal-body">
											<textarea id="userTerms" rows=15
												style="font-size: 10pt; width: 100%; overflow-x: hidden; overflow-y: auto"readonly>
											</textarea>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">
												Close
											</button>
										</div>
									</div>
								</div>
							</div>
						</li>
						<p style="margin-top: 10px;">
							<font style="font-size: 10pt;">※ 위의 내용에 빠짐없이 기재하셔야 합니다.</font>
						</p>
					</div>

					<div class="form-row-last">
						<input type="submit" class="register" style="background-color: #007bff;" value="가입">
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
	userTermsLoad();
	function userTermsLoad(){
		$("#userTerms").load("/jointerms.txt");
	}

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
				if($("#termCheck").is(':checked')){
					if($("#userAddress1").val()===""||$("#userAddress2").val()===""){
						alert("주소를 빠짐없이 기입하셔야 합니다.");
						return false;
					}else{
						return true;	
					}
				}else{
					alert("회원가입 약관에 동의하셔야 합니다.");
					return false;
				}
			}
		}else{
			alert("이메일 중복체크를 확인하세요.");
			return false;
		}	
	}


	function goPopup(){
		new daum.Postcode({
			oncomplete: function(data) {
				var juso = document.querySelector('#userAddress1');
				juso.value = data.address;
			}
		}).open();
		
	}	

	$(function() {
		$("input").keyup(function() {
			var pwd1 = document.getElementById("password").value;
			var pwd2 = document.getElementById("passwordCheck").value;
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					document.getElementById("alert-danger").style.display="none";
				} else {
					document.getElementById("alert-danger").style.display="block";
				}
			}
			if(pwd1===""&&pwd2===""){
				document.getElementById("alert-danger").style.display="none";
			}
		});
	});
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>