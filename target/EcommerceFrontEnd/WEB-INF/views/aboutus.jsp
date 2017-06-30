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
<head>
<title>Yaruis About Us</title>
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

.banner2 {
	background: url("${img}/ab1t.jpg");
	background-size: cover;
	min-height: 190px;
}
</style>

<body>
	<%@include file="shared/Header.jsp"%>
	<!--banner-->
	<div class="banner2"></div>
	<!--banner-->





	<!--content-->
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile">
					<h3>About Yaruis</h3>
					<form>
						<h1>Hello Everyone!</h1>
						<br>
						<h4>
							We at <b> Yaruis</b> welcome you to the ultimate shopping
							experince on the planet! It has the best products and the
							categories are so well sorted so that you can get to the product
							you want as quick as you want saving you time which can be spent
							on shopping more!
						</h4>

						<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<!--login-->
	</div>
	<!--content-->






	<%@include file="shared/Footer.jsp"%>
</body>
</html>