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
<footer>

	<!--copy-->
	<div class="copy-section">
		<div class="container">
			<div class="copy-left">
				<p>
					&copy; 2016-2017 Yaruis. All rights reserved | Design by <a
						href="https://www.facebook.com/yashjariwala96">YashJariwala@NIIT</a>
				</p>
			</div>
			<div class="copy-right">
				<img src="${img}/card.png" alt="" />
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--copy-->
<div class="footer-w3l">
						<div class="container">
							<div class="footer-grids">
								<div class="col-md-3 footer-grid">
									<h4>About </h4>
									<p>Yaruis is a one stop destination for all mobile and tablet related needs.We provide only the best of the products and also provide guaranteed returns if you dont like stuff! </p>
									<div class="social-icon">
										<a href="https://www.facebook.com/yashjariwala96"><i class="icon"></i></a>
										<a href="https://twitter.com/yashjariwala123"><i class="icon1"></i></a>
										<a href="https://plus.google.com/u/0/104461591091560011135"><i class="icon2"></i></a>
										<a href="https://in.linkedin.com/in/yash-jariwala-97051837"><i class="icon3"></i></a>
									</div>
								</div>
								<div class="col-md-3 footer-grid">
									<h4>My Account</h4>
									<ul>
										<li><a href="<c:url value='/cart/getCartId'/>">Cart</a></li>
													<!-- when user logged in -->
						<c:if test="${pageContext.request.userPrincipal.name != null }">

							<li><a>Account Logged In :
									${pageContext.request.userPrincipal.name}</a></li>
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
								<div class="col-md-3 footer-grid">
									<h4>Information</h4>
									<ul>
										<li><a href="<c:url value='/Home'/>">Home</a></li>
										<li><a href="<c:url value='/listproduct'/>">Products</a></li>
										<li><a href="<c:url value='/AboutUs'/>">About Us</a></li>
									  	<li><a href="<c:url value='/ContactUs'/>">Contact Us</a></li>
									</ul>
								</div>
								<div class="col-md-3 footer-grid foot">
									<h4>Contacts</h4>
									<ul>
										<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i><a href="<c:url value='/ContactUs'/>"> Gokhale Road,Thane India</a></li>
										<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i><a href="<c:url value='/ContactUs'/>">1800 100 200</a></li>
										<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:yaruisshopanywhere@gmail.com"> yaruisshopanywhere@gmail.com</a></li>
										
									</ul>
								</div>
							<div class="clearfix"> </div>
							</div>
							
						</div>
					</div>
					</footer>