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

		<nav class="navbar navbar-expand-lg navbar-dark bg-success fw-bold">
			<!-- This is just here for the extra margin it provides. Only for design purpose     -->
		</nav>
	</header>

	<main>
		<div class="container">
			<div
				class="row border-bottom border-success my-section-heading-layout">
				<h1 class="text-success my-section-heading">Search Results
					"${searchString}"</h1>
			</div>

			<div class="d-flex align-items-start">
				<div class="nav flex-column nav-pills me-3" id="v-pills-tab"
					role="tablist" aria-orientation="vertical">
					<button class="nav-link active" id="v-pills-home-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button"
						role="tab" aria-controls="v-pills-home" aria-selected="true">All</button>
					<button class="nav-link" id="v-pills-profile-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-profile"
						type="button" role="tab" aria-controls="v-pills-profile"
						aria-selected="false">Electronics</button>
					<button class="nav-link" id="v-pills-messages-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-messages"
						type="button" role="tab" aria-controls="v-pills-messages"
						aria-selected="false">Gadgets</button>
					<button class="nav-link" id="v-pills-settings-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-settings"
						type="button" role="tab" aria-controls="v-pills-settings"
						aria-selected="false">Toys</button>
				</div>
				<div class="tab-content" id="v-pills-tabContent">
					<!-- 'All' Category section -->
					<div class="tab-pane fade show active" id="v-pills-home"
						role="tabpanel" aria-labelledby="v-pills-home-tab">

						<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="pills-home-tab"
									data-bs-toggle="pill" data-bs-target="#pills-home"
									type="button" role="tab" aria-controls="pills-home"
									aria-selected="true">New</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="pills-profile-tab"
									data-bs-toggle="pill" data-bs-target="#pills-profile"
									type="button" role="tab" aria-controls="pills-profile"
									aria-selected="false">Used</button>
							</li>
						</ul>
						
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-home"
								role="tabpanel" aria-labelledby="pills-home-tab">
								<!-- 'ALL' | 'New' Section -->

								<div class="row row-cols-1 row-cols-md-5 g-4">
									<!-- Products will be added dynamically -->
									<c:forEach var="product" items="${matchedProducts}">
										
										<c:if test="${product.newFlag == 1}">
											<%@ include file="product-grid-item.jsp"%>
										</c:if>

									</c:forEach>

								</div>

							</div>
							
							<div class="tab-pane fade" id="pills-profile" role="tabpanel"
								aria-labelledby="pills-profile-tab">
								<!-- 'ALL' | 'Used' Section -->
								
								<div class="row row-cols-1 row-cols-md-5 g-4">
									<!-- Products will be added dynamically -->
									<c:forEach var="product" items="${matchedProducts}">
										
										<c:if test="${product.newFlag == 0}">
											<%@ include file="product-grid-item.jsp"%>
										</c:if>
										
									</c:forEach>

								</div>
								
							</div>
						</div>

					</div>
					
					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
						aria-labelledby="v-pills-profile-tab">
						<!-- "Electronics" category section -->
						
						
					</div>
					
					<div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
						aria-labelledby="v-pills-messages-tab">
						<!-- "Gadjets" category section -->
						
					</div>
					
					<div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
						aria-labelledby="v-pills-settings-tab">
						<!-- "Toys" category section -->
						
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
</body>

</html>