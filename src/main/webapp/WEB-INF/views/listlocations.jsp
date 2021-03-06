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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category List</title>
<link rel="shortcut icon" href="${img}/y.png" />
</head>
<style type="text/css">
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

body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}


input[type=text]:focus {
	width: 80%;
}

input[type=text] {
	flex: 1;
	padding: 0.6em;
	border: 0.2em solid rgb(72, 133, 237);
	width: 150px;
	box-sizing: border-box;
	background-repeat: no-repeat;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}
</style>
<%@include file="shared/Header.jsp"%>

<body ng-app="locapp" ng-controller="mylocController"
	ng-init="listLocation()">
	<div>
		<br>
		<div align="center">
			<input type="text" ng-model="searchConditionloc"
				placeholder="Search Locations....">
		</div>

		<div class="content">
			<div class="login">
				<div class="main-wide-agileits">
					<div class="form-w3agile">
						<h3>Locations List</h3>

						<table class="tg">
							<tr>
								<th width="80">Location ID</th>
								<th width="120">Country </th>
								<th width="300">State</th>
								<th width="150">City</th>
								<th width="60">Edit</th>
								<th width="60">Delete</th>
							</tr>

							<tr ng-repeat="l in locations | filter:searchConditionloc">

<!-- 								<td>{{c.categoryid}}</td> -->
<!-- 								<td>{{c.categoryname}}</td> -->
<!-- 								<td>{{c.categorydescription}}</td> -->

<td>{{ l.locationid}}</td>
<td>{{ l.locationcountry}}</td>
<td>{{ l.locationstate}}</td>
<td>{{ l.locationcity}}</td>

								<td><a href="<c:url value='/editloc/{{l.locationid}}' />">Edit</a></td>
								<td><a
									href="<c:url value='/removeloc/{{l.locationid}}' />">Delete</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="shared/Footer.jsp"%>
	<script src="${js}/app.js"></script>
</body>

</html>