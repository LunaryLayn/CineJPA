<%-- 
    Document   : detail
    Created on : 14-feb-2023, 12:39:08
    Author     : hugop
--%>

<%@page import="entities.Movie"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%List<Movie> movies = (List<Movie>) session.getAttribute("movieList");%>

<p>TAN ESPERANDO QUE ME QUITE EL CHALECOOO</p>
<table class="table table-striped text-primary w-50 m-auto">
  <tbody>
      <% for (Movie movie : movies ) {%>
          <tr>
            <td><img src="https://image.tmdb.org/t/p/w500<%=movie.getPoster()%>" class="img-fluid" alt=""></td>
            <td><%=movie.getTitulo()%></td>
          </tr>

      <%}%>
  </tbody>
</table>

