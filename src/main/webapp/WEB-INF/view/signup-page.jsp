<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hoot's Shop Registration</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/css/signin.css" rel="stylesheet">
</head>

<body class="text-center">

    <main class="form-signin">
        <form:form action="${pageContext.request.contextPath}/registerUser" modelAttribute="newUser">
            <img class="mb-4" src="${pageContext.request.contextPath}/resources/images/logo-green.png" alt="Hoot's Shop logo" width="100" height="auto">
            <h1 class="h3 mb-3 fw-normal">Please enter your info</h1>
			
			<div class="form-floating">
                <form:input type="text" class="form-control" id="floatingInput" placeholder="Your Name" style="margin-bottom:5px" path="name" />
                <label for="floatingInput">Name</label>
            </div>
            <div class="form-floating">
                <form:input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" style="margin-bottom:5px" path="email" />
                <label for="floatingInput">Email address</label>
            </div>
            <div class="form-floating">
                <form:input type="password" class="form-control" id="floatingPassword" placeholder="Password" style="margin-bottom:5px" path="password" />
                <label for="floatingPassword">Password</label>
            </div>
            <div class="form-floating">
                <form:input type="text" class="form-control" id="floatingInput" placeholder="Address" style="margin-bottom:5px" path="address" />
                <label for="floatingInput">Address</label>
            </div>
            <div class="form-floating">
                <form:input type="text" class="form-control" id="floatingInput" placeholder="Phone Number" style="margin-bottom:10px" path="phoneNumber" />
                <label for="floatingInput">Phone Number</label>
            </div>

            <button class="w-100 btn btn-lg btn-success" type="submit">Sign Up</button>
            
            <p class="mt-5 mb-3 text-muted">&copy; 2022 Hoot's Shop inc.</p>
        </form:form>
    </main>



</body>

</html>