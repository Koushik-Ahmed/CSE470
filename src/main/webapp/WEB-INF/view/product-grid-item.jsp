<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head></head>
<body>
	<div class="col" style="min-width: 200px; min-height: auto;">
		<div class="card border-success h-100"
			onclick="location.href='${pageContext.request.contextPath}/product?productId=${product.id}'">
			<img
				src="${pageContext.request.contextPath}/resources/images/${product.imagePath}"
				class="card-img-top my-product-img" alt="...">
			<div class="card-body">
				<h5 class="card-title">${product.name}</h5>
				<p class="card-text">
					$${product.price - ((product.discountRate/100) * product.price)} <s>$${product.price}</s>
				</p>
			</div>
			<div class="card-footer bg-transparent border-top-0">
				<!-- Add appropriate product tags -->
				<c:choose>
					<c:when test="${product.newFlag == 1}">
						<span class="badge bg-info text-dark">New</span>
					</c:when>
					<c:when test="${product.newFlag == 0}">
						<span class="badge bg-warning text-dark">Used</span>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>