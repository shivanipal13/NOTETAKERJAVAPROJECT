<!doctype html>
<html lang="en">
<head>


<title>Note Taker: Home Page</title>

<%@include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container">
		<%@include file="Navbar.jsp"%>

		<br>
		<div class="card py-5">
		<img alt="" class="img-fluid mx-auto" style="max-width: 300px;" src="Image/notebook.png">
		<h2 class="text-primary text-uppercase text-center mt-3">Start taking your notes</h2>
		<div class="container text-center">
		<!-- <button class="btn btn-outline-primary text-center">Start here</button> -->
		<a href="add_notes.jsp"class="btn btn-primary" style="max-width: 50px max-height: 30px;">Start here</a>							
		</div>
		</div>
	</div>







</body>
</html>