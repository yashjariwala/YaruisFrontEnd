<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="cd" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="img" />
<spring:url value="/resources/fonts" var="fonts" />



<!DOCTYPE html>
<html lang="en">
<head>
<title>Invalid Cart</title>
<link rel="shortcut icon" href="${img}/y.png" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${css}/bootstrap.min.css">
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

.main-agileits {
	background: #fff;
}

.form-w3agileabc h1 {
	color: #1565C0;
	font-size: 2.5em;
	text-align: center;
	margin-bottom: 1em;
}

.metro {
	display: inline-block;
	padding: 10px;
	margin: 10px;
	background: #0AF;
	/* Font styles */
	color: white;
	font-weight: bold;
	text-decoration: none;
	text-align: center;
	vertical-align: middle;
}

.progress {
	width: 70%;
}
</style>
<body>

	<%@ include file="/WEB-INF/views/shared/Header.jsp"%>
	<br>
	<br>
	<div align="center">
		<div class="metro">
			<h1>
				<font color="white">Status: Error!</font>
			</h1>
		</div>

		<div class="progress">
			<div class="progress-bar progress-bar-danger" style="width: 100%"></div>
		</div>
	</div>
	<div class="container-wrapper">
		<div class="container">
			<body>
				<section>
					<div class="content">
						<!--login-->
						<div class="login">
							<div class="main-agileits">
								<div class="form-w3agileabc form1">
									<div class="form-group">
										<h1>Invalid Cart!</h1>
										<div class="metro">
											<p>Nothing was found in the cart! Try again</p>
										</div>
										<br> <br>


										<p>
										<div align="center">
											<c:url value="/listproduct" var="url"></c:url>
											<a href="${url}" class="btn btn-success">Continue
												Shopping</a>
										</div>
										</p>
									</div>
								</div>
							</div>
						</div>
				</section>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/shared/Footer.jsp"%>