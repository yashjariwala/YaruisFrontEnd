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
<title>Yaruis Products list</title>
<link rel="shortcut icon" href="${img}/y.png" />
</head>
<style type="text/css">
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}

.main-agi {
	background: #fff;
	width: 50%;
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



<style>
.sidenav {
	height: 78%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 50;
	left: 0;
	background-color: #ffffff;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 60px;
	color: #818181;
	display: block;
	transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 20px;
	}
}

.inside {
	padding: 1.6em;
}

input[type=radio] {
	display: none;
}

input[type=radio]+label {
	display: inline-block;
	margin: -2px;
	padding: 4px 12px;
	margin-bottom: 0;
	font-size: 14px;
	line-height: 20px;
	color: #333;
	text-align: center;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
	vertical-align: middle;
	cursor: pointer;
	background-color: #f5f5f5;
	background-image: -moz-linear-gradient(top, #fff, #e6e6e6);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fff),
		to(#e6e6e6));
	background-image: -webkit-linear-gradient(top, #fff, #e6e6e6);
	background-image: -o-linear-gradient(top, #fff, #e6e6e6);
	background-image: linear-gradient(to bottom, #fff, #e6e6e6);
	background-repeat: repeat-x;
	border: 1px solid #ccc;
	border-color: #e6e6e6 #e6e6e6 #bfbfbf;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	border-bottom-color: #b3b3b3;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',
		endColorstr='#ffe6e6e6', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
}

input[type=radio]:checked+label {
	background-image: none;
	outline: 0;
	-webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	background-color: #e0e0e0;
}
</style>
<script>
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    	document.getElementById("mySidenav").style.width = "250px";
    } else {
    	document.getElementById("mySidenav").style.width = "0";
    }
}
</script>

<%@include file="shared/Header.jsp"%>
<body ng-app="prodapp" ng-controller="myprodController"
	ng-init="listProduct()">


	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

		<div class="inside">
			<h1>Categories</h1>
			<br>

			<h4>
				<input type="radio" id="all" name="all"
					ng-model="searchConditionprod"> <label for="all">All</label>
			</h4>
			<br>
			<h4>
				<input type="radio" id="sp" name="Smartphones"
					ng-model="searchConditionprod" value="Smart Phones"> <label
					for="sp">Smart Phones</label>
			</h4>
			<br>
			<h4>
				<input type="radio" id="acc" name="Accessories"
					ng-model="searchConditionprod" value="Accessories"> <label
					for="acc">Accessories</label>
			</h4>
			<br>
			<h4>
				<input type="radio" id="cov" name="Covers"
					ng-model="searchConditionprod" value="Covers"> <label
					for="cov">Covers</label>
			</h4>
			<br>
			<h4>
				<input type="radio" id="Sg" name="Screen Guards"
					ng-model="searchConditionprod" value="Screen Guards"> <label
					for="Sg">Screen Guards</label>
			</h4>
<br>
			<h1>Sort By</h1>

			<br>
			<h4>
				<input type="radio" id="pn" name="productname"
					ng-model="orderbycatg" value="productname"> <label
					for="pn">Alphabetically</label>
			</h4>

			<br>
			<h4>
				<input type="radio" id="pp" name="productprice"
					ng-model="orderbycatg" value="productprice"> <label
					for="pp">Price</label>
			</h4>
			<br>

		</div>
	</div>
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
				<div class="main-agi">
					<div class="form-w3agile">
						<h3>Product List</h3>
						<div class="table-responsive">
							<span style="font-size: 30px; cursor: pointer"
								onclick="openNav()">&#9776; Sort Products</span>
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
									<td>{{p.productprice}}</td>
									<c:url value="/resources/images/{{p.productname}}.jpg"
										var="imgg" />

									<td><a href="<c:url value='/infoprod/{{p.productid}}'/>"><img
											src="${imgg}" alt="prodimage" height="80" width="80" /></td>
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
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	<%@include file="shared/Footer.jsp"%>
	<script src="${js}/app.js"></script>
</body>
</html>