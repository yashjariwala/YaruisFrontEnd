<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="cd" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>

<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="img" />
<spring:url value="/resources/fonts" var="fonts" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Yarish Customer Info</title>
<link rel="shortcut icon" href="${img}/y.png" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${css}/bootstrap.min.css">
<script src="${js}/jquery.min.js"></script>
<script src="${js}/bootstrap.min.js"></script>

</head>

<style>
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}

.form-w3agileabc h3 {
	color: #1565C0;
	font-size: 2.5em;
	text-align: center;
	margin-bottom: 1.5em;
}

.metro {
	display: inline-block;
	padding: 10px;
	margin: 10px;
	background: #0AF;
	/* Font styles */
	color: white;
	font-weight: bold;
	text-decoration: none;
	text-align: center;
	vertical-align: middle;
}

.progress {
	width: 70%;
}
</style>

<body>
	<%@ include file="/WEB-INF/views/shared/Header.jsp"%>
	<br>
	<div align="center">
		<div class="metro">
			<h1>
				<font color="white">Status</font>
			</h1>
		</div>

		<div class="progress">
			<div class="progress-bar progress-bar-success"
				style="width: 66.6666%"></div>
		</div>
	</div>

	<!--content-->
	<div align="center">
		<div class="metro">
			<p>Please verify all The details below for an hassle-free
				experience.</p>
		</div>
	</div>

	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agileabc form1">

					<form:form commandName="order" class="form-horizontal">

						<h3>Customer Shipping Address:</h3>
						<div class="form-group">


							<form:label path="cart.usercustomer.shippingAddress.flatno">Flat No</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
								<form:input path="cart.usercustomer.shippingAddress.flatno" />
								<div class="clearfix"></div>
							</div>


							<form:label path="cart.usercustomer.shippingAddress.buildingname">Building Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-bookmark" aria-hidden="true"></i>
								<form:input
									path="cart.usercustomer.shippingAddress.buildingname" />
								<div class="clearfix"></div>
							</div>

							<form:label path="cart.usercustomer.shippingAddress.localityname">Locality Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-road" aria-hidden="true"></i>
								<form:input
									path="cart.usercustomer.shippingAddress.localityname" />
								<div class="clearfix"></div>
							</div>

							<form:label path="cart.usercustomer.shippingAddress.landmark">Landmark</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-picture" aria-hidden="true"></i>
								<form:input path="cart.usercustomer.shippingAddress.landmark" />
								<div class="clearfix"></div>
							</div>

							<form:label path="cart.usercustomer.shippingAddress.cityname">City</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
								<form:input path="cart.usercustomer.shippingAddress.cityname" />
								<div class="clearfix"></div>
							</div>

							<form:label path="cart.usercustomer.shippingAddress.statename">State</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
								<form:input path="cart.usercustomer.shippingAddress.statename" />
								<div class="clearfix"></div>
							</div>

							<form:label path="cart.usercustomer.shippingAddress.countryname">Country</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-globe" aria-hidden="true"></i>
								<form:input path="cart.usercustomer.shippingAddress.countryname" />
								<div class="clearfix"></div>
							</div>

							<form:label path="cart.usercustomer.shippingAddress.zipcode">Zip Code</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
								<form:input path="cart.usercustomer.shippingAddress.zipcode" />
								<div class="clearfix"></div>
							</div>
							<input type="hidden" name="_flowExecutionKey" />


							<div align="center">
								<button class="btn btn-default"
									name="_eventId_backToCollectCustomerInfo">Back</button>
							</div>
							<br>



							<button class="btn btn-danger pull-left" name="_eventId_cancel">Cancel</button>



							<input type="submit" value="Next"
								class="btn btn-success pull-right"
								name="_eventId_shippingDetailCollected" />
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>


<%@ include file="/WEB-INF/views/shared/Footer.jsp"%>