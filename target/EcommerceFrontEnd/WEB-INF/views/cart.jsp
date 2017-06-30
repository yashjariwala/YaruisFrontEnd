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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Yaruis Cart</title>
</head>
<style type="text/css">
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}

.main-agi {
	background: #fff;
	width: 50%;
	margin: 0em auto;
	box-shadow: 0px 0px 15px 0px #D6D6D6;
	-o-box-shadow: 0px 0px 15px 0px #D6D6D6;
	-moz-box-shadow: 0px 0px 15px 0px #D6D6D6;
	-webkit-box-shadow: 0px 0px 15px 0px #D6D6D6;
	padding: 3em;
}

input[type=text]:focus {
	width: 80%;
}

input[type=text] {
	flex: 1;
	padding: 0.6em;
	border: 0.2em solid rgb(72, 133, 237);
	width: 150px;
	box-sizing: border-box;
	background-repeat: no-repeat;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}

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
</style>
<%@ include file="shared/Header.jsp"%>
<body ng-app="myapp" ng-controller="productsController">

	<div ng-init="getCart(${cartId})">


		<div class="content">
			<div class="login">
				<div class="main-agi">
					<div class="form-w3agile">
						<h3>Items in your Cart</h3>
						<div class="table-responsive">
							<table class="tg">
								<tr>
									<th width="160">Product Name</th>
									<th width="120">Quantity</th>
									<th width="120">Product Price</th>
									<th width="160">Total Price</th>
									<th width="120">Action</th>
								</tr>
								<tr ng-repeat="cartItem in cart.cartItems">
									<td>{{cartItem.product.productname}}</td>
									<td>{{cartItem.quantity}}</td>
									<td>{{cartItem.product.productprice}}</td>
									<td>{{cartItem.totalprice}}</td>
									<td><a href="#" class="label label-danger"
										ng-click="removeFromCart(cartItem.cartitemid)"> <span
											class="glyphicon glyphicon-remove"></span> Remove
									</a></td>
								</tr>
							</table>

							<br>
							<div align="center">

								
								<h2><span class="label label-info">Grand Total = {{calculateGrandTotal()}}</h2>
							
								<br>
								<c:url value="/listproduct" var="url"></c:url>


								<a href="${url}" class="btn btn-default"> Continue shopping</a>
							</div>
							<div>
								<a class="btn btn-danger pull-left" ng-click="clearCart()">
									<span class="glyphicon glyphicon-remove-sign"> </span> Clear
									Cart
								</a>
							</div>

							<a href="<c:url value="/order/${cartId}"></c:url>"
								class="btn btn-success pull-right"> <span
								class="glyphicon glyphicon-shopping-cart"></span> Check Out
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





	<%@ include file="shared/Footer.jsp"%>
	<script src="${js}/cartcontroller.js"></script>
</body>
</html>