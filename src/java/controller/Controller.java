package controller;

import entities.Movie;
import entities.Person;
import entities.Rating;
import entities.Usuario;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import util.JPAUtil;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Person> persons;
        List<Movie> movies;
        Usuario usuario = null;
        Query q;
        
        EntityManager em = (EntityManager) session.getAttribute("em");
        if (em == null) {
            em = JPAUtil.getEntityManagerFactory().createEntityManager();
            session.setAttribute("em", em);
        }

        String op = request.getParameter("op");
        if (op.equals("person")) {
            q = em.createNamedQuery("Person.findAll");
            persons = q.getResultList();
            session.setAttribute("persons", persons);
            
            q = em.createNamedQuery("Movie.findAll");
            movies = q.getResultList();
            session.setAttribute("movies", movies);
            
            request.getRequestDispatcher("person.jsp").forward(request, response);
            
        } else if (op.equals("movie")) {
           request.getRequestDispatcher("movie.jsp").forward(request, response);
        }
        
        else if (op.equals("login")) {
            String dni = request.getParameter("dni");
            String nombre = request.getParameter("nombre");
            
            q = em.createQuery("SELECT u FROM Usuario u WHERE u.dni = '"+dni+"' AND u.nombre = '"+nombre+"'");
            try {
                usuario = (Usuario) q.getSingleResult();
            } catch (Exception e) {
                System.out.println(e);
            }

            if (usuario==null) { // Login incorrecto procedemos a insertarlo
                usuario = new Usuario();
                //Si metes numero haces Short.ValueOf("1")
                usuario.setDni(dni);
                usuario.setNombre(nombre);
                EntityTransaction t = em.getTransaction();
                t.begin();
                em.persist(usuario);
                t.commit();
            }
            session.setAttribute("usuario", usuario);
            
           request.getRequestDispatcher("person.jsp").forward(request, response);
        }
        else if (op.equals("logout")) {
            session.removeAttribute("usuario");
           request.getRequestDispatcher("person.jsp").forward(request, response);
        }
        else if (op.equals("detail")) {
             int personid = Integer.parseInt(request.getParameter("personid"));
             Person thisperson = em.find(Person.class, personid);
             
             List<Movie> lista = thisperson.getMovieList();
             
             session.setAttribute("movieList", lista);
             
           request.getRequestDispatcher("detail.jsp").forward(request, response);
        }
        else if (op.equals("rating")) {
           String rat = request.getParameter("rating");
           int personid = Integer.parseInt(request.getParameter("personid"));
           usuario = (Usuario) session.getAttribute("usuario");
           Person thisperson = em.find(Person.class, personid);
           
           Rating rating = new Rating();
           rating.setDni(usuario);
           rating.setIdperson(thisperson);
           rating.setPuntos(Short.valueOf(rat));
           rating.setIdrating(Short.valueOf("1"));
           
           EntityTransaction t = em.getTransaction();
                t.begin();
                em.persist(rating);
                t.commit();
                
                
            q = em.createNamedQuery("Person.findAll");
            persons = q.getResultList();
            session.removeAttribute("persons");
            session.setAttribute("persons", persons);
            
            
           request.getRequestDispatcher("person.jsp").forward(request, response);
        }
        
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
