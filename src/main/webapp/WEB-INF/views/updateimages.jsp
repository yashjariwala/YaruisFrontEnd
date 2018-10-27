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
<title>Update Images</title>
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
</style>
<body>
	<%@include file="shared/Header.jsp"%>
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile form1">
					<h3>Change Images</h3>
					<div>
						<h3>Carousel 1</h3>
						<c:url var="addaction" value="/UpdateImages/changeimgcarousel1"></c:url>
						<form method="post" action="/adddimg"
							enctype="multipart/form-data"  >
							Select file to upload: <input type="file" name="file" size="60"><br />
							<br /> <input type="submit" value="Upload" />
						</form><br>
					</div>
					<div>
						<h3>Carousel 2</h3>
						<c:url var="addaction" value="/UpdateImages/changeimgcarousel2"></c:url>
						<form method="post" action="UploadServlet"
							enctype="multipart/form-data">
							Select file to upload: <input type="file" name="file" size="60" /><br />
							<br /> <input type="submit" value="Upload" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="shared/Footer.jsp"%>
</body>
</html>