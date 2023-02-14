<%-- 
    Document   : movie
    Created on : 14-feb-2023, 10:39:59
    Author     : hugop
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
      <%List<Movie> movies = (List<Movie>) session.getAttribute("movies");%>
    <div class="container px-0 shadow">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">
                <img src="img/logotmdb.png" width="64" alt="logo">
            </a>
            <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="Controller?op=person">Person</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="Controller?op=movie">Movie</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="dni" name="dni">
                    <input class="form-control mr-sm-2" type="text" placeholder="nombre" name="nombre">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login/Register</button>
                </form>
            </div>
        </nav>
        <!-- Person -->
        <div class="row justify-content-center px-3">
            <%for(Movie movie : movies) {%>
            <div class="col-md-6 col-sm-12 p-3">
                <div class="card h-100">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="https://image.tmdb.org/t/p/w500<%=movie.getPoster()%>" class="card-img" alt="Imagen">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><%=movie.getTitulo()%></h5>
                                <p class="card-text"><%=movie.getTrama()%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
        <footer>
            <h2 class="text-center bg-dark text-success py-3">The MovieDB - Azarquiel 2020</h2>
        </footer>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
