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
<title>Products List</title>
<link rel="shortcut icon" href="${img}/y.png" />
</head>
<style type="text/css">
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

.inside {
	padding: 1.6em;
}

input[type=radio] {
	display: none;
}
</style>
<style>
.dropbtn {
	background-color: #2d70c2;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	right: 0;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.multi-column-dropdown {
	align: center; 
	color : black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	color: black;
}

.multi-column-dropdown:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #2d70c2;
}
</style>

<%@include file="shared/Header.jsp"%>
<body ng-app="prodapp" ng-controller="myprodController"
	ng-init="listProduct()">

	<div>
		<br>
		<div align="center">
			<input type="text" ng-model="searchConditionprod"
				placeholder="Search Products....">

		</div>

		<div align="center" hidden>
			<input type="text" ng-model="orderbycatg" placeholder="Sorting">

		</div>
		<!-- <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Sort Products</span> -->
		<div class="content">
			<div class="login">
				<div class="main-wide-agileits">
					<div class="form-w3agile">



						<h3>Product List</h3>

						<div class="dropdown" style="float: left;">
							<button class="dropbtn">Categories &nbsp;<i class = "glyphicon glyphicon-chevron-down"></i></button>
							<div class="dropdown-content" style="left: 0;">

								<ul class="multi-column-dropdown">
									<li><input type="radio" id="all" name="all"
										ng-model="searchConditionprod"> <label for="all">All</label>
									</li>
									<li><input type="radio" id="sp" name="Smartphones"
										ng-model="searchConditionprod" value="Smart Phones"> <label
										for="sp">Smart Phones</label></li>

									<li><input type="radio" id="acc" name="Accessories"
										ng-model="searchConditionprod" value="Accessories"> <label
										for="acc">Accessories</label></li>
									<li><input type="radio" id="cov" name="Covers"
										ng-model="searchConditionprod" value="Covers"> <label
										for="cov">Covers/Skins</label></li>
									<li><input type="radio" id="Sg" name="Screen Guards"
										ng-model="searchConditionprod" value="Screen Guards">
										<label for="Sg">Screen Guards</label></li>
								</ul>
							</div>
						</div>

						<div class="dropdown" style="float: right;">
							<button class="dropbtn">Sort By&nbsp;<i class = "glyphicon glyphicon-chevron-down"></i></button>
							<div class="dropdown-content">
								<ul class="multi-column-dropdown">
									<li><input type="radio" id="pn" name="productname"
										ng-model="orderbycatg" value="productname"> <label
										for="pn">Alphabetically</label></li>
									<li><input type="radio" id="pp" name="productprice"
										ng-model="orderbycatg" value="productprice"> <label
										for="pp">Price</label></li>
								</ul>
							</div>
						</div>
<br><br><br><br>

						<div class="table-responsive">
							<table class="tg">
								<tr>
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<th width="80">Product ID</th>
									</security:authorize>
									<th width="180">Product Name</th>
									<!-- 									<th width="120">Product Description</th> -->
									<th width="160">Category Name</th>
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<th width="120">Supplier Name</th>
									</security:authorize>
									<th width="120">Product Price</th>
									<th width="120">Product Image</th>
									<th width="40">Info</th>
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<th width="60">Edit</th>
										<th width="60">Delete</th>
									</security:authorize>
								</tr>
								<%-- 						<c:forEach items="${productList}" var="p"> --%>
								<tr
									ng-repeat="p in products | filter:searchConditionprod | orderBy:orderbycatg">
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<td>{{p.productid}}</td>
									</security:authorize>
									<td><a href="<c:url value='/infoprod/{{p.productid}}'/>">{{p.productname}}</td>
									<!-- 									<td>{{p.productdescription}}</td> -->
									<td>{{p.categoryname}}</td>
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<td>{{p.suppliername}}</td>
									</security:authorize>
									<td>{{p.productprice}}/-</td>
									<c:url value="/resources/images/{{p.productname}}.jpg"
										var="imgg" />

									<td><a href="<c:url value='/infoprod/{{p.productid}}'/>">
											<img src="${imgg}" alt="prodimage" height="80" width="80" />
									</a></td>
									<td><a href="<c:url value='/infoprod/{{p.productid}}'/>"><span
											class="glyphicon glyphicon-info-sign"></span></a></td>
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<td><a href="<c:url value='/editprod/{{p.productid}}' />">Edit</a></td>
										<td><a
											href="<c:url value='/removeprod/{{p.productid}}' />">Delete</a></td>
									</security:authorize>
								</tr>
								<%-- 							</c:forEach> --%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="shared/Footer.jsp"%>
	<script src="${js}/app.js"></script>
</body>
</html>