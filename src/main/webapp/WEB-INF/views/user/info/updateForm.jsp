<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/include/nav.jsp" %>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/bootstrap/user/join/css/roboto-font.css">

<!-- Main Style Css -->
<link rel="stylesheet" href="/bootstrap/user/join/css/style.css" />

<div class="container">
	<div class="row">
		<div class="page-content">
			<div class="form-v5-content" style="margin: 75px 0;">
				<form class="form-detail" action="/user/info/update" method="post" onsubmit="return updateFormCheck();">
					<input type="hidden" name="id" value="${user.id}">
					<h2>회원정보수정</h2>
					
					<div class="form-row">
						<label for="your-email">이메일</label>
						<input type="text" name="email" id="your-email" class="input-text"
							value="${user.email}" placeholder="이메일 입력" required
							pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" readonly="readonly">
					</div>
					
					<div class="form-row">
						<label for="password">비밀번호</label> &nbsp;&nbsp;
						<span class="alert alert-danger" style="display: none; 
							padding: 3px; font-size: 10pt;" id="alert-danger">
							비밀번호 불일치
						</span>
						<input type="password" name="password" id="password" class="input-text" placeholder="비밀번호" required>
						<input type="password" id="passwordCheck" class="input-text" placeholder="비밀번호 확인" required>
					</div>
					
					<p style="text-align: left; margin-top: -15pt;">
						<font style="font-size: 10pt;">현재비밀번호 또는 변경할 비밀번호를 입력하세요.</font>
					</p>
					<br>
					
					<div class="form-row">
						<label for="full-name">주소</label>
						<a href="#userAddress" class="btn btn-info"
							style="background-color: #007bff; width: 70px; height: 25px; text-align: center; margin-left: 10px; padding-top: 0px;"
							onClick="goPopup();">검색</a>
							
							<input type="text" name="addr1" id="userAddress1" class="input-text" value="${user.addr1 }"
								placeholder="주소 입력" required readonly>
							
							<input type="text" name="addr2" id="userAddress2" class="input-text" value="${user.addr2 }" placeholder="상세주소 입력" required>
					</div>
					
					<div class="form-row">
						<label for="full-name">휴대폰 번호</label> &nbsp;&nbsp;
						<span class="alert alert-danger" style="display: none; padding: 3px; font-size: 10pt;" id="phone-danger">
							숫자만 입력하세요
						</span>
						<input type="text" name="phone" id="phoneNum" onkeypress="inNumber();"
							class="input-text" value="${user.phone}" placeholder="휴대폰 번호"
							required required
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					</div>
					<p style="margin-top: 10px; text-align: left;">
						<font style="font-size: 10pt; font-weight: bold; color: #ff0036;">※
							비밀번호를 입력하셔야 회원정보를 수정 하실 수 있습니다.
						</font>
					</p>
					<div class="form-row-last">
						<input type="submit" class="register" style="background-color: #007bff;" value="수정">
				</form>
				<input id="dropout" data-toggle="modal" data-target="#myModal"
					type="button" class="register" style="background-color: #ff0030;"
					value="회원탈퇴">
			</div>


			<!------------------ dropoutDIV -------------------->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							회원탈퇴
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="dropoutForm">
							<div class="modal-body">
								<div class="form-detail" style="text-align: left;">
									<div class="form-row">
										<input type="hidden" name="id" value="${user.id}">
										<label for="password">비밀번호</label>
										<input type="password" name="password" id="dropoutPassword"
											class="input-text" placeholder="Password" required>
										<br>

										<label for="password">비밀번호 확인</label>
										<input type="password" id="dropoutPasswordCheck" class="input-text"
											placeholder="Password Confirmation" required>
										<br>

										<font style="font-size: 10pt;">
											- 현재 페이지의 [회원탈퇴] 버튼을 누르시면 회원탈퇴가 완료됩니다.<br>
											- 비밀번호를 정확하게 입력하셔야 합니다.<br> 
											- 회원탈퇴가 이루어지면 절대로 계정을 복구 할 수 없으며,<br>
											탈퇴 후 동일한 이메일로의 재가입은 일정기간이 지난 후 가능합니다.<br>
											(최소 7일 이상)<br>
										</font>
									</div>

									<div style='text-align: center;'>
										<input id="dropoutBtn" type="button" class="register"
											style="background-color: #ff0030;" value="회원탈퇴">
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- <div class="modal-footer"> -->
					<!-- 	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> -->
					<!-- </div> -->
				</div>
			</div>
			<!------------------ dropoutDIV END ------------------>
			
		</div>
	</div>
	<!-- /.row -->
	
</div>
<!-- /.container -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	$("#dropout").click(function() {
		$("#dropoutConfirm").css("display", "block");
	});

	$("#dropoutBtn").click(function() {
		var password = document.querySelector("#dropoutPassword");
		var passwordCheck = document.querySelector("#dropoutPasswordCheck");
		var pwCheck = "password=" + password.value;
		var formData = $("#dropoutForm").serialize();

		if (password.value === "" || passwordCheck.value === "") {
			alert("비밀번호를 모두 기입하세요");
		} else if (password.value != passwordCheck.value) {
			alert("비밀번호 확인란과 일치하지 않습니다.");
		} else {
			$.ajax({
				async : false,
				cache : false,
				url : "/user/info/passwordCheck",
				data : pwCheck,
				type : 'POST',
				success : function(data) {

					if (data === "ok") {
						$.ajax({
							async : false,
							cache : false,
							url : "/user/info/dropout",
							type : "POST",
							data : formData,
							success : function(data) {
								if (data === "ok") {
									alert("회원탈퇴가 완료되었습니다.");
									location.href="/logout";
								} else {
									alert("회원탈퇴가 실패되었습니다.");
									location.href="/logout";
								}
							}
						});
					} else {
						alert("회원 비밀번호와 일치하지 않습니다.");
					}
				}
			});
		}
	});

	function updateFormCheck() {
		var password = document.querySelector("#password");
		var passwordCheck = document.querySelector("#passwordCheck");

		if (password.value != passwordCheck.value) {
			alert("비밀번호를 확인하세요.");
			return false;
		} else {
			if ($("#userAddress1").val() === ""
					|| $("#userAddress2").val() === "") {
				alert("주소를 빠짐없이 기입하셔야 합니다.");
				return false;
			} else {
				return true;
			}
		}
	}

	function goPopup() {
		new daum.Postcode({
			oncomplete : function(data) {
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
					document.getElementById("alert-danger").style.display = "none";
				} else {
					document.getElementById("alert-danger").style.display = "block";
				}
			}
			if (pwd1 === "" && pwd2 === "") {
				document.getElementById("alert-danger").style.display = "none";
			}
		});
	});
</script>


<%@include file="/WEB-INF/views/include/footer.jsp"%>
