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
						<img src="${img}/cases.png" class="img-responsive" alt="" />
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
		<!--banner-bottom-->


		<!-- 		<!--new-arrivals-->
		
		<!-- 		<div class="new-arrivals-w3agile"> -->
		<!-- 			<div class="container"> -->
		<!-- 				<h2 class="tittle">New Arrivals</h2> -->
		<!-- 				<div class="arrivals-grids"> -->
		<!-- 					<div class="col-md-3 arrival-grid simpleCart_shelfItem"> -->
		<!-- 						<div class="grid-arr"> -->
		<!-- 							<div class="grid-arrival"> -->
		<!-- 								<figure> -->
		<!-- 									<a href="#" class="new-gri" data-toggle="modal" -->
		<!-- 										data-target="#myModal1"> -->
		<!-- 										<div class="grid-img"> -->
		<%-- 											<img src="${img}/pix1.jpg" class="img-responsive" alt=""> --%>
		<!-- 										</div> -->
		<!-- 										<div class="grid-img"> -->
		<%-- 											<img src="${img}/pix2.jpg" class="img-responsive" alt=""> --%>
		<!-- 										</div> -->
		<!-- 									</a> -->
		<!-- 								</figure> -->
		<!-- 							</div> -->
		<!-- 							<div class="ribben">
<!-- 										<p>NEW</p> -->
		<!-- 									</div> -->
		<!-- 									<div class="ribben1"> -->
		<!-- 										<p>SALE</p> -->
		<!-- 									</div>-->
		
		<!-- 							<div class="block"> -->
		<!-- 								<div class="starbox small ghosting"></div> -->
		<!-- 							</div> -->
		<!-- 							<div class="women"> -->
		<!-- 								<h6> -->
		<!-- 									<a href="single.html">Pixel by Google</a> -->
		<!-- 								</h6> -->
		<!-- 								<span class="size">16 Gb </span> -->
		<!-- 								<p> -->
		<!-- 									<del>Rs.560000</del> -->
		<!-- 									<em class="item_price"> Rs.550000</em> -->
		<!-- 								</p> -->
		<!-- 								<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add -->
		<!-- 									To Cart</a> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 					<div class="col-md-3 arrival-grid simpleCart_shelfItem"> -->
		<!-- 						<div class="grid-arr"> -->
		<!-- 							<div class="grid-arrival"> -->
		<!-- 								<figure> -->
		<!-- 									<a href="#" class="new-gri" data-toggle="modal" -->
		<!-- 										data-target="#myModal2"> -->
		<!-- 										<div class="grid-img"> -->
		<%-- 											<img src="${img}/ip7.png" class="img-responsive" alt=""> --%>
		<!-- 										</div> -->
		<!-- 										<div class="grid-img"> -->
		<%-- 											<img src="${img}/ip71.jpg" class="img-responsive" alt=""> --%>
		<!-- 										</div> -->
		<!-- 									</a> -->
		<!-- 								</figure> -->
		<!-- 							</div> -->
		<!-- 							 <div class="ribben2">
<!-- 										<p>OUT OF STOCK</p> -->
		<!-- 									</div>-->
		
		<!-- 							<div class="block"> -->
		<!-- 								<div class="starbox small ghosting"></div> -->
		<!-- 							</div> -->
		<!-- 							<div class="women"> -->
		<!-- 								<h6> -->
		<!-- 									<a href="single.html">Apple iphone 7</a> -->
		<!-- 								</h6> -->
		<!-- 								<span class="size">128Gb </span> -->
		<!-- 								<p> -->
		<!-- 									<del>Rs.92000</del> -->
		<!-- 									<em class="item_price"> Rs.82000</em> -->
		<!-- 								</p> -->
		<!-- 								<a href="#" data-text="Add To Cart" class=" my-cart-b item_add">Add -->
		<!-- 									To Cart</a> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 					<div class="col-md-3 arrival-grid simpleCart_shelfItem"> -->
		<!-- 						<div class="grid-arr"> -->
		<!-- 							<div class="grid-arrival"> -->
		<!-- 								<figure> -->
		<!-- 									<a href="#" class="new-gri" data-toggle="modal" -->
		<!-- 										data-target="#myModal3"> -->
		<!-- 										<div class="grid-img"> -->
		<%-- 											<img src="${img}/zuk2.jpg" class="img-responsive" alt=""> --%>
		<!-- 										</div> -->
		<!-- 										<div class="grid-img"> -->
		<%-- 											<img src="${img}/zuk1.jpg" class="img-responsive" alt=""> --%>
		<!-- 										</div> -->
		<!-- 									</a> -->
		<!-- 								</figure> -->
		<!-- 							</div> -->
		<!-- 							 <div class="ribben1">
