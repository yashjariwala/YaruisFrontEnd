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
<body>



 ${usercustomerobj.useremail}
	${usercustomerobj.userphoneno} ${usercustomerobj.userpassword}
	${usercustomerobj.userrole}


	<br>
	<br>
	<strong>Shipping Address</strong>
	<br /> ${usercustomerobj.shippingAddress.flatno},
	${usercustomerobj.shippingAddress.buildingname}
	<br /> ${usercustomerobj.shippingAddress.localityname}
	<br /> Landmark: ${usercustomerobj.shippingAddress.landmark}
	<br /> ${usercustomerobj.shippingAddress.cityname},
	${usercustomerobj.shippingAddress.statename}
	<br /> ${usercustomerobj.shippingAddress.countryname},
	${usercustomerobj.shippingAddress.zipcode}

<br><br>
	<strong>Billing Address</strong>
	<br /> ${usercustomerobj.billingAddress.flatno},
	${usercustomerobj.billingAddress.buildingname}
	<br /> ${usercustomerobj.billingAddress.localityname}
	<br /> Landmark: ${usercustomerobj.billingAddress.landmark}
	<br /> ${usercustomerobj.billingAddress.cityname},
	${usercustomerobj.billingAddress.statename}
	<br /> ${usercustomerobj.billingAddress.countryname},
	${usercustomerobj.billingAddress.zipcode}



</body>
</html>