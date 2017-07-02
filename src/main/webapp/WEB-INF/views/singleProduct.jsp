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
<html>
<title>Yaruis Product</title>
<link rel="shortcut icon" href="${img}/y.png" />
<style>
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #ffffff;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}


@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 20px;
	}
}

.inside {
	padding: 1.6em;
}

.control-inline label {
	display: inline;
}

input[type=radio] {
	display: none;
}


</style>

<body ng-app="myapp" ng-controller="productsController">




	<%@include file="shared/Header.jsp"%>

	<div id="main">

		<c:url value="/resources/images/${productObject.productname}.jpg"
			var="imgg" />

		<!--content-->
		<div class="content">
			<!--single-->
			<div class="single-wl3">
				<div class="container">
					<div class="single-grids">
						<div class="col-md-9 single-grid">
							<div clas="single-top">
								<div class="single-left">
									<div class="flexslider">


										<div class="thumb-image">
											<img src="${imgg}" data-imagezoom="true"
												class="img-responsive">
										</div>

									</div>
								</div>
								<div class="single-right simpleCart_shelfItem">
									<h4>${productObject.productname}</h4>
									<h5>${productObject.categoryname}</h5>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<p class="price item_price">Rs.
										${productObject.productprice}</p>
									<div class="description">
										<p>
											<span>Quick Overview : </span>
											${productObject.productdescription}
										</p>
									</div>
									<div class="color-quality">




										<!-- 							</div> -->
										<!-- 									<div class="ribben1"> -->
										<!-- 										<p>SALE</p> -->
										<!-- 									</div> -->

										<security:authorize access="hasRole('ROLE_USER')">

											<a ng-click="addToCart(${productObject.productid})"
												data-text="Add To Cart" class="my-cart-yash item_add">Add
												To Cart</a>
										</security:authorize>

										<c:url value="/listproduct" var="url"></c:url>


										<a href="${url}" class="my-cart-yash item_add"> Continue
											shopping</a> <br> <br>


										<h2>
											<input type="radio" id="recprodrad" ng-model="prodfilter" value="${productObject.categoryname}" />


										</h2>

									</div>
								</div>
							</div>
<br>

						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>


		<div class="inside">

			<div align="center">
				<div class="table-responsive">
					<div class="content">
						<!-- 						<div class="login"> -->
						<div class="main-agi">
							<div class="form-w3agile">

								<div ng-init="listProduct()">
									<h3>Recommended Products</h3>
									<table class="tg">
										<tr>
											<th width="160">Product Name</th>
											<th width="120">Product Price</th>
											<th width="120">Product Image</th>
											<th width="40">Info</th>
										</tr>
										<tr ng-repeat="p in products | filter: prodfilter ">
											<td><a href="<c:url value='/infoprod/{{p.productid}}'/>">{{p.productname}}</td>
											<td>{{p.productprice}}</td>
											<c:url value="/resources/images/{{p.productname}}.jpg"
												var="imgg" />

											<td><a href="<c:url value='/infoprod/{{p.productid}}'/>"><img
													src="${imgg}" alt="prodimage" height="80" width="80" /></td>

											<td><a href="<c:url value='/infoprod/{{p.productid}}'/>"><span
													class="glyphicon glyphicon-info-sign"></span></a></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>







	</div>
	<%@include file="shared/Footer.jsp"%>
	<script src="${js}/imagezoom.js"></script>
	<script src="${js}/cartcontroller.js"></script>


	<script>
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 10
					|| document.documentElement.scrollTop > 10) {
				document.getElementById("recprodrad").click();
			} 
		}
	</script>


</body>
</html>