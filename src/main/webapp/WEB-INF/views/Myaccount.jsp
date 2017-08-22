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
<title>My Account</title>
</head>
<%@include file="shared/Header.jsp"%>
<style>
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}

.login-footer {
	padding: 0.25em 0.5em 0.5em;
}
</style>

<body>

	<!--content-->
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile">
				<h3>Account Details</h3>
				    <strong>User Name : </strong>${usercustomerobj.username}<br><br>
					<strong>Email ID : </strong>${usercustomerobj.useremail}<br><br>
					 <strong>Prone Number : </strong> ${usercustomerobj.userphoneno}<br><br>
					 <strong>Password : </strong>${usercustomerobj.userpassword} <br>
					 <br> <strong>Shipping
						Address  : </strong> 
<%-- 					<a href="<c:url value='/MyAccount/editshipadd'/>">edit</a> --%>
						<br /> ${usercustomerobj.shippingAddress.flatno},
					${usercustomerobj.shippingAddress.buildingname} <br />
					${usercustomerobj.shippingAddress.localityname} <br /> Landmark:
					${usercustomerobj.shippingAddress.landmark} <br />
					${usercustomerobj.shippingAddress.cityname},
					${usercustomerobj.shippingAddress.statename} <br />
					${usercustomerobj.shippingAddress.countryname},
					${usercustomerobj.shippingAddress.zipcode} <br> <br> 
					<strong>Billing
						Address : </strong> <br /> ${usercustomerobj.billingAddress.flatno},
					${usercustomerobj.billingAddress.buildingname} <br />
					${usercustomerobj.billingAddress.localityname} <br /> Landmark:
					${usercustomerobj.billingAddress.landmark} <br />
					${usercustomerobj.billingAddress.cityname},
					${usercustomerobj.billingAddress.statename} <br />
					${usercustomerobj.billingAddress.countryname},
					${usercustomerobj.billingAddress.zipcode}
				</div>
			</div>
		</div>
	</div>
	<%@include file="shared/Footer.jsp"%>
</body>
</html>