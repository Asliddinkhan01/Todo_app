<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/6/2022
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit task</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
                    <input class="btn btn-light" type="submit" value="Search">
                </form>
            </div>
        </div>
    </nav>
</header>
<div class="container pt-5">
    <div class="row">
        <div class="d-flex justify-content-center">
            <c:set var="userEmail" scope="session" value="${userEmail}"/>
            <c:set var="taskId" scope="session" value="${taskId}"/>
            <c:set var="taskTitle" scope="session" value="${taskTitle}"/>
            <c:set var="taskDescription" scope="session" value="${taskDescription}"/>
            <c:set var="deadline" scope="session" value="${deadline}"/>
            <form action="http://localhost:8082/EditTask2" method="post">
                <input type="hidden" name="userEmail" value="${userEmail}"/>
                <input type="hidden" name="taskId" value="${taskId}"/>
                <div class="mb-3">
                    <label for="exampleDropdownFormEmail2" class="form-label">Task title</label>
                    <input type="text" class="form-control" id="exampleDropdownFormEmail2"
                           name="taskTitle" value="${taskTitle}">
                </div>
                <div class="mb-3">
                    <label for="exampleDropdownFormPassword2" class="form-label">Task description</label>
                    <input type="text" class="form-control" id="exampleDropdownFormPassword2"
                           name="taskDescription" value="${taskDescription}">
                </div>
                <div class="mb-3">
                    <label for="exampleDropdownFormPassword3" class="form-label">Deadline</label>
                    <input name="taskDeadline" type="date" class="form-control" id="exampleDropdownFormPassword3" value="${deadline}">
                </div>
                <input type="submit" class="btn btn-primary" value="Save Changes">
            </form>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
