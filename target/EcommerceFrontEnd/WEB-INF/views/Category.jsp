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
<style>
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}

</style>
<head>
<title>Yaruis Add Category</title>
<link rel="shortcut icon" href="${img}/y.png" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${css}/bootstrap.min.css">
<script src="${js}/jquery.min.js"></script>
<script src="${js}/bootstrap.min.js"></script>

</head>
<body>
	<%@include file="shared/Header.jsp"%>
	<!--content-->
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile form1">
					<h3>Category</h3>
					<c:url var="addAction" value="/category"></c:url>
					<form:form action="addcatg" commandName="Catgdata">
						<%-- 						<form:label path="Category_id">Category ID</form:label> --%>
						<!-- 						<div class="key"> -->
						<!-- 							<i class="glyphicon glyphicon-qrcode" aria-hidden="true"></i> -->
						<%-- 							<form:input type="text" path="Category_id" /> --%>
						<!-- 							<div class="clearfix"></div> -->
						<!-- 						</div> -->
						<form:label path="categoryname">Category Name</form:label><br>
							<span style="color: #ff0000">${categorynameMsg}
						<form:errors path="categoryname" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-tag" aria-hidden="true"></i>
							<form:input path="categoryname" />
							<div class="clearfix"></div>
						</div>

						<form:label path="categorydescription">Category Description</form:label><br>
								<span style="color: #ff0000">${categorydescriptionMsg}
						<form:errors path="categorydescription" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i>
							<form:input path="categorydescription" />
							<div class="clearfix"></div>


						</div>
						<input type="submit" value="Submit">
					</form:form>
				</div>
			</div>
		</div>
	</div>






	<%@include file="shared/Footer.jsp"%>

</body>
</html>
