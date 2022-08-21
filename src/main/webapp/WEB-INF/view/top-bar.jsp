<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head></head>
<body>
	<div class="row bg-success">
		<div class="col-lg-2 my-brand" onclick="location.href='${pageContext.request.contextPath}/'">
			<div class="d-flex">
				<img class="my-logo-image"
					src="${pageContext.request.contextPath}/resources/images/logo.png"
					alt="Owl logo">
				<div class="fs-2 text-white my-brand-text">Hoot's Shop</div>
			</div>
		</div>
		<div class="col my-search-bar">
			<form class="d-flex" action="search">
				<input class="form-control me-2" type="search" name="searchString"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-light" type="submit">Search</button>
			</form>
		</div>
		<div class="col-lg-2 my-user-bar">
			<div class="d-flex my-user-bar-layout">
				<c:choose>
					<c:when test="${currentUser == null}">
						<button class="btn btn-outline-light" onclick="location.href='login'">Login</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-outline-light" onclick="location.href='logout'">Logout</button>
					</c:otherwise>
				</c:choose>
			
				
				<button class="btn btn-outline-light" title="cart_button"
					onclick="location.href='${pageContext.request.contextPath}/showCartPage';">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                            <path
							d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                        </svg>
				</button>
				<button class="btn btn-outline-light" title="add_product_button"
					onclick="location.href='${pageContext.request.contextPath}/addProductPage';">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
							d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z" />
                          </svg>
				</button>
			</div>
		</div>
	</div>
</body>
</html>