<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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

		<!-- Include the nav bar -->
		<%@ include file="nav-bar.jsp"%>
	</header>

	<main>
		<div class="container">
			<div
				class="row border-bottom border-success my-section-heading-layout">
				<h1 class="text-success my-section-heading">Ongoing Sales</h1>
			</div>
			
			<div class="row row-cols-1 row-cols-md-5 g-4">
			
				<c:forEach var="product" items="${productList}">
					<!-- Dynamically populate cards depending on category -->
					<!-- NOTE: Comments are NOT allowed inside "choose" tag -->
					<c:choose>
					
						<c:when test="${(homePageCategory == 0) && (product.discountRate > 0.0)}">
							<%@ include file="product-grid-item.jsp" %>
						</c:when>
						
						<c:when test="${(homePageCategory == 1) && (product.categoryId == 1) && (product.discountRate > 0.0)}">
							<%@ include file="product-grid-item.jsp" %>
						</c:when>
						
						<c:when test="${(homePageCategory == 2) && (product.categoryId == 2) && (product.discountRate > 0.0)}">
							<%@ include file="product-grid-item.jsp" %>
						</c:when>
						
						<c:when test="${(homePageCategory == 3) && (product.categoryId == 3) && (product.discountRate > 0.0)}">
							<%@ include file="product-grid-item.jsp" %>
						</c:when>
						
					</c:choose>

				</c:forEach>

			</div>
		</div>
	</main>

	<!-- Include footer -->
	<%@ include file="footer.jsp" %>

	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>

</html>