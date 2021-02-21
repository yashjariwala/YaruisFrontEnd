/// <reference path="./angular.min.js"/>

//search for location
var app = angular.module("locapp", []).controller(
		'mylocController',
		function($scope, $http) {
			$scope.listLocation = function() {
				$http.get('/EcommerceFrontEnd/listlocjson').success(
						function(data) {

							$scope.locations = data;
							console.log(data);
							console.log('loc');
						})

			}

		})


//search for supplier
var app = angular.module("app", []).controller(
		'mysController',
		function($scope, $http) {
			$scope.listSupplier = function() {
				$http.get('/EcommerceFrontEnd/listsupplierjson').success(
						function(data) {

							$scope.suppliers = data;
							console.log(data);
							console.log('sup');
						})

			}

		})

// search for category

var app = angular.module("catapp", []).controller(
		'mycatController',
		function($scope, $http) {
			$scope.listCategory = function() {
				$http.get('/EcommerceFrontEnd/listcatgeoryjson').success(
						function(data) {

							$scope.categories = data;
							console.log(data);
							console.log('catg');
						})

			}

		})

// search for products

var app = angular.module("prodapp", []).controller(
		'myprodController',
		function($scope, $http) {
			$scope.listProduct = function() {
				$http.get('/EcommerceFrontEnd/listproductsjson/').success(
						function(data) {

							$scope.products = data;
							console.log(data);
						})

			}

		})
		
var app = angular.module("prodbycatapp", []).controller(
		'myprodbycatController',
		function($scope, $http) {
			$scope.listProductByCatag = function() {
			var path = window.location.pathname.split('/');
			console.log(path);
			$http.get('/EcommerceFrontEnd/listproductsjson/' + path[3]).success(
					function(data) {

						$scope.products = data;
						console.log(data);
					})
			}
		})

