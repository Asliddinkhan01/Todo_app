<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/4/2022
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tasks</title>
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
<div class="container">
    <h1 class="fs-1 fw-lighter fw-bold text-center m-5"> Welcome !</h1>
    <div class="d-flex justify-content-between mt-5 mb-3">
        <button class="btn btn-primary btn-lg" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
                aria-controls="offcanvasRight">+Add task
        </button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 id="offcanvasRightLabel">Table Form</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <form action="http://localhost:8082/AddTask" method="post" class="p-4">
                    <c:set var="userEmail" scope="session" value="${userEmail}"/>
                    <input type="hidden" name="userEmail" value="${userEmail}"/>
                    <div class="mb-3">
                        <label for="exampleDropdownFormEmail2" class="form-label">Task title</label>
                        <input name="taskTitle" type="text" class="form-control"
                               id="exampleDropdownFormEmail2">
                    </div>
                    <div class="mb-3">
                        <label for="exampleDropdownFormPassword2" class="form-label">Title description</label>
                        <input name="taskDescription" type="text" class="form-control"
                               id="exampleDropdownFormPassword2">
                    </div>
                    <div class="mb-3">
                        <label for="exampleDropdownFormPassword3" class="form-label">Deadline</label>
                        <input name="deadline" type="date" class="form-control"
                               id="exampleDropdownFormPassword3">
                    </div>
                    <input type="submit" class="btn btn-primary" value="+Add task">
                </form>
            </div>
        </div>
        <div class="dropdown">
            <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" id="dropdownMenuButton1"
                    data-bs-toggle="dropdown" aria-expanded="false">
                Sort by
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="http://localhost:8082/OrderBy?type=deadline&userEmail=${userEmail}">Deadline</a></li>
                <li><a class="dropdown-item" href="http://localhost:8082/OrderBy?type=statusDone&userEmail=${userEmail}">Status done</a></li>
                <li><a class="dropdown-item" href="http://localhost:8082/OrderBy?type=statusInProgress&userEmail=${userEmail}">Status in progress</a></li>
            </ul>
        </div>
        <div><a href="/jsp/loginPage.jsp" class="btn btn-danger btn-lg">Log out</a></div>
    </div>
    <div class="row">
        <c:forEach var="item" items="${taskList}">
            <div class="col-4">
                <div class="card w-100 mb-3 mt-3 shadow rounded">
                    <div class="card-body">
                        <h5 class="card-title">Title: ${item.title}</h5>
                        <p class="card-text">Description: ${item.description}</p>
                        <c:set var="id" scope="session" value="${item.id}"/>
                        <c:set var="status" scope="session" value="${item.status}"/>
                        <c:set var="title" scope="session" value="${item.title}"/>
                        <c:set var="description" scope="session" value="${item.description}"/>
                        <c:set var="deadline" scope="session" value="${item.getDeadline()}"/>
                        <c:set var="createdAt" scope="session" value="${item.getCreatedAt()}"/>
                        <c:set var="updatedAt" scope="session" value="${item.getUpdatedAt()}"/>
                        <c:if test="${status == true}">
                            <p class="card-text">
                                Status: <span class="badge bg-success">Done </span>
                            </p>
                        </c:if>
                        <c:if test="${status == false}">
                            <p class="card-text">
                                Status: <span class="badge bg-warning text-dark">In progress</span>
                            </p>
                        </c:if>
                        <p class="card-text">Deadline: ${deadline}</p>
                        <p class="card-text">
                            Created at: ${createdAt}</p>
                        <p class="card-text">
                            Updated at: ${updatedAt}</p>
                        <div class="row d-flex justify-content-centre">
                            <c:if test="${status == false}">
                                <div class="col">
                                    <a href="http://localhost:8082/EditTask?id=${id}&title=${title}&description=${description}&userEmail=${userEmail}&deadline=${deadline}"
                                       class="btn btn-warning"><i class="fas fa-edit"></i></a>
                                </div>
                            </c:if>
                            <div class="col">
                                <a href="http://localhost:8082/DeleteTask?id=${id}&userEmail=${userEmail}" class="btn btn-danger"><i class="fas fa-trash-alt"></i></a>
                            </div>
                            <c:if test="${status == false}">
                                <div class="col">
                                    <a href="http://localhost:8082/CompleteTask?id=${id}&userEmail=${userEmail}" class="btn btn-success"><i class="fas fa-check"></i></a>
                                </div>
                            </c:if>

                            <c:if test="${status == true}">
                                <div class="col">
                                    <a href="http://localhost:8082/MakeUndoTask?id=${id}&userEmail=${userEmail}" class="btn btn-secondary"><i class="fas fa-undo-alt"></i></a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
