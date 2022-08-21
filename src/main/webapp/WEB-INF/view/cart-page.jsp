<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Site CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<title>Hoot's Shop</title>
</head>

<body>
	<header>
		<!-- Include the nav bar -->
		<%@ include file="top-bar.jsp"%>

		<!-- Currently not planning for mobile support. May add that later. So, keeping the collapsing navbar. -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-success fw-bold">
			<!-- This is just here for the extra margin it provides. Only for design purpose     -->
		</nav>
	</header>

	<main>
		<div class="container">
			<div class="container h-100 py-5">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-10">

						<div
							class="border-bottom border-success my-section-heading-layout">
							<h1 class="text-success my-section-heading">My Shopping Cart</h1>
						</div>

						<!-- Dynamically add cart items -->
						<c:forEach var="cart" items="${carts}">
							<%@ include file="product-cart-item.jsp"%>
							<%-- 							<% total = total + cart.product.price; %> --%>
						</c:forEach>

						<div class="card border-success">
							<div
								class="card-body d-flex align-items-right justify-content-end">
								<span class="badge text-success fs-2">Total Price:
									$${totalPrice}</span>
								<button class="btn btn-success btn-lg">Proceed to Pay</button>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Include footer -->
	<%@ include file="footer.jsp"%>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- Site Scripts -->
	<script type="text/javascript">
		function onClickDelete(cartId) {
			$.ajax({
				url : '${pageContext.request.contextPath}/removeCart?cartId=' + cartId,
				type : 'POST',
				success : function() {
					$('#cart-' + cartId).remove()
					console.log("Ok")
				}
			});
		}
	</script>
</body>

</html>