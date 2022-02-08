<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/5/2022
  Time: 4:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
          integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
          crossorigin="anonymous"/>

</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid container">
            <a class="navbar-brand" href="/">Todo Web-App</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Disabled</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-light" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</header>
<section>
    <div class="container mt-5 pt-5">
        <div class="accordion accordion-flush" id="accordionFlushExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                        If you are new here register here
                    </button>
                </h2>
                <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                     data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                        <div class="card text-center">
                            <div class="card-header fs-4">
                                Register
                            </div>
                            <div class="card-body ms-5 me-5">
                                <form action="http://localhost:8082/SaveUser" method="post">
                                    <div class="row">
                                        <div class="col ms-5 me-5">
                                            <div class="mb-3 ms-3 row">
                                                <div class="col-sm-10">
                                                    <input placeholder="Full Name" type="text" class="form-control"
                                                           name="name">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col ms-5 me-5">
                                            <div class="mb-3 ms-3 row">
                                                <div class="col-sm-10">
                                                    <input placeholder="example@todo.app" type="Email"
                                                           class="form-control" name="email">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col ms-5 me-5">
                                            <div class="mb-3 ms-3 row">
                                                <div class="col-sm-10">
                                                    <input placeholder="Password" type="password" class="form-control"
                                                           name="password">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col ms-5 me-5">
                                            <div class="mb-3 ms-3 row">
                                                <div class="col-sm-10">
                                                    <input placeholder="Confirm password" type="password"
                                                           class="form-control" name="confirmPass">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" class="btn btn-primary" value="Submit">
                                </form>
                            </div>
                            <div class="card-footer text-muted">
                                <c:set var="status" scope="session" value="${message}"/>
                                <c:if test="${status != null}">
                                    <h4>
                                        <c:out value="${status}"/>
                                    </h4>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                        If you have account sign in here !
                    </button>
                </h2>
                <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo"
                     data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                        <div class="card">
                            <div class="card-header fs-4">
                                Sign in
                            </div>
                            <div class="card-body ms-5 me-5">
                                <form action="http://localhost:8082/SignIn" method="post" class="p-4">
                                    <div class="mb-3">
                                        <label for="exampleDropdownFormEmail2" class="form-label">Email address</label>
                                        <input name="email" type="email" class="form-control"
                                               id="exampleDropdownFormEmail2"
                                               placeholder="email@example.com">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleDropdownFormPassword2" class="form-label">Password</label>
                                        <input name="password" type="password" class="form-control"
                                               id="exampleDropdownFormPassword2"
                                               placeholder="Password">
                                    </div>
                                    <input type="submit" class="btn btn-primary" value="Sign in">
                                </form>
                            </div>
                            <div class="card-footer text-muted">
                                <c:set var="message" scope="session" value="${messageSignIn}"/>
                                <c:if test="${status != null}">
                                    <h4>
                                        <c:out value="${status}"/>
                                    </h4>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
