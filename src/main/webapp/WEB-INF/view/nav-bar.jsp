<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<body>
	<!-- Currently not planning for mobile support. May add that later. So, keeping the collapsing navbar. -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-success fw-bold">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a
					class="nav-link <c:if test="${homePageCategory==0}">active</c:if>"
					href="${pageContext.request.contextPath}/?category=0"> All </a></li>
				<li class="nav-item"><a
					class="nav-link <c:if test="${homePageCategory==1}">active</c:if>"
					href="${pageContext.request.contextPath}/?category=1">
						Electronics </a></li>
				<li class="nav-item"><a
					class="nav-link <c:if test="${homePageCategory==2}">active</c:if>"
					href="${pageContext.request.contextPath}/?category=2"> Gadgets
				</a></li>
				<li class="nav-item"><a
					class="nav-link <c:if test="${homePageCategory==3}">active</c:if>"
					href="${pageContext.request.contextPath}/?category=3"> Toys </a></li>
			</ul>
		</div>
	</nav>
</body>
</html>