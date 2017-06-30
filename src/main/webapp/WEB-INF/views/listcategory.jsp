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
<title>Yaruis Category list</title>
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

.main-agi {
	background: #fff;
	width: 35%;
	margin: 0em auto;
	box-shadow: 0px 0px 15px 0px #D6D6D6;
	-o-box-shadow: 0px 0px 15px 0px #D6D6D6;
	-moz-box-shadow: 0px 0px 15px 0px #D6D6D6;
	-webkit-box-shadow: 0px 0px 15px 0px #D6D6D6;
	padding: 3em;
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

<body ng-app="catapp" ng-controller="mycatController"
	ng-init="listCategory()">
	<div>
		<br>
		<div align="center">
			<input type="text" ng-model="searchConditioncat"
				placeholder="Search Category....">
		</div>

		<div class="content">
			<div class="login">
				<div class="main-agi">
					<div class="form-w3agile">
						<h3>Category List</h3>

						<table class="tg">
							<tr>
								<th width="80">Category ID</th>
								<th width="120">Category Name</th>
								<th width="120">Category Description</th>
								<th width="60">Edit</th>
								<th width="60">Delete</th>
							</tr>
							<%-- 						<c:forEach items="${categoryList}" var="c"> --%>

							<tr ng-repeat="c in categories | filter:searchConditioncat">

								<td>{{c.categoryid}}</td>
								<td>{{c.categoryname}}</td>
								<td>{{c.categorydescription}}</td>

								<td><a href="<c:url value='/editcatg/{{c.categoryid}}' />">Edit</a></td>
								<td><a
									href="<c:url value='/removecatg/{{c.categoryid}}' />">Delete</a></td>
							</tr>
							<%-- 						</c:forEach> --%>
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