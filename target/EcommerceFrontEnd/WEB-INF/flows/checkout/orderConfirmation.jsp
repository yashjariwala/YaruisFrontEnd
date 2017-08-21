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
<title>Order Recipt</title>
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

.form-w3agileabc h3 {
	color: #1565C0;
	font-size: 2.5em;
	text-align: center;
	margin-bottom: 1.5em;
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
<script>
	<jsp:useBean id="now" class="java.util.Date" />
		
</script>
<body>

	<%@ include file="/WEB-INF/views/shared/Header.jsp"%>
	<br>
	<div align="center">
		<div class="metro">
			<h1>
				<font color="white">Status</font>
			</h1>
		</div>

		<div class="progress">
			<div class="progress-bar progress-bar-success" style="width: 90%"></div>
		</div>
		<div class="metro">
			<h1>Order</h1>
			<p class="lead">Order confirmation</p>
		</div>
	</div>
	<div class="container">

		<div class="row">

			<form:form commandName="order" class="form-horizontal">



				<div class="container">

					<div class="row">

						<form:form commandName="order" class="form-horizontal">

							<div
								class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

								<div class="txt-center">
									<h1>Receipt</h1>
								</div>
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
										<address>
											<strong>Name </strong> ${order.cart.usercustomer.username}<br>

											<strong>Shipping Address</strong><br />
											${order.cart.usercustomer.shippingAddress.flatno},
											${order.cart.usercustomer.shippingAddress.buildingname}<br />
											${order.cart.usercustomer.shippingAddress.localityname} <br />
											Landmark: ${order.cart.usercustomer.shippingAddress.landmark}
											<br /> ${order.cart.usercustomer.shippingAddress.cityname},
											${order.cart.usercustomer.shippingAddress.statename} <br />
											${order.cart.usercustomer.shippingAddress.countryname},
											${order.cart.usercustomer.shippingAddress.zipcode}
										</address>
									</div>

									<div class="col-xs-6 col-sm-6 col-md-6 text-right">

										<p>
											Shipping Date:
											<fmt:formatDate type="date" value="${now}" />
										</p>
										<p>
											Invoice Date:
											<fmt:formatDate type="date" value="${now}" />
										</p>
									</div>

								</div>

								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
										<address>
											<strong>Billing Address</strong><br />
											${order.cart.usercustomer.billingAddress.flatno},
											${order.cart.usercustomer.billingAddress.buildingname}<br />
											${order.cart.usercustomer.billingAddress.localityname} <br />
											Landmark: ${order.cart.usercustomer.billingAddress.landmark}
											<br /> ${order.cart.usercustomer.billingAddress.cityname},
											${order.cart.usercustomer.billingAddress.statename} <br />
											${order.cart.usercustomer.billingAddress.countryname},
											${order.cart.usercustomer.billingAddress.zipcode}
										</address>
									</div>
								</div>


								<div class="table-responsive">
									<table class="tg">
										<thead>
											<tr>
												<td>Product</td>
												<td class="text-center">#</td>
												<td class="text-center">Price</td>
												<td class="text-center">Total</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="cartItem" items="${order.cart.cartItems}">
												<tr>
													<td class="col-md-9"><em>${cartItem.product.productname}</em></td>
													<td class="col-md-1" style="text-align: center">${cartItem.quantity}</td>
													<td class="col-md-1" style="text-align: center">${cartItem.product.productprice}</td>
													<td class="col-md-1" style="text-align: center">${cartItem.totalprice}</td>
												</tr>
											</c:forEach>
											<tr>
												<br>
												<td>
													<h4>
														<br> <br> <strong>Payment </strong>method is <strong>CASH
															ON DELIVERY</strong>
													</h4>
												</td>
												<td></td>
												<td></td>
												<td>
													<h4>
														<br> <br> <strong>Grand Total:</strong>
													</h4>
												</td>
												<td class="text-center text-danger">
													<h4>
														<br> <br> <strong>Rs.
															${order.cart.totalprice}</strong>
													</h4>
												</td>
											</tr>

										</tbody>
									</table>
								</div>


								<input type="hidden" name="_flowExecutionKey" /> <br /> <br />

								<div align="center">
									<button class="btn btn-default"
										name="_eventId_backToCollectShippingDetail">Back</button>
								</div>
								<br>



								<button class="btn btn-danger pull-left" name="_eventId_cancel">Cancel</button>



								<input type="submit" value="Submit Order"
									class="btn btn-success pull-right"
									name="_eventId_orderConfirmed" />
							</div>
						</form:form>
					</div>
				</div>


			</form:form>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/shared/Footer.jsp"%>