<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="cd" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="img" />
<spring:url value="/resources/fonts" var="fonts" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Delete Account</title>
<link rel="shortcut icon" href="${img}/login.png" />
<style>
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}

/*hide checkbox and radio buttons*/
input[type=checkbox], input[type=radio] {
	width: 2em;
	margin: 0;
	padding-top: 20px;
	font-size: 1em;
	opacity: 0; /*This is the part tht actually hides it*/
}

/*normalize the spacing*/
input[type=checkbox]+label, input[type=radio]+label {
	display: inline-block;
	margin-left: -2em;
	line-height: 1.5em;
	padding-top: 12px;
}

/*unchecked css*/
input[type=checkbox]+label>span, input[type=radio]+label>span {
	display: inline-block;
	background-image: url('${img}/view.png');
	width: 25px;
	height: 25px;
}

/*selected checkbox css*/
input[type=checkbox]:checked+label>span>span {
	width: 25px;
	height: 25px;
	display: block;
	background-image: url('${img}/hide.png');
}
</style>

<script type="text/javascript">
	function togglePassword(el) {

		// Checked State
		var checked = el.checked;

		if (checked) {
			// Changing type attribute
			document.getElementById("password").type = 'text';

		} else {
			// Changing type attribute
			document.getElementById("password").type = 'password';
		}
	}
</script>
<body>
	<%@include file="shared/Header.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile">
					<form:form action="${contextPath}/deletepersonalinfo"
						commandName="Userdata">
						<h3>Delete Info</h3>
						<div align="center">
	<p><strong> Are you sure you want to delete your account ? <br>
	You might not be able to reverse this action!<br>
	Your placed orders will not be delivered.<br>
	</strong>
	</p>
	
	<div id ="hidewholeform" hidden="true">
						<div id="hidden" hidden="true">
							<form:label path="userid">User ID</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
								<form:input type="text" path="userid" />
								<div class="clearfix"></div>
							</div>
						</div>

						<form:label path="username">User Name</form:label>
						<br>
						<span style="color: #ff0000">${nameMsg} <form:errors
								path="username" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="username" readonly="true" />
							<div class="clearfix"></div>
						</div>


						<form:label path="useremail">User Email</form:label>
						<br>
						<span style="color: #ff0000">${emailMsg} <form:errors
								path="useremail" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="useremail" readonly="true" />
							<div class="clearfix"></div>
						</div>

						<form:label path="userphoneno">User Phone No</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="userphoneno" />
							<div class="clearfix"></div>
						</div>
						<form:label path="userpassword">User Password</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
							<form:input type="password" path="userpassword" id="password" />
							<input id="check1" type="checkbox" name="check1" value="0"
								onchange='togglePassword(this);' /><label for="check1"><span><span></span></span></label>
							<div class="clearfix"></div>
						</div>

						<br>
</div><br>
						<input type="submit" value="Delete">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="shared/Footer.jsp"%>
</body>
</html>