<!-- 										<p>SALE</p> -->
		<!-- 									</div>-->

		<!-- 							<div class="block"> -->
		<!-- 								<div class="starbox small ghosting"></div> -->
		<!-- 							</div> -->
		<!-- 							<div class="women"> -->
		<!-- 								<h6> -->
		<!-- 									<a href="single.html">Lenovo Zuk Z2 Plus</a> -->
		<!-- 								</h6> -->
		<!-- 								<span class="size">64 GB</span> -->
		<!-- 								<p> -->
		<!-- 									<del>Rs.20000</del> -->
		<!-- 									<em class="item_price"> Rs.19000</em> -->
		<!-- 								</p> -->
		<!-- 								<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add -->
		<!-- 									To Cart</a> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 					<div class="col-md-3 arrival-grid simpleCart_shelfItem"> -->
		<!-- 						<div class="grid-arr"> -->
		<!-- 							<div class="grid-arrival"> -->
		<!-- 								<figure> -->
		<!-- 									<a href="#" class="new-gri" data-toggle="modal" -->
		<!-- 										data-target="#myModal4"> -->
		<!-- 										<div class="grid-img"> -->
		<%-- 											<img src="${img}/ipad1.jpg" class="img-responsive" alt=""> --%>
		<!-- 										</div> -->
		<!-- 										<div class="grid-img"> -->
		<%-- 											<img src="${img}/ipad2.jpg" class="img-responsive" alt=""> --%>
		<!-- 										</div> -->
		<!-- 									</a> -->
		<!-- 								</figure> -->
		<!-- 							</div> -->
		<!-- 							<div class="block"> -->
		<!-- 								<div class="starbox small ghosting"></div> -->
		<!-- 							</div> -->
		<!-- 							<div class="women"> -->
		<!-- 								<h6> -->
		<!-- 									<a href="single.html">Apple ipad Air 2</a> -->
		<!-- 								</h6> -->
		<!-- 								<span class="size">128 Gb </span> -->
		<!-- 								<p> -->
		<!-- 									<del>Rs.75000</del> -->
		<!-- 									<em class="item_price"> Rs.74999</em> -->
		<!-- 								</p> -->
		<!-- 								<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add -->
		<!-- 									To Cart</a> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 					<div class="clearfix"></div> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
		<!-- 		<!--new-arrivals-->
		<!-- 		<!--accessories-->
		<!-- 		<!-- 			<div class="accessories-w3l"> -->
		<!-- 				<div class="container"> -->
		<!-- 					<h3 class="tittle">20% Discount on</h3> -->
		<!-- 					<span>TRENDING DESIGNS</span> -->
		<!-- 					<div class="button"> -->
		<!-- 						<a href="#" class="button1"> Shop Now</a> -->
		<!-- 						<a href="#" class="button1"> Quick View</a> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			</div>-->
		<!-- 		<!--accessories-->

		<!-- 		<!--Products-->
		<!-- 		<!-- 		<div class="product-agile"> -->
		<!-- 					<div class="container"> -->
		<!-- 						<h3 class="tittle1"> New Products</h3> -->
		<!-- 						<div class="slider"> -->
		<!-- 							<div class="callbacks_container"> -->
		<!-- 								<ul class="rslides" id="slider"> -->
		<!-- 									<li>	  -->
		<!-- 										<div class="caption"> -->
		<!-- 											<div class="col-md-3 cap-left simpleCart_shelfItem"> -->
		<!-- 												<div class="grid-arr"> -->
		<!-- 													<div  class="grid-arrival"> -->
		<!-- 														<figure>		 -->
		<!-- 															<a href="single.html"> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p14.jpg" class="img-responsive" alt=""> -->
		<!-- 																</div> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p13.jpg" class="img-responsive"  alt=""> -->
		<!-- 																</div>			 -->
		<!-- 															</a>		 -->
		<!-- 														</figure>	 -->
		<!-- 													</div> -->
		<!-- 													<div class="block"> -->
		<!-- 														<div class="starbox small ghosting"> </div> -->
		<!-- 													</div> -->
		<!-- 													<div class="women"> -->
		<!-- 														<h6><a href="single.html">Sed ut perspiciatis unde</a></h6> -->
		<!-- 														<span class="size">XL / XXL / S </span> -->
		<!-- 														<p ><del>$100.00</del><em class="item_price">$70.00</em></p> -->
		<!-- 														<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add To Cart</a> -->
		<!-- 													</div> -->
		<!-- 												</div> -->
		<!-- 											</div> -->
		<!-- 											<div class="col-md-3 cap-left simpleCart_shelfItem"> -->
		<!-- 												<div class="grid-arr"> -->
		<!-- 													<div  class="grid-arrival"> -->
		<!-- 														<figure>		 -->
		<!-- 															<a href="single.html"> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p15.jpg" class="img-responsive" alt=""> -->
		<!-- 																</div> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p16.jpg" class="img-responsive"  alt=""> -->
		<!-- 																</div>			 -->
		<!-- 															</a>		 -->
		<!-- 														</figure>	 -->
		<!-- 													</div> -->
		<!-- 													<div class="ribben"> -->
		<!-- 														<p>NEW</p> -->
		<!-- 													</div> -->
		<!-- 													<div class="block"> -->
		<!-- 														<div class="starbox small ghosting"> </div> -->
		<!-- 													</div> -->
		<!-- 													<div class="women"> -->
		<!-- 														<h6><a href="single.html">Sed ut perspiciatis unde</a></h6> -->
		<!-- 														<span class="size">XL / XXL / S </span> -->
		<!-- 														<p ><del>$100.00</del><em class="item_price">$70.00</em></p> -->
		<!-- 														<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add To Cart</a> -->
		<!-- 													</div> -->
		<!-- 												</div> -->
		<!-- 											</div> -->
		<!-- 											<div class="col-md-3 cap-left simpleCart_shelfItem"> -->
		<!-- 												<div class="grid-arr"> -->
		<!-- 													<div  class="grid-arrival"> -->
		<!-- 														<figure>		 -->
		<!-- 															<a href="single.html"> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p18.jpg" class="img-responsive" alt=""> -->
		<!-- 																</div> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p17.jpg" class="img-responsive"  alt=""> -->
		<!-- 																</div>			 -->
		<!-- 															</a>		 -->
		<!-- 														</figure>	 -->
		<!-- 													</div> -->
		<!-- 													<div class="ribben1"> -->
		<!-- 														<p>SALE</p> -->
		<!-- 													</div> -->
		<!-- 													<div class="block"> -->
		<!-- 														<div class="starbox small ghosting"> </div> -->
		<!-- 													</div> -->
		<!-- 													<div class="women"> -->
		<!-- 														<h6><a href="single.html">Sed ut perspiciatis unde</a></h6> -->
		<!-- 														<span class="size">XL / XXL / S </span> -->
		<!-- 														<p ><del>$100.00</del><em class="item_price">$70.00</em></p> -->
		<!-- 														<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add To Cart</a> -->
		<!-- 													</div> -->
		<!-- 												</div> -->
		<!-- 											</div> -->
		<!-- 											<div class="col-md-3 cap-left simpleCart_shelfItem"> -->
		<!-- 												<div class="grid-arr"> -->
		<!-- 													<div  class="grid-arrival"> -->
		<!-- 														<figure>		 -->
		<!-- 															<a href="single.html"> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p20.jpg" class="img-responsive" alt=""> -->
		<!-- 																</div> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p19.jpg" class="img-responsive"  alt=""> -->
		<!-- 																</div>			 -->
		<!-- 															</a>		 -->
		<!-- 														</figure>	 -->
		<!-- 													</div> -->
		<!-- 													<div class="ribben"> -->
		<!-- 														<p>-20%</p> -->
		<!-- 													</div> -->
		<!-- 													<div class="block"> -->
		<!-- 														<div class="starbox small ghosting"> </div> -->
		<!-- 													</div> -->
		<!-- 													<div class="women"> -->
		<!-- 														<h6><a href="single.html">Sed ut perspiciatis unde</a></h6> -->
		<!-- 														<span class="size">XL / XXL / S </span> -->
		<!-- 														<p ><del>$100.00</del><em class="item_price">$70.00</em></p> -->
		<!-- 														<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add To Cart</a> -->
		<!-- 													</div> -->
		<!-- 												</div> -->
		<!-- 											</div> -->
		<!-- 											<div class="clearfix"></div> -->
		<!-- 										</div> -->
		<!-- 									</li> -->
		<!-- 									<li>	  -->
		<!-- 										<div class="caption"> -->
		<!-- 											<div class="col-md-3 cap-left simpleCart_shelfItem"> -->
		<!-- 												<div class="grid-arr"> -->
		<!-- 													<div  class="grid-arrival"> -->
		<!-- 														<figure>		 -->
		<!-- 															<a href="single.html"> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p21.jpg" class="img-responsive" alt=""> -->
		<!-- 																</div> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p22.jpg" class="img-responsive"  alt=""> -->
		<!-- 																</div>			 -->
		<!-- 															</a>		 -->
		<!-- 														</figure>	 -->
		<!-- 													</div> -->
		<!-- 													<div class="block"> -->
		<!-- 														<div class="starbox small ghosting"> </div> -->
		<!-- 													</div> -->
		<!-- 													<div class="women"> -->
		<!-- 														<h6><a href="single.html">Sed ut perspiciatis unde</a></h6> -->
		<!-- 														<span class="size">XL / XXL / S </span> -->
		<!-- 														<p ><del>$100.00</del><em class="item_price">$70.00</em></p> -->
		<!-- 														<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add To Cart</a> -->
		<!-- 													</div> -->
		<!-- 												</div> -->
		<!-- 											</div> -->
		<!-- 											<div class="col-md-3 cap-left simpleCart_shelfItem"> -->
		<!-- 												<div class="grid-arr"> -->
		<!-- 													<div  class="grid-arrival"> -->
		<!-- 														<figure>		 -->
		<!-- 															<a href="single.html"> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p24.jpg" class="img-responsive" alt=""> -->
		<!-- 																</div> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p23.jpg" class="img-responsive"  alt=""> -->
		<!-- 																</div>			 -->
		<!-- 															</a>		 -->
		<!-- 														</figure>	 -->
		<!-- 													</div> -->
		<!-- 													<div class="ribben"> -->
		<!-- 														<p>NEW</p> -->
		<!-- 													</div> -->
		<!-- 													<div class="block"> -->
		<!-- 														<div class="starbox small ghosting"> </div> -->
		<!-- 													</div> -->
		<!-- 													<div class="women"> -->
		<!-- 														<h6><a href="single.html">Sed ut perspiciatis unde</a></h6> -->
		<!-- 														<span class="size">XL / XXL / S </span> -->
		<!-- 														<p ><del>$100.00</del><em class="item_price">$70.00</em></p> -->
		<!-- 														<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add To Cart</a> -->
		<!-- 													</div> -->
		<!-- 												</div> -->
		<!-- 											</div> -->
		<!-- 											<div class="col-md-3 cap-left simpleCart_shelfItem"> -->
		<!-- 												<div class="grid-arr"> -->
		<!-- 													<div  class="grid-arrival"> -->
		<!-- 														<figure>		 -->
		<!-- 															<a href="single.html"> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p26.jpg" class="img-responsive" alt=""> -->
		<!-- 																</div> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p25.jpg" class="img-responsive"  alt=""> -->
		<!-- 																</div>			 -->
		<!-- 															</a>		 -->
		<!-- 														</figure>	 -->
		<!-- 													</div> -->
		<!-- 													<div class="ribben"> -->
		<!-- 														<p>-75%</p> -->
		<!-- 													</div> -->
		<!-- 													<div class="block"> -->
		<!-- 														<div class="starbox small ghosting"> </div> -->
		<!-- 													</div> -->
		<!-- 													<div class="women"> -->
		<!-- 														<h6><a href="single.html">Sed ut perspiciatis unde</a></h6> -->
		<!-- 														<span class="size">XL / XXL / S </span> -->
		<!-- 														<p ><del>$100.00</del><em class="item_price">$70.00</em></p> -->
		<!-- 														<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add To Cart</a> -->
		<!-- 													</div> -->
		<!-- 												</div> -->
		<!-- 											</div> -->
		<!-- 											<div class="col-md-3 cap-left simpleCart_shelfItem"> -->
		<!-- 												<div class="grid-arr"> -->
		<!-- 													<div  class="grid-arrival"> -->
		<!-- 														<figure>		 -->
		<!-- 															<a href="single.html"> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p10.jpg" class="img-responsive" alt=""> -->
		<!-- 																</div> -->
		<!-- 																<div class="grid-img"> -->
		<!-- 																	<img  src="${img}/p9.jpg" class="img-responsive"  alt=""> -->
		<!-- 																</div>			 -->
		<!-- 															</a>		 -->
		<!-- 														</figure>	 -->
		<!-- 													</div> -->
		<!-- 													<div class="ribben"> -->
		<!-- 														<p>NEW</p> -->
		<!-- 													</div> -->
		<!-- 													<div class="block"> -->
		<!-- 														<div class="starbox small ghosting"> </div> -->
		<!-- 													</div> -->
		<!-- 													<div class="women"> -->
		<!-- 														<h6><a href="single.html">Sed ut perspiciatis unde</a></h6> -->
		<!-- 														<span class="size">XL / XXL / S </span> -->
		<!-- 														<p ><del>$100.00</del><em class="item_price">$70.00</em></p> -->
		<!-- 														<a href="#" data-text="Add To Cart" class="my-cart-b item_add">Add To Cart</a> -->
		<!-- 													</div> -->
		<!-- 												</div> -->
		<!-- 											</div> -->
		<!-- 											<div class="clearfix"></div> -->
		<!-- 										</div> -->
		<!-- 									</li> -->
		<!-- 								</ul> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		
		<!-- 		<!--Products-->
	</div>

	<footer>
		<%@include file="shared/Footer.jsp"%>
	</footer>