<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Farmer App</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="/dist/css/skins/_all-skins.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/plugins/iCheck/flat/blue.css">
<!-- Morris chart -->
<link rel="stylesheet" href="/plugins/morris/morris.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Date Picker -->
<link rel="stylesheet"
	href="/plugins/datepicker/datepicker3.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="/plugins/daterangepicker/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="skin-blue sidebar-mini layout-top-nav">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header"> <!-- Header Navbar --> <nav
			class="navbar navbar-static-top" role="navigation"> <!-- Navbar Right Menu -->
		<a href="dashboard1" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>FarmerApp</b></span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="/dist/img/user2-160x160.jpg" class="user-image"
						alt="User Image"> <span class="hidden-xs">User
							Options</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img
							src="/dist/img/user2-160x160.jpg" class="img-circle"
							alt="User Image">

							<p>
								Enjoy the app <small></small>
							</p></li>
						<!-- Menu Body -->
						<li class="user-body">
							<div class="row"></div> <!-- /.row -->
						</li>
						<!-- Menu Footer-->
						<li class="user-footer clearfix">
							<div class="pull-left" style="margin-right: 10px">
								<a href="/checkout" class="btn btn-default btn-flat">Check
									Out</a>
							</div>
							<div class="pull-left">
								<button class="btn btn-default btn-flat" data-toggle="modal"
									data-target="#cartModal">My Cart</button>
							</div>
							<div class="pull-right">
								<a href="/logout" class="btn btn-default btn-flat">Sign out</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
		</nav> </header>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<form action="trackOrder" method="get" class="form-form">
			Track Your Previous Order: <input type="text" name="id"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="submit" value="Submit" />
			</form>
			<p>${wrongOrder}</p>
			<p>${notAvailable}</p>
			<!-- Main content -->
			<section class="content"> <!--if  Empty Cart -->
			<h3 style="color: red;" class="box-title">
				<c:out value="${param.cartEmpty}" />
			</h3>
			<div class="row" align="center">
				<c:forEach items="${products}" var="product">
					<div class="col-sm-3" style="margin-bottom: 10px">
						<img width="200px" height="200px"
							src="../images/${product.id}.jpg" alt="Photo"> <br />
						<div>
							<button onclick="myfunction(${product.id});"
								class="btn btn-success btn-xs">Add To Cart</button>
							<button value="${product.id}" onclick="showDetail(this)"
								class="btn btn-primary btn-xs" data-toggle="modal"
								data-target="#myModal">Detail</button>
						</div>
					</div>
				</c:forEach>
			</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- Model section -->
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Product Detail</h4>
					</div>
					<div class="modal-body clearfix">
						<div id="detailimage" class="col-sm-4 "></div>
						<div class="col-sm-4 ">
							<table>
								<tr>
									<td>Name:</td>
									<td><Strong id="pName"></Strong></td>
								</tr>
								<tr>
									<td>Price:</td>
									<td><Strong id="pPrice"></Strong></td>
								</tr>
								<tr>
									<td>Available:</td>
									<td><Strong id="pQty"></Strong></td>
								</tr>
							</table>
						</div>

					</div>
					<div class="modal-footer">
						<!--  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
					</div>
				</div>
			</div>
		</div>
		<!-- Model section -->

		<!-- Cart Model section -->
		<!-- Modal -->
		<div class="modal fade" id="cartModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Cart Detail</h4>
					</div>
					<div class="modal-body clearfix">
						<div id="detailimage" class="col-sm-4 "></div>
						<div class="col-sm-4 ">
							<table border="1" id="myTable"
								class="table table-striped table-bordered">
								<!-- Added now -->
								<tr>
									<th>Name</th>
									<th>Quantity</th>
									<th>Price</th>
									<th>Action</th>
								</tr>
								<c:forEach var="orderLine" items="${orderLines}">
									<tr>
										<td>${orderLine.product.name}</td>
										<td>${orderLine.quantity}</td>
										<td>${orderLine.price}</td>
										<td><button class="btn btn-danger btn-xs"
												onclick="removefunction(${orderLine.product.id});">Remove
												From Cart</button></td>
									</tr>
								</c:forEach>
								<!-- Added now -->
							</table>
						</div>

					</div>
					<div class="modal-footer">
						<!--  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
					</div>
				</div>
			</div>
		</div>
		<!-- Cart Model section -->

	</div>
	<script>
		$(document).ready(function() {
			$('#myTable').DataTable();
		});
		function myfunction(id) {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$
					.ajax({
						type : "GET",
						contentType : "application/json; charset=utf-8",
						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						dataType : "json",
						url : "/addToCart/" + id,
						success : function(data) {
							$('#sC').show();
							$('#myTable')
									.html(
											'<tr><th>Name</th><th>Quantity</th><th>Price</th><th>Action</th></tr>');
							$
									.each(
											data,
											function(i, oL) {
												$('#myTable tr:last')
														.after(
																'<tr><td>'
																		+ oL.product.name
																		+ '</td><td>'
																		+ oL.quantity
																		+ '</td><td>'
																		+ oL.price
																		+ '</td><td><button class = "btn btn-danger btn-xs" onclick="removefunction(' + oL.product.id + ');">Remove From Cart</button></td></tr>');
											});
						}
					});

		};
		function removefunction(id) {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$
					.ajax({
						type : "GET",
						contentType : "application/json; charset=utf-8",
						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						dataType : "json",
						url : "/removeFromCart/" + id,
						success : function(data) {
							$('#sC').show();
							$('#myTable')
									.html(
											'<tr><th>Name</th><th>Quantity</th><th>Price</th><th>Action</th></tr>');
							$
									.each(
											data,
											function(i, oL) {
												$('#myTable tr:last')
														.after(
																'<tr><td>'
																		+ oL.product.name
																		+ '</td><td>'
																		+ oL.quantity
																		+ '</td><td>'
																		+ oL.price
																		+ '</td><td><button class = "btn btn-danger btn-xs" onclick="removefunction(' + oL.product.id + ');">Remove From Cart</button></td></tr>');
											});
						}
					});

		};

		function showDetail(event) {
			var product_id = $(event).val();

			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");

			$.ajax({
				url : "/product/detail_r/" + product_id,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				type : "GET",
				error : function(response) {
					$("#div1").html("Cannot be deleted!");

				},
				success : function(result, status) {
					obj = $.parseJSON(JSON.stringify(result));
					var src = "../images/" + obj.id + ".jpg";
					var img = $('<img width = "100px" height = "100px" >');
					img.attr('src', src);
					$("#pName").html(obj.name);
					$("#pPrice").html(obj.price);
					$("#pQty").html(obj.productAvailability);
					$("#detailimage").html(img); 
				}

			});
		}
	</script>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.2.3 -->
	<!-- jQuery 2.2.3 -->
	<script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.6 -->
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	<!-- Morris.js charts -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="/plugins/morris/morris.min.js"></script>
	<!-- Sparkline -->
	<script src="/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script
		src="/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="/plugins/knob/jquery.knob.js"></script>
	<!-- daterangepicker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- datepicker -->
	<script src="/plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<!-- Slimscroll -->
	<script src="/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="/dist/js/app.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/dist/js/demo.js"></script>
</body>
</html>
