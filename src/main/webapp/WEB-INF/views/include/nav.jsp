<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>SHOPPING</title>
<!-- fontawesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="/bootstrap/board/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- shop-homapage CSS. Custom styles for this template -->
<link href="/bootstrap/board/css/shop-homepage.css" rel="stylesheet">

</head>
<body style="background-color:white">

	<!-- Navigation -->
	
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
        <a class="navbar-brand logo-font" href="/" id="brand">
            TEST PAGE
        </a>
        <!-- links toggle -->
        <button class="navbar-toggler order-first" type="button" data-toggle="collapse" data-target="#links" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa fa-bars"></i>
        </button>
        <!-- account toggle -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#account" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            
            <i class="fa fa-user fa-1x" aria-hidden="true"></i>
           
        </button>
   
        <div class="collapse navbar-collapse" id="links">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    PRODUCT
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    	<!-- ajax처리. side.jsp 참고-->
                        <a class="dropdown-item" href="#">1</a>
                        <a class="dropdown-item" href="#">1</a>
                        <a class="dropdown-item" href="#">1</a>
                        <a class="dropdown-item" href="#">1</a>
                        <a class="dropdown-item" href="#">1</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    BOARD
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Notice</a>
                        <a class="dropdown-item" href="#">QnA</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contact">Contact</a>
                </li>
                

            </ul>
        </div>
        
       
        <div class="collapse navbar-collapse" id="account">
            <ul class="navbar-nav ml-auto">
            <c:choose>
            	<c:when test="${principal.user eq null}">
            		<li class="nav-item"><a class="nav-link" href="/user/joinForm">Join</a></li>
            	<li class="nav-item"><a class="nav-link" href="/user/loginForm">Login</a></li>
            	</c:when>
            	
            	<c:otherwise>
            	<li class="nav-item"><a class="nav-link" href="/cart/list">
                <i class="fa fa-shopping-cart fa-1x" aria-hidden="true"></i>&nbsp;
                <span class="badge badge-light">88</span>
                </a></li>
            	<li class="nav-item"><a class="nav-link" href="#"><span id="loginUser">${principal.user.email}</span> 안녕하세요</a></li>
            	<li class="nav-item"><a class="nav-link" href="/user/logout">Logout</a></li>
            	
            	</c:otherwise>
            </c:choose>
  
            </ul>
        </div>
    </div>
</nav>
<br>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script>
	$(document).ready(function(){
		var userEmail = $("#loginUser").text();
		var username = userEmail.split('@')[0];
		/* alert(username); */
		$('#loginUser').html("");
		$('#loginUser').append(username);
	});
		
</script>
