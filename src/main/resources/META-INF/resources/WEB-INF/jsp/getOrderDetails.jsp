<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>E-commerce webstore</title>
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
						alt="User Image"> <span class="hidden-xs">Sign Out </span>
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
			<!-- Main content -->
			<section class="content"> <!-- Your Page Content Here -->
			<h3 class="box-title">Thank You For Shopping From Ecommerce Webstore!!</h3>
			<table id="plist" class="table table-striped table-bordered">
				<caption>Your Current Order ID is : ${processedOrder.id}</caption>

				<thead>
					<tr>
						<th>Name</th>
						<th>Quantity</th>
						<th>Price</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${processedOrder.orderLineList}" var="oderLine">
						<tr>
							<td><c:out value="${oderLine.product.name}" /></td>
							<td><c:out value="${oderLine.quantity}" /></td>
							<td><c:out value="${oderLine.price}" /></td>

						</tr>
					</c:forEach>
				</tbody>
				<thead>
					<tr>
						<th>Order Status</th>
						<th>Shipping Date</th>
						<th>Ordered Date</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<th><c:out value="${processedOrder.orderStatus}" /></th>
						<th>Seven Days from Ordered Date<c:out
								value="${processedOrder.ordereddate}" /></th>
						<th><c:out value="${processedOrder.ordereddate}" /></th>
					</tr>

				</tbody>
				
			</table>
			
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- Model section -->
		<!-- Modal -->


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
