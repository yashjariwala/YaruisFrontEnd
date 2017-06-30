/// <reference path="./angular.min.js"/>

//search for supplier
var app = angular
		.module("app", [])
		.controller(
				'mysController',
				function($scope, $http) {
					// alert('Yash');
					$scope.listSupplier = function() {
						// alert('before contol call');
						$http
								.get(
										'/EcommerceFrontEnd/listsupplierjson')
								.success(function(data) {
									// alert('after contol call');

									$scope.suppliers = data;
									console.log(data);
									console.log('sup');
								})

					}

				})

// search for category

var app = angular
		.module("catapp", [])
		.controller(
				'mycatController',
				function($scope, $http) {
					// alert('Yash');
					$scope.listCategory = function() {
						// alert('before contol call');
						$http
								.get(
										'/EcommerceFrontEnd/listcatgeoryjson')
								.success(function(data) {
									// alert('after contol call');

									$scope.categories = data;
									console.log(data);
									console.log('catg');
								})

					}

				})

// search for products

var app = angular
		.module("prodapp", [])
		.controller(
				'myprodController',
				function($scope, $http) {
					// alert('Yash');
					$scope.listProduct = function() {
						// alert('before contol call');
						$http
								.get(
										'/EcommerceFrontEnd/listproductsjson')
								.success(function(data) {
									// alert('after contol call');

									$scope.products = data;
									console.log(data);
									console.log('after contol call1');
								})

					}

				})
