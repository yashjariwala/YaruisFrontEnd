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
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Password Reset</title>
<link rel="shortcut icon" href="${img}/login.png" />
<link rel="stylesheet" href="${css}/bootstrap.css">
<script src="${js}/jquery.min.js"></script>
<script src="${js}/bootstrap.min.js"></script>
</head>
<style>
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}
</style>
<body>
	<%@include file="shared/Header.jsp"%>
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile">
					<h3 align="center">Password Reset</h3>
					<form action="<c:url value=""/>" method="post" >
						<c:if test="${not empty error}">
							<div align="center" class=error style="color: #ff0000">${error}</div>
						</c:if>
						<br> <label>New Password</label>
						<div class="key">
							<i class="fa fa-user" aria-hidden="true"></i> <input type="password"
								value="password" name="newpassword" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'New Password';}"
								required="true">
							<div class="clearfix"></div>
						</div>
					<input type="submit" value="Change Password!"
							style="background: #fdb515; color: #FFFFFF; text-align: center; padding: 10px 0; border: none; font-size: 1em; outline: none; width: 100%; cursor: pointer; margin-bottom: 30px;">
				
					</form>

				</div>
			</div>
		</div>
	</div>
	<%@include file="shared/Footer.jsp"%>
</body>
</html>