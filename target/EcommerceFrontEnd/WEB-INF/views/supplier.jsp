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
<title>Yaruis Add Supplier</title>
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
<head>
<title>Yaruis Supplier</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="${js}/jquery.min.js"></script>



</head>
<body>
	<%@include file="shared/Header.jsp"%>
	<!--content-->
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile form1">
					<h3>Supplier</h3>
					<c:url var="addAction" value="/supplier"></c:url>
					<form:form action="addsup" commandName="supdata">
						<%-- 						<form:label path="Supplier_id">Supplier ID</form:label> --%>
						<!-- 						<div class="key"> -->
						<!-- 							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i> -->
						<%-- 							<form:input type="text" path="Supplier_id" /> --%>
						<!-- 							<div class="clearfix"></div> -->
						<!-- 						</div> -->
						<form:label path="suppliername">Supplier Name</form:label><br>
						<span style="color: #ff0000">${suppliernameMsg}
						<form:errors path="suppliername" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-user" aria-hidden="true"></i>
							<form:input path="suppliername" />

							<div class="clearfix"></div>
						</div>

						<form:label path="supplieraddress">Supplier Address</form:label><br>
						<span style="color: #ff0000">${supplieraddressMsg}
						<form:errors path="supplieraddress" cssClass="error"></form:errors></span>

						<div class="key">
							<i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>
							<form:input path="supplieraddress" />
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
