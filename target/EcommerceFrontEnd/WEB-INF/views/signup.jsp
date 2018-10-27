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
<spring:url value="/resources/json" var="json" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>SignUp</title>
<link rel="shortcut icon" href="${img}/login.png" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${css}/bootstrap.css">
<script src="${js}/jquery.min.js"></script>
<script src="${js}/bootstrap.min.js"></script>


</head>

<style>
body {
	background: url("${img}/profilebg.jpg") no-repeat 0px 0px;
	background-size: cover;
	z font-family: 'Open Sans', sans-serif;
	background-attachment: fixed;
}

.billingequalsshipping {
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
	padding: 16px 25px;
	text-align: center;
	text-decoration: none;
	font-size: 12px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.billingequalsshipping:hover {
	background-color: #008CBA;
	color: white;
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

<script>
	function FillBilling(f) {
		confirm("Are Billing Address and Shipping Address same?");
		var n1 = document.getElementById('n1');
		var n2 = document.getElementById('n2');
		var n3 = document.getElementById('n3');
		var n4 = document.getElementById('n4');
		var n5 = document.getElementById('country');
		var n6 = document.getElementById('state');
		var n7 = document.getElementById('city');
		var n8 = document.getElementById('n8');

		var n9 = document.getElementById('n9');
		var n10 = document.getElementById('n10');
		var n11 = document.getElementById('n11');
		var n12 = document.getElementById('n12');
		var n13 = document.getElementById('Country');
		var n14 = document.getElementById('State');
		var n15 = document.getElementById('City');
		var n16 = document.getElementById('n16');

		f.n9.value = f.n1.value;
		f.n10.value = f.n2.value;
		f.n11.value = f.n3.value;
		f.n12.value = f.n4.value;
		f.n13.value = f.n5.value;
		f.n14.value = f.n6.value;
		f.n15.value = f.n7.value;
		f.n16.value = f.n8.value;

	}
</script>
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
	<br>
	<br>
	<div class="container">
		<div class="row form-group">
			<div class="col-xs-12">
				<ul class="nav nav-pills nav-justified thumbnail setup-panel">
					<li class="active"><a href="#step-1">
							<h4 class="list-group-item-heading">Basic Details</h4>
							<p class="list-group-item-text">Step 1</p>
					</a></li>
					<li class="disabled"><a href="#step-2">
							<h4 class="list-group-item-heading">Shipping Address</h4>
							<p class="list-group-item-text">Step 2</p>
					</a></li>
					<li class="disabled"><a href="#step-3">
							<h4 class="list-group-item-heading">Billing Address</h4>
							<p class="list-group-item-text">Step 3</p>
					</a></li>

				</ul>
			</div>
		</div>
	</div>



	<div class="row setup-content" id="step-1">
		<div class="col-xs-12">
			<div class="main-agileits">
				<div class="form-w3agile form1">
					<h3>Basic Details</h3>
					<!-- <form> -->
					<c:url var="addAction" value="/Register/add"></c:url>
					<form:form action="saveuser" commandName="Userdata">

						<div class="forg">
							<a href="<c:url value='/Login'/>" class="forg-right">Already
								an User? Login</a>
						</div>

						<form:label path="username">User Name</form:label>
						<br>
						<span style="color: #ff0000">${nameMsg} <form:errors
								path="username" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-user" aria-hidden="true"></i>
							<form:input path="username" />
							<div class="clearfix"></div>
						</div>

						<form:label path="useremail">Email-ID</form:label>
						<br>
						<span style="color: #ff0000">${emailMsg} <form:errors
								path="useremail" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>
							<form:input path="useremail" />
							<div class="clearfix"></div>
						</div>

						<form:label path="userpassword">Password</form:label>
						<br>
						<span style="color: #ff0000">${passwordMsg} <form:errors
								path="userpassword" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
							<form:input type="password" path="userpassword" id="password" />
							<input id="check1" type="checkbox" name="check1" value="0"
								onchange='togglePassword(this);' /><label for="check1"><span><span></span></span></label>
							<div class="clearfix"></div>
						</div>


						<form:label path="userphoneno">Phone No</form:label>
						<br>
						<span style="color: #ff0000">${phoneMsg} <form:errors
								path="userphoneno" cssClass="error"></form:errors></span>
						<div class="key">
							<i class="glyphicon glyphicon-phone" aria-hidden="true"></i>
							<form:input path="userphoneno" />
							<div class="clearfix"></div>
						</div>
						<br>
						<div align="center">
							<button id="activate-step-2" class="btn btn-primary btn-md"
								onclick="topFunction()">Shipping Address</button>
						</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 	<div class="container"> -->

	<div class="row setup-content" id="step-2">
		<div class="col-xs-12">
			<div class="main-agileits">
				<div class="form-w3agile form1">
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

					<br>
					<div align="center">
						<input type="button" name="billingtoo"
							class="billingequalsshipping" onclick="FillBilling(this.form)"
							Value="Billing Address same as Shipping Address?"> <br>
						<br> <br>
						<button id="activate-step-3" class="btn btn-primary btn-md"
							onclick="topFunction()">Billing Address</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row setup-content" id="step-3">
		<div class="col-xs-12">
			<div class="main-agileits">
				<div class="form-w3agile form1">
					<!--billing address -->
					<h3>Billing Address</h3>
					
							
					<div align="center">
						<input type="button" name="billingtoo"
							class="billingequalsshipping" onclick="FillBilling(this.form)"
							Value="Billing Address same as Shipping Address?"> <br>
						<br> <br></div>
					
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
					<div align="center">
						<input type="submit" value="Submit">
					</div>
				</div>
			</div>
		</div>
	</div>

	</form:form>
						<script>
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}

		// Activate Next Step

		$(document)
				.ready(
						function() {

							var navListItems = $('ul.setup-panel li a'), allWells = $('.setup-content');

							allWells.hide();

							navListItems
									.click(function(e) {
										e.preventDefault();
										var $target = $($(this).attr('href')), $item = $(
												this).closest('li');

										if (!$item.hasClass('disabled')) {
											navListItems.closest('li')
													.removeClass('active');
											$item.addClass('active');
											allWells.hide();
											$target.show();
										}
									});

							$('ul.setup-panel li.active a').trigger('click');

							// DEMO ONLY //
							$('#activate-step-2')
									.on(
											'click',
											function(e) {
												$('ul.setup-panel li:eq(1)')
														.removeClass('disabled');
												$(
														'ul.setup-panel li a[href="#step-2"]')
														.trigger('click');
												$(this).remove();
											})

							$('#activate-step-3')
									.on(
											'click',
											function(e) {
												$('ul.setup-panel li:eq(2)')
														.removeClass('disabled');
												$(
														'ul.setup-panel li a[href="#step-3"]')
														.trigger('click');
												$(this).remove();
											})

							$('#activate-step-4')
									.on(
											'click',
											function(e) {
												$('ul.setup-panel li:eq(3)')
														.removeClass('disabled');
												$(
														'ul.setup-panel li a[href="#step-4"]')
														.trigger('click');
												$(this).remove();
											})

							$('#activate-step-3')
									.on(
											'click',
											function(e) {
												$('ul.setup-panel li:eq(2)')
														.removeClass('disabled');
												$(
														'ul.setup-panel li a[href="#step-3"]')
														.trigger('click');
												$(this).remove();
											})
						});
	</script>
	<br>
	<br>
	<%@include file="shared/Footer.jsp"%>
</body>
</html>