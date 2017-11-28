
var myapp = angular.module("myapp", []).controller(
		'productsController',
		function($scope, $http) {
			$scope.onloadFun = function() {
			}

			$scope.listProduct = function() {
				$http.get('/EcommerceFrontEnd/listproductsjson').success(
						function(data) {
							$scope.products = data;
							console.log(data);
						})
			}

			$scope.addToCart = function(productid) {
				$http.put('/EcommerceFrontEnd/cart/add/' + productid).success(
						function() {
							alert('Added Successfully to the cart!');
						})
			}

			$scope.refreshCart = function() {
				$http.get('/EcommerceFrontEnd/cart/getCart/' + $scope.cartId)
						.success(function(data) {
							$scope.cart = data;
						})
			}

			$scope.getCart = function(cartId) {
				$scope.cartId = cartId;
				// $scope.refreshCart(cartId);
				$scope.refreshCart();
			}

			$scope.removeFromCart = function(cartitemid) {
				$http.put(
						'/EcommerceFrontEnd/cart/removecartitem/' + cartitemid)
						.success(function() {
							$scope.refreshCart();
							alert('Removed Successfully from the cart!');
						})
			}

			$scope.clearCart = function() {

				$http.put(
						'/EcommerceFrontEnd/cart/removeAllItems/'
								+ $scope.cartId)

				.success(function() {

					$scope.refreshCart();
					alert('Successfully cleared the cart!');
				});
			}

			$scope.calculateGrandTotal = function() {
				var grandTotal = 0
				for (var i = 0; i < $scope.cart.cartItems.length; i++) {
					grandTotal = grandTotal
							+ $scope.cart.cartItems[i].totalprice;
					;
				}
				return grandTotal;
			}
		});