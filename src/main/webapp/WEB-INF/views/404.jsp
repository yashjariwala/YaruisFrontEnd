<%@ page isErrorPage="true" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<html>
<head>

<!--- basic page needs
   ================================================== -->
<meta charset="utf-8">
<title>Yaruis 404</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- mobile specific metas
   ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
   ================================================== -->
<link rel="stylesheet" href="${css}/base.css">
<link rel="stylesheet" href="${css}/main.css">
<link rel="stylesheet" href="${css}/vendor.css">

<!-- script
   ================================================== -->
<script src="${js}/modernizr.js"></script>

<!-- favicons
	================================================== -->
<link rel="icon" type="image/png" href="${img}/y.png">

</head>

<body>

	<!-- header 
   ================================================== -->
	<header class="main-header">
		<div class="row"></div>
	</header>
	<!-- /header -->



	<!-- main content
   ================================================== -->
	<main id="main-404-content" class="main-content-particle-js">


	<div class="content-wrap">

		<div class="shadow-overlay"></div>

		<div class="main-content">
			<div class="row">
				<div class="col-twelve">

					<a href="<c:url value='/Home'/>"><h2>Yaruis</h2> </a>

					<h1 class="kern-this">404 Error.</h1>
					<p>Yaay! you found our 404 page! Looks like nothing was found
						at this location. Maybe try on of the links below or just move your mouse on page for the effects!</p>

				</div>
				<!-- /twelve -->
			</div>
			<!-- /row -->
		</div>
		<!-- /main-content -->

		<footer>
			<div class="row">



				<div class="col-five tab-full bottom-links">
					<ul class="links">
						<li><a href="<c:url value='/Home'/>">Home</a></li>
						<li><a href="<c:url value='/AboutUs'/>">About</a></li>
						<li><a href="mailto:yaruisshopanywhere@gmail.com">Report
								Error</a></li>
					</ul>


				</div>

			</div>
			<!-- /row -->
		</footer>

	</div>
	<!-- /content-wrap --> </main>
	<!-- /main-404-content -->

	<div id="preloader">
		<div id="loader"></div>
	</div>

	<!-- Java Script
   ================================================== -->
	<script src="${js}/jquery.min.js"></script>
	<script src="${js}/plugins.js"></script>
	<script src="${js}/main.js"></script>

</body>

</html>