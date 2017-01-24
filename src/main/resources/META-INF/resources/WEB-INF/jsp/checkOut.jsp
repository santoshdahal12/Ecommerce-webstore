<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Check out</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<spring:message code="message.field" text="Default Text" />
				<br /> Language : <a href="?lang=en">English</a>|<a href="?lang=es">Spanish</a><br />
				 Current Locale : ${pageContext.response.locale}
			</div>
		</div>
	</section>
	<section class="container">
		<form:form modelAttribute="processedOrder" class="form-horizontal"
			action="checkout" method="post">
			<fieldset>
				<legend>Customer Details</legend>
				<h3>-----------Billing Details------------</h3>
				<div class="form-group">
					<label class="control-label col-lg-2" for="street">Street
						Name</label>
					<div class="col-lg-10">
						<form:input id="street" path="billingDetails.street"
							type="text" class="form:input-large" />
						<form:errors path="billingDetails.street"
							style="color:red" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="city">City</label>
					<div class="col-lg-10">
						<form:input id="city" path="billingDetails.city"
							type="text" class="form:input-large" />
						<form:errors path="billingDetails.city" style="color:red" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="state">State</label>
					<div class="col-lg-10">
						<form:input id="state" path="billingDetails.state"
							type="text" class="form:input-large" />
						<form:errors path="billingDetails.state" style="color:red" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="country">Country</label>
					<div class="col-lg-10">
						<form:input id="country" path="billingDetails.country"
							type="text" class="form:input-large" />
						<form:errors path="billingDetails.country"
							style="color:red" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="zipCode">Zip
						Code</label>
					<div class="col-lg-10">
						<form:input id="zipCode" path="billingDetails.zipCode"
							type="text" class="form:input-large" />
						<form:errors path="billingDetails.zipCode"
							style="color:red" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="phoneNumber">Phone
						Number</label>
					<div class="col-lg-10">
						<form:input id="phoneNumber" path="phoneNumber"
							type="text" class="form:input-large" />
						<form:errors path="phoneNumber" style="color:red" />

					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="creditCardNumber">Credit
						Card Number </label>
					<div class="col-lg-10">
						<form:input id="creditCardNumber"
							path="creditCardNumber" type="text"
							class="form:input-large" />
						<form:errors path="creditCardNumber"
							style="color:red" />
					</div>
				</div>

				<h3>-----------Shipping Address------------</h3>
				<div class="form-group">
					<label class="control-label col-lg-2" for="street1">Street
						Name</label>
					<div class="col-lg-10">
						<form:input id="street1" path="shippingAddress.street" type="text"
							class="form:input-large" />
						<form:errors path="shippingAddress.street" style="color:red" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="city1">City</label>
					<div class="col-lg-10">
						<form:input id="city1" path="shippingAddress.city" type="text"
							class="form:input-large" />
						<form:errors path="shippingAddress.city" style="color:red" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="state1">State</label>
					<div class="col-lg-10">
						<form:input id="state1" path="shippingAddress.state" type="text"
							class="form:input-large" />
						<form:errors path="shippingAddress.state" style="color:red" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="country1">Country</label>
					<div class="col-lg-10">
						<form:input id="country1" path="shippingAddress.country"
							type="text" class="form:input-large" />
						<form:errors path="shippingAddress.country" style="color:red" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="zipCode1">Zip
						Code</label>
					<div class="col-lg-10">
						<form:input id="zipCode1" path="shippingAddress.zipCode"
							type="text" class="form:input-large" />
						<form:errors path="shippingAddress.zipCode" style="color:red" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary"
							value="Confirm Order" />
					</div>
					<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<a href="dashboard1"  class="btn btn-primary">
					<span class="glyphicon-hand-left glyphicon"></span> Cancel Process
				</a>
					</div>
				</div>

			</fieldset>
		</form:form>
	</section>
</body>
</html>
