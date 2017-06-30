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
<title>Yaruis SignUp</title>
<link rel="shortcut icon" href="${img}/login.png" />
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

.main-agileits {
	background: #fff;
}
</style>

<script>


function FillBilling(f) {
	  var n1 = document.getElementById('n1');
	  var n2 = document.getElementById('n2');
	  var n3 = document.getElementById('n3');
	  var n4 = document.getElementById('n4');
	  var n5 = document.getElementById('n5');
	  var n6 = document.getElementById('n6');
	  var n7 = document.getElementById('n7');
	  var n8 = document.getElementById('n8');
	 
	  var n9 = document.getElementById('n9');
	  var n10 = document.getElementById('n10');
	  var n11 = document.getElementById('n11');
	  var n12 = document.getElementById('n12');
	  var n13 = document.getElementById('n13');
	  var n14 = document.getElementById('n14');
	  var n15 = document.getElementById('n15');
	  var n16 = document.getElementById('n16');

	
	  if(f.billingtoo.checked == true) {
	    f.n9.value = f.n1.value;
	    f.n10.value = f.n2.value;
	    f.n11.value = f.n3.value;
	    f.n12.value = f.n4.value;
	    f.n13.value = f.n5.value;
	    f.n14.value = f.n6.value;
	    f.n15.value = f.n7.value;
	    f.n16.value = f.n8.value;
	 
	  }
	}

</script>


<body>
	<%@include file="shared/Header.jsp"%>


	<!--content-->
	<div class="content">
		<!--login-->
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile form1">
					<h3>Register</h3>
					<div class="forg">
						<a href="<c:url value='/Login'/>" class="forg-right">Already
							an User? Login</a>
					</div>
					<c:url var="addAction" value="/Register/add"></c:url>
					<form:form action="saveuser" commandName="Userdata">
	
						<form:label path="username">Name</form:label>
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
							<form:input type="password" path="userpassword" />
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
						
						
						<!--shipping address -->


						<h3>Shipping Address</h3>

						<form:label path="shippingAddress.flatno">Flat No</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="shippingAddress.flatno"
								id="n1" />
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
						<input type="checkbox" name="billingtoo"
							onclick="FillBilling(this.form)">
						<em>Check this box if Shipping Address and Billing Address
							are the same.</em>
						<br>
						<br>
						<br>
						
						
						
						<!--billing address -->
						<h3>Billing Address</h3>
						<form:label path="billingAddress.flatno">Flat No</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							<form:input type="text" path="billingAddress.flatno"
								id="n9"  />
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
							<form:input type="text" path="billingAddress.landmark" id="n12"/>
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
							<form:input path="billingAddress.countryname" id="n15"/>
							<div class="clearfix"></div>
						</div>


						<form:label path="billingAddress.zipcode">Zip Code</form:label>
						<div class="key">
							<i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>
							<form:input path="billingAddress.zipcode" id="n16"/>
							<div class="clearfix"></div>
						</div>
						<br>
						

						<input type="submit" value="Submit">
					</form:form>
				</div>
			</div>
		</div>
		<!--login-->
	</div>

	<!--content-->


	<%@include file="shared/Footer.jsp"%>
</body>
</html>