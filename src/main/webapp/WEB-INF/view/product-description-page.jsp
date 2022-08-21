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
		<!-- Include the top bar -->
		<%@ include file="top-bar.jsp"%>

		<nav class="navbar navbar-expand-lg navbar-dark bg-success fw-bold">
			<!-- This is just here for the extra margin it provides. Only for design purpose     -->
		</nav>
	</header>

	<main>
		<div class="container">

			<div class="card mb-3 border-success text-success">
				<div class="row g-0">
					<div class="col-md-4">
						<img
							src="${pageContext.request.contextPath}/resources/images/${product.imagePath}"
							class="img-fluid rounded-start" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h1 class="card-title my-product-desc-title">${product.name}</h1>

							<div class="d-flex aligh-items-center">
								<!-- Have to hide/show these tags automatically based on the product's condition -->
								<!-- Add appropriate product tags -->
								<c:choose>
									<c:when test="${product.newFlag == 1}">
										<p class="badge bg-info text-dark fs-4 m-1">New</p>
									</c:when>
									<c:when test="${product.newFlag == 0}">
										<p class="badge bg-warning text-dark fs-4 m-1">Used</p>
									</c:when>
								</c:choose>
								
								<c:choose>
									<c:when test="${product.stock > 0}">
										<p class="badge bg-success fs-4 m-1">In Stock</p>
									</c:when>
									<c:otherwise>
										<p class="badge bg-danger fs-4 m-1">Out of Stock</p>
									</c:otherwise>
								</c:choose>

							</div>

							<p class="card-text my-product-desc-seller-name">Seller: ${sellerName}</p>

							<p class="fs-1">Price: $${product.price - ((product.discountRate/100) * product.price)} <s>$${product.price}</s></p>

							<form id="cartForm" action="${pageContext.request.contextPath}/addToCart">
								<div class="d-flex aligh-items-center">
									<label for="quantity"><span class="fs-3 m-1">Quantity:</span></label>
									<input class="border-3 rounded border-success" type="number"
										id="quantity" name="quantity" aria-label="quantity" min="1"
										max="${product.stock}" value="1"/>
								</div>

								<input type="hidden" name="productId" value="${product.id}" />

								<div
									class="card-body d-flex align-items-right justify-content-end">
									<button id="addToCartBtn" class="btn btn-success btn-lg" type="submit" <c:if test="${product.stock == 0}">disabled="disabled"</c:if>>Add to Cart</button>
								</div>
							</form>

							<!-- Added to cart toast message -->
							<div class="position-fixed bottom-0 end-0 p-3">
								<div id="addedToCartToast" class="toast" role="alert"
									aria-live="assertive" aria-atomic="true">
									<div class="toast-header">
										<strong class="me-auto">Successfully added to cart!</strong>
										<button type="button" class="btn-close"
											data-bs-dismiss="toast" aria-label="Close"></button>
									</div>
									<div class="toast-body">${product.name}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Product Specification -->
			<div
				class="row border-bottom border-success my-section-heading-layout">
				<h1 class="text-success my-section-heading">Product Specification</h1>
			</div>
			
			<c:choose>
				<c:when test="${product.newFlag == 1}">
					<p class="text-success fs-4">Warranty: ${product.warrantyDuration} month(s)</p>
				</c:when>
				<c:otherwise>
					<p class="text-success fs-4">Usage Duration: ${product.usageDuration} day(s)</p>
				</c:otherwise>
			</c:choose>
			
			<p class="text-success fs-4">Stock: ${product.stock} unit(s)</p>	

			<!-- Procuct description -->
			<div
				class="row border-bottom border-success my-section-heading-layout">
				<h1 class="text-success my-section-heading">Product Description</h1>
			</div>

			<p class="text-success fs-4">${product.description}</p>

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
// 		var toastTrigger = document.getElementById('addToCartBtn')
		var toastMessage = document.getElementById('addedToCartToast')
		
		$(function() {
			$("#cartForm").on("submit", function(e) {
				e.preventDefault();
				$.ajax({
					url : $(this).closest('form').attr('action'),
					type : 'POST',
					data : $(this).serialize(),
					success : function() {
						console.log("Ok")

						var toast = new bootstrap.Toast(toastMessage)
						toast.show()
					}
				});
			});
		});

		
// 		if (toastTrigger) {
// 			toastTrigger.addEventListener('click', function() {
				

// 				console.log("Hello World!");
// 			})
// 		}
	</script>
</body>

</html>