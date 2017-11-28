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
<title>Yaruis Contact Us</title>
<link rel="shortcut icon" href="${img}/phone.png" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${css}/bootstrap.css">
<script src="${js}/jquery.min.js"></script>
<script src="${js}/bootstrap.min.js"></script>

</head>
<body>
	<%@include file="shared/Header.jsp"%>
	<!--banner-->
	<div class="banner1">
		<div class="container">
			<h3>
				<span>Get In Touch</span>
			</h3>
		</div>
	</div>
	<!--banner-->
	<!--content-->
	<div class="content">
		<!--contact-->
		<div class="mail-w3ls">
			<div class="container">
				<h2 class="tittle">Contact Us</h2>
				<div class="mail-grids">
					<div class="mail-top">
						<div class="col-md-4 mail-grid">
							<i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>
							<h5>Address</h5>
							<p>Gokhale Road,Thane India</p>
						</div>
						<div class="col-md-4 mail-grid">
							<i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>
							<h5>Phone</h5>
							<p>Telephone: 1800 100 200</p>
						</div>
						<div class="col-md-4 mail-grid">
							<i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>
							<h5>E-mail</h5>
							<p>
								E-mail:<a href="mailto:yaruisshopanywhere@gmail.com">
									yaruisshopanywhere@gmail.com</a>
							</p>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="map-w3">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3768.17047836873!2d72.97328585055989!3d19.187754953372462!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b920c9f39551%3A0xf945af6df994a80!2sNIIT%2C+2nd+Floor%2C+Jayashree+Building%2C+Next+to+Paradise+Towers%2C+Gokhale+Road%2C+Thane+West%2C+Naupada%2C+Thane+West%2C+Thane%2C+Maharashtra+400602!5e0!3m2!1sen!2sin!4v1478517649129"
							allowfullscreen></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--contact-->
	<%@include file="shared/Footer.jsp"%>
</body>
</html>