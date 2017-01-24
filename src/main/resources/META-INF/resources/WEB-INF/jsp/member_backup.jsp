<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>MemberForm</title>

<style type="text/css">
</style>
</head>
<body>
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
			id="myform" enctype="multipart/form-data">
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

			
				<label>Upload Recent Photo</label>
				<form:input id="image" path="image" type="file"
					class="form:input-large" />
		
 

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

				<div id="form-row">

					<div>
						<input type="submit" value="Submit" />

					</div>

				</div>
		</form:form>

	</div>

</body>
</html>
