<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>
<style>
body {
	background: #f6f3f7;
}
p {
	margin: 0;
}

.topbar {
	font-family: 'Roboto', sans-serif;
	position: fixed;
    width: 100%;
    z-index: 2000;
	text-align: center;
	display: block;
	background: #730000;
	color: #fff;
	padding: 5px 0;
	background: #730000;
    background: -moz-linear-gradient(top, #730000 0%, #000000 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#730000), color-stop(100%,#000000));
    background: -webkit-linear-gradient(top, #730000 0%,#000000 100%);
    background: -o-linear-gradient(top, #730000 0%,#000000 100%);
    background: -ms-linear-gradient(top, #730000 0%,#000000 100%);
    background: linear-gradient(to bottom, #730000 0%, #000000 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#730000', endColorstr='#000000',GradientType=0 );
}

.topbar p {
	margin: 0;
	font-weight: 300;
}

.topbar p a {
	font-size: 12px;
}

.header {
	background: #fff;
	padding: 20px 0;
	padding-top: 60px;
}

.control-box h2 {
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.control-box {
	border: 1px solid #dddcd8;
	
	background-color: #fff;
}

.control-box .links {
	list-style: none;
	padding: 0;
	margin: 0;
}

.control-box .links li {
	margin-bottom: 10px;
}

.control-box .links li a {
	color: #aa1212;
	text-decoration: underline;
}

.content {
	margin-top: 20px;
}

.breadcrumb p {
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	color: #777;
	font-size: 14px;
}

.breadcrumb p a {
	color: #aa1212;
}

.main-content h6 {
	font-family: 'Roboto', sans-serif;
	font-weight: 700;
	font-size: 27px;
	color: #000;
	margin-bottom: 20px;
}

.main-content p {
	font-size: 17px;
	color: #777;
	line-height: 29px;
	margin-bottom: 20px;
}

.main-content img {
	max-width: 100%;
	height: auto;
	display: block;
	margin: auto;
}

.main-content h1 {
	margin-bottom: 20px;
}

.footer {
	margin-top: 40px;
	padding-top: 20px;
	padding-bottom: 20px;
	border-top: 1px solid #fff;
	background-color: #fff;

}

.footer ul {
	margin-bottom: 0;
}
.footer ul li a {
	color: #aa1212;
	font-size: 14px;
}
</style>


<div class="content">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="control-box p-3 main-content" id="boardDetail"></div>
				<div class="text-right mt-3 mb-3">
					<button type="button" id="btnCancel" class="btn btn-primary mb-1">목록</button>
				</div>
			</div>
		</div>
	</div>
</div>
<br>

<%@include file="/WEB-INF/views/include/footer.jsp"%>

<script>
	var href = document.location.href;
	var endpoint = href.lastIndexOf("/");
	var boardId = href.substring(href.length,endpoint+1);
	
	$(document).ready(function(){
		$.ajax({
			async:false,
			url:"/board/view/detail/"+boardId,
			type:"GET",
			success:function(data){
				var board = JSON.parse(data);
				var htmlContent="";
				htmlContent += "<div class='d-flex justify-content-between mb-3'>";
				htmlContent += "<div class='p-2'><h2>"+board.title+"</h2></div>";
				htmlContent += "<div class='p-2' style='text-align: right;'>";
				htmlContent += "<br><small>"+board.insDt+"</small>";
				htmlContent += "</div></div><hr>"+board.content;
				htmlContent += "<input type='hidden' id='categoryCd' value='" + board.categoryCd + "' />";
				$("#boardDetail").html(htmlContent);
			}
		});
	});
	
	$("#btnCancel").on("click", function(){
		var categoryCd = $("#categoryCd").val();
		location.href="/board/list?category=" + categoryCd;
	});
</script>