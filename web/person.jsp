<%-- 
    Document   : person
    Created on : 14-feb-2023, 10:30:05
    Author     : hugop
--%>

<%@page import="entities.Rating"%>
<%@page import="entities.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="entities.Person"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <title>Movies y tak</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/mycss.css">
</head>
<body>
    <%List<Person> persons = (List<Person>) session.getAttribute("persons");
          Usuario usuario = (Usuario) session.getAttribute("usuario");
          %>
    
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
                <%if(usuario==null){%>
                <form class="form-inline my-2 my-lg-0" action="Controller?op=login" method="POST">
                    <input class="form-control mr-sm-2" type="text" placeholder="dni" name="dni">
                    <input class="form-control mr-sm-2" type="text" placeholder="nombre" name="nombre">
                   <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login/Register</button>
                </form>
                <%} else {%>
                <div>
                <span>Hola! <%=usuario.getNombre()%></span>
                <a href="Controller?op=logout"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button></a>
                </div> <%}%>
            </div>
        </nav>
        <!-- Person -->
        <div class="row justify-content-center px-3">
            <%for(Person person : persons){%>
            <div class="col-md-6 col-lg-4 p-3">
                <div class="card h-100">
                    <img class="card-img-top img-fluid" src="https://image.tmdb.org/t/p/w500<%=person.getFoto()%>" alt="">
                    <div class="card-body">
                        <p class="text-center">
                            <span class="display-4">
                                <%int total;
                                      float puntos = 0;
                                      List<Rating> ratings = person.getRatingList();
                                      
                                    for (int i=0; i<ratings.size(); i++) {
                                        puntos += ratings.get(i).getPuntos();
                                    }
                                
                                    total = Math.round(puntos/ratings.size());
                                    
                                    for (int i = 0; i<total; i++){ %>
                                &#9733; <%}%>
                            </span>
                        <p>
                        <h4 class="card-title text-center"><%=person.getNombre()%></h4>
                    </div>
                    <%if(usuario!=null){%>
                    <div class="text-center">
                        <span class="rating">
                            <a href="Controller?op=rating&rating=1&personid=<%=person.getId()%>">&#9733;</a>
                            <a href="Controller?op=rating&rating=2&personid=<%=person.getId()%>">&#9733;</a>
                            <a href="Controller?op=rating&rating=3&personid=<%=person.getId()%>">&#9733;</a>
                            <a href="Controller?op=rating&rating=4&personid=<%=person.getId()%>">&#9733;</a>
                            <a href="Controller?op=rating&rating=5&personid=<%=person.getId()%>">&#9733;</a>
                        </span>	
                    </div>
                    <div class="card-footer text-center">
                        <button class="btn btn-success" data-toggle="modal" data-target="#modalmovies" data-id="<%=person.getId()%>" data-nombre="<%=person.getNombre()%>">FILMOGRAFÍA</button>
                    </div>
                    <%}%>
                </div>
            </div>
            <%}%>
        </div>
        <footer>
            <h2 class="text-center bg-dark text-success py-3">The MovieDB - Azarquiel 2020</h2>
        </footer>
    </div>
        
<!-- Modal -->
<div class="modal fade" id="modalmovies" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <h3 class="modal-title bg-dark text-success text-center">Movies</h3>
            <div class="modal-header">
                <h4 class="text-success"></h4>
            </div>
            <div class="modal-body" id="movies">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="js/myjs.js"></script>
</body>

</html>
