<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head></head>
<body>
	<div id="cart-${cart.cart.id}" class="card border-success rounded-3 mb-4">
		<div class="card-body p-4">
			<div class="row d-flex justify-content-between align-items-center">
				<div class="col-md-2 col-lg-2 col-xl-2">
					<img
						src="${pageContext.request.contextPath}/resources/images/${cart.product.imagePath}"
						class="img-fluid rounded-3" alt="Cotton T-shirt">
				</div>
				<div class="col-md-3 col-lg-3 col-xl-3">
					<p class="lead fw-normal mb-2">${cart.product.name}</p>
<!-- 					<p> -->
<!-- 						<span class="text-muted">Size: </span>M <span class="text-muted">Color: -->
<!-- 						</span>Grey -->
<!-- 					</p> -->
				</div>
				<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
					<input min="0" name="quantity" value="${cart.cart.quantity}" type="number"
						aria-label="quantity_input" class="form-control form-control-sm" />
				</div>
				<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
					<h5 class="mb-0">$${cart.product.price - ((cart.product.discountRate/100) * cart.product.price)}</h5>
				</div>
				<div class="col-md-1 col-lg-1 col-xl-1 text-end">
					<button class="btn btn-outline-danger" title="remove_from_cart_btn" onclick="onClickDelete(${cart.cart.id})">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                    <path
								d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
                                    </svg>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>