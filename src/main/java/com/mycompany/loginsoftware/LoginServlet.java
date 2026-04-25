package com.mycompany.loginsoftware;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        String url = "jdbc:mysql://localhost:3306/software_db";
        String dbUser = "root";
        String dbPass = ""; 

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass)) {
                String sql = "SELECT * FROM usuarios WHERE username = ? AND password = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, user);
                ps.setString(2, pass);
                
                ResultSet rs = ps.executeQuery();
                
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("usuarioLogueado", user);
                    response.sendRedirect("bienvenida.jsp");
                } else {
                    request.setAttribute("error", "Credenciales incorrectas.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            request.setAttribute("error", "Error de sistema: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
