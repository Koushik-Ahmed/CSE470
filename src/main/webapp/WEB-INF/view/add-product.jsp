<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Product</title>

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Custom styles for this page -->
<%--     <link href="${pageContext.request.contextPath}/resources/css/signin.css" rel="stylesheet"> --%>
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark fw-bold">
			<!-- This is just here for the extra margin it provides. Only for design purpose     -->
		</nav>
	</header>

	<main>
		<div class="container">

			<div class="text-center">
				<img class="mb-4"
					src="${pageContext.request.contextPath}/resources/images/logo-green.png"
					alt="Hoot's Shop logo" width="100" height="auto">
				<h1 class="h3 mb-3 fw-normal">Please enter product info</h1>
			</div>

			<form:form action="${pageContext.request.contextPath}/addProduct"
				modelAttribute="newProduct" enctype="multipart/form-data" method="post">
				<div class="form-floating mb-3">
					<form:input type="text" class="form-control"
						placeholder="Product Name" path="name" />
					<label for="floatingInput">Product Name</label>
				</div>
				<div class="form-floating mb-3">
					<form:textarea class="form-control"
						placeholder="Product Description" style="margin-bottom:5px"
						path="description" />
					<label for="floatingInput">Product Description</label>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-text">Image</div>
					<input type="file" class="form-control" name="imageFile"/>
					
					<div class="input-group-text">Category</div>
					<form:select class="form-select" path="categoryId">
						<form:options items="${categoryList}" />
						
						<c:forEach var="category" items="${categories}">
							<form:option value="${category.key}" label="${category.value}"/>
						</c:forEach>
					</form:select>
				</div>

				<div class="mb-3">
					<fieldset class="row mb-3">
						<legend class="col-form-label col-sm-2 pt-0"
							style="max-width: 170px">Product Condition:</legend>
						<div class="col-sm-10">
							<div class="form-check">
								<form:radiobutton class="form-check-input" id="new"
									path="newFlag" value="1" />
								<label class="form-check-label" for="new">New</label>
							</div>
							<div class="form-check">
								<form:radiobutton class="form-check-input" id="new"
									path="newFlag" value="0" />
								<label class="form-check-label" for="used">Used</label>
							</div>
						</div>
					</fieldset>
				</div>

				<div class="input-group mb-3" style="justify-content: center">
					<div class="form-floating">
						<form:input type="text" class="form-control" placeholder="Price"
							id="price" path="price" />
						<label for="price">Price</label>
					</div>
					<div class="form-floating">
						<form:input type="text" class="form-control" id="discount-rate"
							placeholder="Discount Rate" path="discountRate" />
						<label for="discount-rate">Discount Rate</label>
					</div>
					<div class="form-floating">
						<form:input type="text" class="form-control" placeholder="Stock"
							id="stock" path="stock" />
						<label for="stock">Stock</label>
					</div>
					<div class="form-floating">
						<form:input type="text" class="form-control"
							id="warranty-duration" placeholder="Warranty Duratoin"
							path="warrantyDuration" />
						<label for="warranty-duration">Warranty Duration</label>
					</div>
					<div class="form-floating">
						<form:input type="text" class="form-control" id="usage-duration"
							placeholder="Usage Duratoin" path="usageDuration" />
						<label for="usage-duration">Usage Duration</label>
					</div>
				</div>

				<div class="text-center">
					<button class="w-100 btn btn-lg btn-success" type="submit"
						style="max-width: 200px">Add Product</button>

					<p class="mt-5 mb-3 text-muted">&copy; 2022 Hoot's Shop inc.</p>
				</div>
			</form:form>
		</div>
	</main>



</body>

</html>