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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Locations</title>
<link rel="shortcut icon" href="${img}/y.png" />
<style>
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>

</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<%@include file="shared/Header.jsp"%>
	<!--content-->
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile form1">
					<h3>Locations</h3>
					<%-- 					<c:url var="addAction" value="/locations"></c:url> --%>
					<form:form action="${contextPath}/addloc"
						modelAttribute="Locations" method="post">

						<form:label path="locationid">Location ID</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
							<form:input type="text" path="locationid" readonly="true" />
							<div class="clearfix"></div>
						</div>



						<form:label path="locationcountry">Country</form:label>
						<br>
						<span style="color: #ff0000">${CountryMsg} <form:errors
								path="locationcountry" cssClass="error"></form:errors></span>

						<div class="key">
							<i class="glyphicon glyphicon-globe" aria-hidden="true"></i>
							<form:input path="locationcountry" />
							<div class="clearfix"></div>
						</div>

						<form:label path="locationstate">State</form:label>
						<br>
						<span style="color: #ff0000">${StateMsg} <form:errors
								path="locationstate" cssClass="error"></form:errors></span>

						<div class="key">
							<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
							<form:input path="locationstate" />
							<div class="clearfix"></div>
						</div>

						<form:label path="locationcity">City</form:label>
						<br>
						<span style="color: #ff0000">${CityMsg} <form:errors
								path="locationcity" cssClass="error"></form:errors></span>

						<div class="key">
							<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
							<form:input path="locationcity" />
							<div class="clearfix"></div>
						</div>


						<input type="submit" value="Submit">
					</form:form>
				</div>

			</div>

		</div>
	</div>
	<!--login-->


	<%@include file="shared/Footer.jsp"%>
</body>

</html>