<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
					<!-- TopBar : include -->
					<nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
						<button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
						<ul class="navbar-nav ml-auto">
							<li class="nav-item dropdown no-arrow">
							
								<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<img class="img-profile rounded-circle" src="/bootstrap/admin/img/boy.png" style="max-width: 60px" />
									<span class="ml-2 d-none d-lg-inline text-white small">${principal.user.email}</span>	
								</a>
								
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
									<a class="dropdown-item" href="/">
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>SHOP
									</a>
									<a class="dropdown-item" href="/logout">
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout
									</a>
								</div>
							</li>
						</ul>
					</nav>
					<!-- Topbar : include -->