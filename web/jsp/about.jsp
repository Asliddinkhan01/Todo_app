<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/5/2022
  Time: 10:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
          integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
          crossorigin="anonymous"/>
    <style>
        .footer {
            width: 100%;
            height: 200px;
            background-color: black;
        }

        .text-opacity-50:hover {
            color: #0d6efd !important;
        }
    </style>
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
<section>
    <div class="container pt-5">
        <div class="row mt-4">
            <div class="d-flex justify-content-center">
                <img src="https://thumb.tildacdn.com/tild3337-3639-4466-b162-386437653063/-/resize/150x/-/format/webp/12.jpg"
                     style="border-radius: 50%" class="img-fluid mt-5" alt="jncnd" width="200px" height="200px">
            </div>
        </div>
        <div class="row mt-4">
            <div class="d-flex justify-content-center">
                <h1 class="fw-light fw-bold mt-5 fs-1">Asliddin Kenjaev</h1>
            </div>
        </div>
        <div class="row mt-4">
            <div class="d-flex justify-content-center">
                <p class="fw-lighter fs-5">I am a junior java developer based out of Tashkent, specializing in back-end
                    programs.</p>
            </div>
        </div>
        <div class="row mt-5">
            <div class="d-flex justify-content-center mt-5">
                <h1 class="fw-light fw-bold mt-5 fs-1">Contact us:</h1>
            </div>
        </div>
        <div class="row mt-3">
            <div class="d-flex justify-content-center">
                <h6 class="fw-light mt-5 fs-4">+998 (90) 341 15 11</h6>
            </div>
        </div>
        <div class="row mt-1">
            <div class="d-flex justify-content-center">
                <h6 class="fw-light mt-2 fs-4">+998 (97) 890 05 71</h6>
            </div>
        </div>
        <div class="row mt-3">
            <div class="d-flex justify-content-center">
                <a href="https://asliddinkenjaev17@gmail.com" style="text-decoration: none">
                    <h6 class="fw-light mt-2 fs-4 text-primary text-opacity-50">
                        asliddinkenjaev17@gmail.com
                    </h6>
                </a>
            </div>
        </div>
        <div class="row mt-3 mb-5">
            <div class="d-flex justify-content-center">
                <h6 class="fw-light fs-2 m-2">
                    <a style="color: black" href="https://www.facebook.com/asliddin.kenjayev.98">
                        <i class="fab fa-facebook"></i>
                    </a>
                </h6>
                <h6 class="fw-light fs-2 m-2">
                    <a style="color: black" href="https://www.instagram.com/asliddinkhan_17/">
                        <i class="fab fa-instagram"></i>
                    </a>
                </h6>
                <h6 class="fw-light fs-2 m-2">
                    <a style="color: black" href="https://www.linkedin.com/in/asliddin-kenjayev-913644211/">
                        <i class="fab fa-linkedin"></i>
                    </a>
                </h6>
                <h6 class="fw-light fs-2 m-2">
                    <a style="color: black" href="https://t.me/A20030617">
                        <i class="fab fa-telegram"></i>
                    </a>
                </h6>
            </div>
        </div>
    </div>
</section>
<footer class="footer">
    <div class="container p-5">
        <div class="d-flex justify-content-center">
            <form action="#" class="row g-3">
                <div class="col-auto mt-5">
                    <label for="inputPassword2" class="visually-hidden">Password</label>
                    <input type="email" class="form-control" id="inputPassword2" placeholder="Email">
                </div>
                <div class="col-auto mt-5">
                    <button type="submit" class="btn btn-light mb-3">Subscribe</button>
                </div>
            </form>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
