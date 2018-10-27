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
<!DOCTYPE HTML>
<html>
<head>
<title>Yaruis Home</title>
<link rel="shortcut icon" href="${img}/y.png" />
<style>
.yaruish1 {
	color: #1565C0;
	font-size: 2.5em;
	text-align: center;
	margin-bottom: 1.5em;
}
</style>

</head>
<body>
	<!--header-->
	<%@include file="shared/Header.jsp"%>
	<!--header-->
	<!--banner-->

	<div class="banner-w3">
		<div class="demo-1">
			<div id="example1"
				class="core-slider core-slider__carousel example_1">
				<div class="core-slider_viewport">
					<div class="core-slider_list">
						<div class="core-slider_item">
							<img src="${img}/b1.jpg" class="img-responsive" alt="">
						</div>
						<div class="core-slider_item">
							<img src="${img}/b2.jpg" class="img-responsive" alt="">
						</div>
						<div class="core-slider_item">
							<img src="${img}/b3.jpg" class="img-responsive" alt="">
						</div>
						<!-- <div class="core-slider_item">
								  <img src="${img}/b4.jpg" class="img-responsive" alt="">
							</div> -->
					</div>
				</div>
				<div class="core-slider_nav">
					<div class="core-slider_arrow core-slider_arrow__right"></div>
					<div class="core-slider_arrow core-slider_arrow__left"></div>
				</div>
				<div class="core-slider_control-nav"></div>
			</div>
		</div>
		<link href="${css}/coreSlider.css" rel="stylesheet" type="text/css">
		<script src="${js}/coreSlider.js"></script>
		<script>
			$('#example1').coreSlider({
				pauseOnHover : false,
				interval : 3000,
				controlNavEnabled : true
			});
		</script>

	</div>
	<!--banner-->
	<!--content-->
	<!--content-->
	<br>
	<br>


	<div class="content">
		<!--banner-bottom-->
		<div class="ban-bottom-w3l">
			<div class="container">
				<div class="yaruish1">
					<h1>Products we offer</h1>
				</div>
				<div class="col-md-6 ban-bottom">
					<div class="ban-top">
				
					<a href="<c:url value="/listproduct"></c:url>">	
						<img src="${img}/mobile.jpg" class="img-responsive" alt=""> 
						<div class="ban-text">
							<h4>Mobile Phone's</h4>
						</div></a>
						<!--  <div class="ban-text2 hvr-sweep-to-top">
									<h4>50% <span>Off/-</span></h4>
								</div>-->
					</div>
				</div>
				<div class="col-md-6 ban-bottom3">
					<div class="ban-top">
					<a href="<c:url value="/listproduct"></c:url>">	
						<img src="${img}/cases.jpg" class="img-responsive" alt="" />
						<div class="ban-text1">
							<h4>Mobile Cases</h4>
						</div></a>
					</div>
					<div class="ban-img">
						<div class=" ban-bottom1">
							<div class="ban-top">
							<a href="<c:url value="/listproduct"></c:url>">	
								<img src="${img}/acc.jpg" class="img-responsive" alt="" />
								<div class="ban-text1">
									<h4>Accessiories</h4>
								</div></a>
							</div>
						</div>
						<div class="ban-bottom2">
							<div class="ban-top">
							<a href="<c:url value="/listproduct"></c:url>">	
								<img src="${img}/tempered.jpg" class="img-responsive" alt="" />
								<div class="ban-text1">
									<h4>Screen Protection</h4>
								</div></a>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<footer>
		<%@include file="shared/Footer.jsp"%>
	</footer>