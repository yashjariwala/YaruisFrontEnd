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
<!--css-->
<link href="${css}/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="${css}/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="${css}/font-awesome.css" rel="stylesheet">
<!--css-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${js}/jquery.min.js"></script>
<link href='//fonts.googleapis.com/css?family=Cagliostro'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,800italic,800,700italic,700,600italic,600,400italic,300italic,300'
	rel='stylesheet' type='text/css'>

<script src="${js}/responsiveslides.min.js"></script>
<script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			nav : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>
<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
<header>

	<div class="header">
		<div class="header-top">
			<div class="container">
				<div class="top-left">
					<a href="<c:url value='/ContactUs'/>">Contact Us <i
						class="glyphicon glyphicon-phone" aria-hidden="true"></i> 1800 100 200
					</a>
				</div>
				<div class="top-right">
					<ul>

						<!--  <li><a href="<c:url value='/checkout'/>">Checkout</a></li>-->

						<!-- when user logged in -->
						<c:if test="${pageContext.request.userPrincipal.name != null }">

							<li><a>Welcome:
									${pageContext.request.userPrincipal.name}</a></li>
							<li><a href="<c:url value='/MyAccount/getUserDetails'/>">My Account</a></li>
							<li><a href="<c:url value='/Myorders'/>">My Orders</a></li>
							<li><a href="<c:url value='/Logout'/>">Logout</a></li>
							

						</c:if>




						<!-- when user not logged in -->
						<c:if test="${pageContext.request.userPrincipal.name == null }">
							<li><a href="<c:url value='/Login'/>">Login</a></li>
							<li><a href="<c:url value='/Register'/>"> Create Account
							</a></li>
						</c:if>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="heder-bottom">
			<div class="container">
				<div class="logo-nav">
					<div class="logo-nav-left">
						<h1>
							<a href="<c:url value='/Home'/>">Yaruis <span>Shop
									anywhere</span></a>
						</h1>
					</div>
					<div class="logo-nav-left1">
						<nav class="navbar navbar-default">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header nav_2">
								<button type="button"
									class="navbar-toggle collapsed navbar-toggle1"
									data-toggle="collapse" data-target="#bs-megadropdown-tabs">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>
							<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
								<ul class="nav navbar-nav">
									<li class="active"><a href="<c:url value='/Home'/>"
										class="act">Home</a></li>


									<li><a href="<c:url value='/listproduct'/>">Products</a></li>



									<c:if test="${pageContext.request.userPrincipal.name != null }">

										<security:authorize access="hasRole('ROLE_ADMIN')">


											<!-- Mega Menu -->
											<li class="dropdown"><a
												href="<c:url value='/Products'/>" class="dropdown-toggle"
												data-toggle="dropdown">Admin List<b class="caret"></b></a>
												<ul class="dropdown-menu multi-column columns-3">
													<div class="row">
														<div class="col-sm-3  multi-gd-img">
															<ul class="multi-column-dropdown">
																<h6>Admin Lists</h6>
																<li><a href="<c:url value='/listproduct'/>">Products</a></li>
																<li><a href="<c:url value='/listsupplier'/>">Supplier</a></li>
																<li><a href="<c:url value='/listuser'/>">User</a></li>
																<li><a href="<c:url value='/listcategory'/>">Category</a></li>
																<li><a href="<c:url value='/Allorders'/>"> Orders</a>
															</ul>
														</div>


														<div class="clearfix"></div>
													</div>
												</ul></li>

											<!-- Mega Menu -->
											<li class="dropdown"><a
												href="<c:url value='/Products'/>" class="dropdown-toggle"
												data-toggle="dropdown">Add Forms<b class="caret"></b></a>
												<ul class="dropdown-menu multi-column columns-3">
													<div class="row">
														<div class="col-sm-3  multi-gd-img">
															<ul class="multi-column-dropdown">
																<h6>Add Forms</h6>
																<li><a href="<c:url value='/productadmin'/>">Products</a></li>
																<li><a href="<c:url value='/supplier'/>">Supplier</a></li>
																<li><a href="<c:url value='/category'/>">Category</a></li>
															</ul>
														</div>


														<div class="clearfix"></div>
													</div>
												</ul></li>

										</security:authorize>
									</c:if>
									<li><a href="<c:url value='/AboutUs'/>">About Us</a></li>
								</ul>
							</div>
						</nav>
					</div>

					<div class="header-right2">
						<div class="cart box_1">
						<a>
							<a href="<c:url value='/cart/getCartId'/>"> Cart <img
								src="${img}/bag.png" alt="" allign="center" />
							</a>
						</a>
						</div>
						</div>
					</div>
<!-- 										<div class="logo-nav-right"> -->
<!-- 											<ul class="cd-header-buttons"> -->
<!-- 												<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li> -->
<!-- 											</ul> -->
										
<!-- 											<div id="cd-search" class="cd-search"> -->
<%-- 												<form action="#" method="post"> --%>
<!-- 													<input name="Search" type="search" placeholder="Search..."> -->
<%-- 												</form> --%>
<!-- 											</div> -->
<!-- 										</div> -->
</header>
<script src="${js}/angular.min.js">
	
</script>
</head>