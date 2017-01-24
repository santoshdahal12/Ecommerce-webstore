<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
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
								<!-- <a href="/logout" class="btn btn-default btn-flat">Sign out</a> -->
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
			<div class="row" align="center">
				<form action="/logout" method="post">
		<input type="submit" value="Sign Out" /> <input type="hidden"
			name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	<div align="center" class="form-div">
		<h1>Here is user registration</h1>

		<h1>
			Hello <b><c:out value="${user.name}" /></b>
		</h1>



		<form:form commandName="member" action="memberform" method="POST"
			id="myform">
			
			<form:input path="id" type="text" value="${id}" />

			<!-- enctype="multipart/form-data"> -->

			<!-- <div class="form-group row">
  <label for="example-text-input" class="col-xs-2 col-form-label">Text</label>
  <div class="col-xs-10">
    <input class="form-control" type="text" value="Artisanal kale" id="example-text-input">
  </div>
</div> -->
			<div class="form-group row">

				<form:label path="title" class="col-xs-2 col-form-label"> Title</form:label>

				<div class="col-xs-10">
					<form:select path="title" class="form-control">
						<form:option value="Mr." label="Mr." />
						<form:option value="Ms." label="Ms." />
						<%-- <form:errors path="title" cssStyle="color : red; " /> --%>
					</form:select>
					<%-- <form:errors path="title" cssStyle="color : red; " /> --%>
				</div>
			</div>

			<div class="form-group row">
				<form:label path="firstName" class="col-xs-2 col-form-label">First Name</form:label>

				<div class="col-xs-10">

					<form:input path="firstName" class="form-control" />
					<form:errors path="firstName" cssStyle="color : red;" />
				</div>
			</div>



			<div class="form-group row">

				<form:label class="col-xs-2 col-form-label" path="middleName">Middle Name</form:label>
				<div class="col-xs-10">

					<form:input path="middleName" class="form-control" />

				</div>
			</div>
			<div class="form-group row">
				<form:label class="col-xs-2 col-form-label" path="lastName">Last Name</form:label>

				<div class="col-xs-10">
					<form:input path="lastName" class="form-control" />
					<form:errors path="lastName" cssStyle="color : red;" />
				</div>
			</div>


			<div class="form-group row">

				<form:label class="col-xs-2 col-form-label" path="email">Email</form:label>
				<div class="col-xs-10">
					<form:input path="email" class="form-control" />
					<form:errors path="email" cssStyle="color : red;" />
				</div>
			</div>

			<%-- <!-- for Image  -->
				<label>Upload Recent Photo</label>
				<form:input id="image" path="image" type="file"
					class="form:input-large" />
		
 --%>

			<div class="form-group row">

				<form:label class="col-xs-2 col-form-label"
					path="credentials.username">User Name</form:label>
				<div class="col-xs-10">

					<form:input class="form-control" path="credentials.username" />
					<form:errors path="credentials.username" cssStyle="color : red;" />
				</div>
			</div>

			<div id="form-group row">


				<form:label class="col-xs-2 col-form-label"
					path="credentials.password">Password</form:label>

				<div class="col-xs-10">
					<form:input  class="form-control" type="password" path="credentials.password" />
					<form:errors path="credentials.password" cssStyle="color : red;" />
				</div>
			</div>


			<div id="form-group row">
				<form:label class="col-xs-2 col-form-label"
					path="credentials.confirmPassword"> Re-Type Password</form:label>

				<div class="col-xs-10">
					<form:input type="password" path="credentials.confirmPassword" class="form-control" />
					<form:errors path="credentials.confirmPassword"
						cssStyle="color : red;" />
				</div>

			</div>
			<div id="form-group row">
				<label class="col-xs-2 col-form-label">Role</label>
				<div class="col-xs-10">
					<form:input path="credentials.authority[0].authority" type="text"
						class="form-control" value=" ROLE_CUSTOMER/ROLE_FARMER" />
					<%-- <form:errors path="credentials.authority[0].authority" cssClass="color : red;"/> --%>
				</div>

			</div>
			<div id="form-group row">

				<form:label class="col-xs-2 col-form-label" path="phone">Phone Number</form:label>
				<div class="col-xs-10">
					<form:input path="phone"  class="form-control"/>
					<form:errors path="phone" cssStyle="color : red;" />
				</div>

			</div>

			<div id="form-group row">


				<div>
					<h2>memberAddress:</h2>
				</div>

			</div>

			<div id="form-group row">

				<form:label class="col-xs-2 col-form-label"
					path="memberAddress.street">Street Name</form:label>

				<div class="col-xs-10">
					<form:input path="memberAddress.street"  class="form-control"/>
					<form:errors path="memberAddress.street" cssStyle="color : red;" />
				</div>
			</div>
			<div id="form-group row">
				<form:label class="col-xs-2 col-form-label"
					path="memberAddress.city">City</form:label>

				<div class="col-xs-10">
					<form:input path="memberAddress.city" class="form-control" />
					<form:errors path="memberAddress.city" cssStyle="color : red;" />
				</div>
			</div>



			<div id="form-group row">

				<form:label class="col-xs-2 col-form-label"
					path="memberAddress.zipCode">Zip Code</form:label>

				<div class="col-xs-10">
					<form:input path="memberAddress.zipCode" class="form-control" />
					<form:errors path="memberAddress.zipCode" cssStyle="color : red;" />
				</div>
				</div>
				<div id="form-group row">

					<form:label class="col-xs-2 col-form-label"
						path="memberAddress.state">State</form:label>

					<div class="col-xs-10">
						<form:input path="memberAddress.state" class="form-control"/>
						<form:errors path="memberAddress.state" cssStyle="color : red;" />
					</div>
				</div>


				<div id="form-group row">
					<form:label class="col-xs-2 col-form-label"
						path="memberAddress.country">Country</form:label>

					<div class="col-xs-10">
						<form:input path="memberAddress.country" class="form-control"/>
						<form:errors path="memberAddress.country" cssStyle="color : red;" />
					</div>

				</div>
				
				<div id="form-group row">
					<form:label class="col-xs-2 col-form-label"
						path="memberAddress.country">Country</form:label>

					<div class="col-xs-10">
						<form:input path="memberAddress.country" class="form-control"/>
						<form:errors path="memberAddress.country" cssStyle="color : red;" />
					</div>

				</div>

				<div id="form-row">

					<div>
						<input type="submit" value="Submit" />

					</div>

				</div>
		</form:form>

	</div>
				
			
				
			</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- Model section -->

	</div>
	
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
