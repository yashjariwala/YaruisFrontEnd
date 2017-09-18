<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="cd" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<spring:url value="/resources/images" var="img" />
<spring:url value="/resources/fonts" var="fonts" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Edit Personal Details</title>
<link rel="shortcut icon" href="${img}/login.png" />
<style>
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}

/*hide checkbox and radio buttons*/
input[type=checkbox], input[type=radio] {
	width: 2em;
	margin: 0;
	padding-top: 20px;
	font-size: 1em;
	opacity: 0; /*This is the part tht actually hides it*/
}

/*normalize the spacing*/
input[type=checkbox]+label, input[type=radio]+label {
	display: inline-block;
	margin-left: -2em;
	line-height: 1.5em;
	padding-top: 12px;
}

/*unchecked css*/
input[type=checkbox]+label>span, input[type=radio]+label>span {
	display: inline-block;
	background-image: url('${img}/view.png');
	width: 25px;
	height: 25px;
}

/*selected checkbox css*/
input[type=checkbox]:checked+label>span>span {
	width: 25px;
	height: 25px;
	display: block;
	background-image: url('${img}/hide.png');
}
</style>

<script type="text/javascript">
	function togglePassword(el) {

		// Checked State
		var checked = el.checked;

		if (checked) {
			// Changing type attribute
			document.getElementById("password").type = 'text';

		} else {
			// Changing type attribute
			document.getElementById("password").type = 'password';
		}
	}
</script>
<body>
	<%@include file="shared/Header.jsp"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile">
					<form:form action="${contextPath}/updatepersonalinfo"
						commandName="Userdata">
						<h3>Edit Personal Info</h3>
						<div align="center">
							<h4>Name And Email can not be changed!</h4>
						</div>
						<br>
						<br>
						<div id="hidden" hidden="true">
							<form:label path="userid">User ID</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
								<form:input type="text" path="userid" />
								<div class="clearfix"></div>
							</div>
						</div>

						<form:label path="username">User Name</form:label>
						<br>
						<span style="color: #ff0000">${nameMsg} <form:errors
								path="username" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="username" readonly="true" />
							<div class="clearfix"></div>
						</div>

						
							<form:label path="useremail">User Email</form:label>
							<br> <span style="color: #ff0000">${emailMsg} <form:errors
									path="useremail" cssClass="error"></form:errors></span>
							<div class="key">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
								<form:input type="text" path="useremail" readonly="true"/>
								<div class="clearfix"></div>
							</div>
					
						<form:label path="userphoneno">User Phone No</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="userphoneno" />
							<div class="clearfix"></div>
						</div>
						<form:label path="userpassword">User Password</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
							<form:input type="password" path="userpassword" id="password" />
							<input id="check1" type="checkbox" name="check1" value="0"
								onchange='togglePassword(this);' /><label for="check1"><span><span></span></span></label>
							<div class="clearfix"></div>
						</div>
						
						<div id="hidden" hidden="true">
							<form:label path="userrole">User Password</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
								<form:input type="text" path="userrole" />
								<div class="clearfix"></div>
							</div>
							<form:label path="BillingAddress.billingid">User Password</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
								<form:input type="text" path="BillingAddress.billingid" />
								<div class="clearfix"></div>
							</div>

							<form:label path="ShippingAddress.shippingid">User Password</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
								<form:input type="text" path="ShippingAddress.shippingid" />
								<div class="clearfix"></div>
							</div>

							<form:label path="Cart.cartId">User Password</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
								<form:input type="text" path="Cart.cartId" />
								<div class="clearfix"></div>
							</div>



							<h3>Shipping Address</h3>

							<form:label path="shippingAddress.flatno">Flat No</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
								<form:input type="text" path="shippingAddress.flatno" id="n1" />
								<div class="clearfix"></div>
							</div>
							<form:label path="shippingAddress.buildingname">Building Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-bookmark" aria-hidden="true"></i>
								<form:input path="shippingAddress.buildingname" id="n2" />
								<div class="clearfix"></div>
							</div>

							<form:label path="shippingAddress.localityname">Locality Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-road" aria-hidden="true"></i>
								<form:input path="shippingAddress.localityname" id="n3" />
								<div class="clearfix"></div>
							</div>

							<form:label path="shippingAddress.landmark">Landmark</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-picture" aria-hidden="true"></i>
								<form:input type="text" path="shippingAddress.landmark" id="n4" />
								<div class="clearfix"></div>
							</div>

							<form:label path="shippingAddress.cityname">City Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
								<form:input path="shippingAddress.cityname" id="n5" />
								<div class="clearfix"></div>
							</div>

							<form:label path="shippingAddress.statename">State Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
								<form:input path="shippingAddress.statename" id="n6" />
								<div class="clearfix"></div>
							</div>


							<form:label path="shippingAddress.countryname">Country Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-globe" aria-hidden="true"></i>
								<form:input path="shippingAddress.countryname" id="n7" />
								<div class="clearfix"></div>
							</div>


							<form:label path="shippingAddress.zipcode">Zip Code</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
								<form:input path="shippingAddress.zipcode" id="n8" />
								<div class="clearfix"></div>
							</div>



							<br> <input type="checkbox" name="billingtoo"
								onclick="FillBilling(this.form)"> <em>Check this
								box if Shipping Address and Billing Address are the same.</em> <br>
							<br> <br>


							<button id="activate-step-3" class="btn btn-primary btn-md"
								onclick="topFunction()">Billing Address</button>


							<!--billing address -->
							<h3>Billing Address</h3>



							<form:label path="billingAddress.flatno">Flat No</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
								<form:input type="text" path="billingAddress.flatno" id="n9" />
								<div class="clearfix"></div>
							</div>
							<form:label path="billingAddress.buildingname">Building Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-bookmark" aria-hidden="true"></i>
								<form:input path="billingAddress.buildingname" id="n10" />
								<div class="clearfix"></div>
							</div>

							<form:label path="billingAddress.localityname">Locality Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-road" aria-hidden="true"></i>
								<form:input path="billingAddress.localityname" id="n11" />
								<div class="clearfix"></div>
							</div>

							<form:label path="billingAddress.landmark">Landmark</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-picture" aria-hidden="true"></i>
								<form:input type="text" path="billingAddress.landmark" id="n12" />
								<div class="clearfix"></div>
							</div>

							<form:label path="billingAddress.cityname">City Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
								<form:input path="billingAddress.cityname" id="n13" />
								<div class="clearfix"></div>
							</div>

							<form:label path="billingAddress.statename">State Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
								<form:input path="billingAddress.statename" id="n14" />
								<div class="clearfix"></div>
							</div>


							<form:label path="billingAddress.countryname">Country Name</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-globe" aria-hidden="true"></i>
								<form:input path="billingAddress.countryname" id="n15" />
								<div class="clearfix"></div>
							</div>


							<form:label path="billingAddress.zipcode">Zip Code</form:label>
							<div class="key">
								<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
								<form:input path="billingAddress.zipcode" id="n16" />
								<div class="clearfix"></div>
							</div>
							<br>
						</div>
						<input type="submit" value="Update">
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="shared/Footer.jsp"%>
</body>
</html>