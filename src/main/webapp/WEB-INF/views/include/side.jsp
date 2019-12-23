<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<div class="col-xl-12">

	<!-- <h1 class="my-4">TEST SHOP</h1> -->
	
	<script>
	$(document).ready(
			function(){
				$.ajax({
					async:false,
					url:"/category",
					type:'GET',
					success:function(data){
						var json = JSON.parse(data);
						for (key in json) {
							$("#navBarCategory").append(
								"<a href='/product/list/"
								+json[key].code+"' class='list-group-item flex-fill'>"
								+json[key].codeNm+"</a>"		
							);
						}
					}
				})	
			});
	</script>
	<div class="navbar navbar-expand-sm justify-content-center" id="navBarCategory">
	</div>

</div>