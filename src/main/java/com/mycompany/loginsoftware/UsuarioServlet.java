package com.mycompany.loginsoftware;

import com.softwareinc.loginsoftware.model.Usuario;
import com.softwareinc.loginsoftware.util.HibernateUtil;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        Session session = HibernateUtil.getSessionFactory().openSession();

        if ("eliminar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Transaction tx = session.beginTransaction();
            Usuario u = session.get(Usuario.class, id);
            if (u != null) session.remove(u);
            tx.commit();
        }

        List<Usuario> lista = session.createQuery("from Usuario", Usuario.class).list();
        session.close();

        request.setAttribute("listaUsuarios", lista);
        request.getRequestDispatcher("gestion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        Usuario nuevoU = new Usuario();
        nuevoU.setUsername(username);
        nuevoU.setPassword(pass);

        session.persist(nuevoU); 
        tx.commit();
        session.close();

        response.sendRedirect("UsuarioServlet"); 
    }
}