<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<!-- Scroll to top -->
		<a class="scroll-to-top rounded" href="#page-top">
			<i class="fas fa-angle-up"></i>
		</a>
	
		<script src="/bootstrap/admin/vendor/jquery/jquery.min.js"></script>
		<script src="/bootstrap/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="/bootstrap/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
		<script src="/bootstrap/admin/js/ruang-admin.js"></script>
		<script src="/js/common.js"></script>
		<style>
			.menuActive{
				font-weight: bold;
				color: blue;
			}
		</style>
		<script>
			$(document).ready(function() {
				$('.nav_bar').click(function(){
					$('.navigation').toggleClass('visible');
					$('body').toggleClass('opacity');
				});
				
				$('.plus a img').on('click', function () {
					$('.first-tab-at services-top services-top-toggle').toggle();
					$('.plus').hide();
					$('.minus').show();
				});
				
				$('.minus a img').on('click', function () {
					$('.first-tab-at services-top services-top-toggle').toggle();
					$('.minus').hide();
					$('.plus').show();
				});
				
				var menuLinkSplit = $(location).attr('href').split('/');
				menuLink = menuLinkSplit[4];

				if(menuLink == "user"){
					$("#menu1 span").addClass("menuActive");
				} else if(menuLink == "code"){
					$("#menu2 span").addClass("menuActive");
				} else if(menuLink == "board"){
					$("#menu3 span").addClass("menuActive");
				} else if(menuLink == "product"){
					$("#menu4 span").addClass("menuActive");
				} else if(menuLink == "sale"){
					$("#menu5 span").addClass("menuActive");
				} else if(menuLink == "order"){
					$("#menu6 span").addClass("menuActive");
				} else if(menuLink == "coupon"){
					$("#menu7 span").addClass("menuActive");
				}
			});
		</script>