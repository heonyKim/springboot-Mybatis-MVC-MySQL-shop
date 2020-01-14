<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2019 
			
			</p>
                    
		</div>
		<!-- /.container -->
	</footer>
	
	<script>
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function inNumber(){
        if(event.keyCode<48 || event.keyCode>57){
           event.returnValue=false;
           document.getElementById("phone-danger").style.display="block";
           setTimeout(function(){
        	   document.getElementById("phone-danger").style.display="none";
           },500);
        }
    }

	</script>
	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="/bootstrap/board/vendor/jquery/jquery.min.js"></script>
	<script src="/bootstrap/board/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="/js/common.js"></script>
</body>
</html>