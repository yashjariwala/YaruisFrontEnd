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
<title>Yaruis SignUp</title>
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

.main-agileits {
	background: #fff;
}
</style>
<body>
	<%@include file="shared/Header.jsp"%>


	<!--content-->
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile form1">
					<h3>Register</h3>
					<div class="forg">
						<a href="<c:url value='/Login'/>" class="forg-right">Already
							an User? Login</a>
					</div>
					<c:url var="addAction" value="/Register/add"></c:url>
					<form:form action="saveuser" commandName="Userdata">
						<!-- 						basic details -->

						<%-- 						<form:label path="userid">User ID</form:label> --%>
						<!-- 						<div class="key"> -->
						<!-- 							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> <span -->
						<%-- 								style="colour: #ff0000">${useridmsg}</span> --%>
						<%-- 							<form:errors path="userid" cssStyle="color: #ff0000" /> --%>
						<%-- 							<form:input type="text" path="userid" /> --%>
						<!-- 							<div class="clearfix"></div> -->
						<!-- 						</div> -->
						<form:label path="username">Name</form:label>
						<br>
						<span style="color: #ff0000">${nameMsg} <form:errors
								path="username" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-user" aria-hidden="true"></i>
							<form:input path="username" />
							<div class="clearfix"></div>
						</div>

						<form:label path="useremail">Email-ID</form:label>
						<br>
						<span style="color: #ff0000">${emailMsg} <form:errors
								path="useremail" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>
							<form:input path="useremail" />
							<div class="clearfix"></div>
						</div>

						<form:label path="userpassword">Password</form:label>
						<br>
						<span style="color: #ff0000">${passwordMsg} <form:errors
								path="userpassword" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
							<form:input type="password" path="userpassword" />
							<div class="clearfix"></div>
						</div>


						<form:label path="userphoneno">Phone No</form:label>
						<br>
						<span style="color: #ff0000">${phoneMsg} <form:errors
								path="userphoneno" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-phone" aria-hidden="true"></i>
							<form:input path="userphoneno" />
							<div class="clearfix"></div>
						</div>
						<br>
						<!--billing address -->
						<h3>Billing Address</h3>
						<form:label path="billingAddress.flatno">Flat No</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="billingAddress.flatno" />
							<div class="clearfix"></div>
						</div>
						<form:label path="billingAddress.buildingname">Building Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-bookmark" aria-hidden="true"></i>
							<form:input path="billingAddress.buildingname" />
							<div class="clearfix"></div>
						</div>

						<form:label path="billingAddress.localityname">Locality Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-road" aria-hidden="true"></i>
							<form:input path="billingAddress.localityname" />
							<div class="clearfix"></div>
						</div>

						<form:label path="billingAddress.landmark">Landmark</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-picture" aria-hidden="true"></i>
							<form:input type="text" path="billingAddress.landmark" />
							<div class="clearfix"></div>
						</div>

						<form:label path="billingAddress.cityname">City Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
							<form:input path="billingAddress.cityname" />
							<div class="clearfix"></div>
						</div>

						<form:label path="billingAddress.statename">State Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
							<form:input path="billingAddress.statename" />
							<div class="clearfix"></div>
						</div>


						<form:label path="billingAddress.countryname">Country Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-globe" aria-hidden="true"></i>
							<form:input path="billingAddress.countryname" />
							<div class="clearfix"></div>
						</div>


						<form:label path="billingAddress.zipcode">Zip Code</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
							<form:input path="billingAddress.zipcode" />
							<div class="clearfix"></div>
						</div>
						<br>
						<!--shipping address -->

						<h3>Shipping Address</h3>
						<form:label path="shippingAddress.flatno">Flat No</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="shippingAddress.flatno" />
							<div class="clearfix"></div>
						</div>
						<form:label path="shippingAddress.buildingname">Building Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-bookmark" aria-hidden="true"></i>
							<form:input path="shippingAddress.buildingname" />
							<div class="clearfix"></div>
						</div>

						<form:label path="shippingAddress.localityname">Locality Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-road" aria-hidden="true"></i>
							<form:input path="shippingAddress.localityname" />
							<div class="clearfix"></div>
						</div>

						<form:label path="shippingAddress.landmark">Landmark</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-picture" aria-hidden="true"></i>
							<form:input type="text" path="shippingAddress.landmark" />
							<div class="clearfix"></div>
						</div>

						<form:label path="shippingAddress.cityname">City Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
							<form:input path="shippingAddress.cityname" />
							<div class="clearfix"></div>
						</div>

						<form:label path="shippingAddress.statename">State Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
							<form:input path="shippingAddress.statename" />
							<div class="clearfix"></div>
						</div>


						<form:label path="shippingAddress.countryname">Country Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-globe" aria-hidden="true"></i>
							<form:input path="shippingAddress.countryname" />
							<div class="clearfix"></div>
						</div>


						<form:label path="shippingAddress.zipcode">Zip Code</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
							<form:input path="shippingAddress.zipcode" />
							<div class="clearfix"></div>
						</div>

						<%-- 						<form:input type="hidden" path="cart.totalprice" value="0" /> --%>

						<input type="submit" value="Submit">
					</form:form>
				</div>
			</div>
		</div>
		<!--login-->
	</div>

	<!--content-->


	<%@include file="shared/Footer.jsp"%>
</body>
</html>