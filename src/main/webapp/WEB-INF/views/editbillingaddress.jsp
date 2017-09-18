<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="cd" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="img" />
<spring:url value="/resources/fonts" var="fonts" />
<!DOCTYPE html>
<html lang="en">
<head>
<style>
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}
</style>

<title>Edit Billing address</title>
<link rel="shortcut icon" href="${img}/login.png" />
<link rel="stylesheet" href="${css}/bootstrap.min.css">
<script src="${js}/jquery.min.js"></script>
<script src="${js}/bootstrap.min.js"></script>

</head>
<body>
	<%@include file="shared/Header.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile">
					<form:form action="${contextPath}/updatebilladd"
						commandName="billadata" modelAttribute="billingaddressobj"
						method="post">
						<h3>Edit Billing Address</h3>

						<form:label path="billingid" hidden="true">Shipping id</form:label>
						<div class="key" hidden="true">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="billingid" id="n1" hidden="true" />
							<div class="clearfix"></div>
						</div>
						<form:label path="flatno">Flat No</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="flatno" id="n1" />
							<div class="clearfix"></div>
						</div>
						<form:label path="buildingname">Building Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-bookmark" aria-hidden="true"></i>
							<form:input path="buildingname" id="n2" />
							<div class="clearfix"></div>
						</div>

						<form:label path="localityname">Locality Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-road" aria-hidden="true"></i>
							<form:input path="localityname" id="n3" />
							<div class="clearfix"></div>
						</div>

						<form:label path="landmark">Landmark</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-picture" aria-hidden="true"></i>
							<form:input type="text" path="landmark" id="n4" />
							<div class="clearfix"></div>
						</div>

						<form:label path="cityname">City Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
							<form:input path="cityname" id="n5" />
							<div class="clearfix"></div>
						</div>

						<form:label path="statename">State Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
							<form:input path="statename" id="n6" />
							<div class="clearfix"></div>
						</div>


						<form:label path="countryname">Country Name</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-globe" aria-hidden="true"></i>
							<form:input path="countryname" id="n7" />
							<div class="clearfix"></div>
						</div>


						<form:label path="zipcode">Zip Code</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
							<form:input path="zipcode" id="n8" />
							<div class="clearfix"></div>
						</div>

						<input type="submit" value="Update">
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="shared/Footer.jsp"%>
</body>
</html>