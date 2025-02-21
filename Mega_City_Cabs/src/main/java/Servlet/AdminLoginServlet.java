package Servlet;

import Dao.AdminLoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AdminLoginDAO adminLoginDAO = new AdminLoginDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        try {
            String validationMessage = adminLoginDAO.validateAdminLogin(username, password);

            if (validationMessage.equals("success")) {
                request.getSession().setAttribute("admin_username", username);
                
                response.sendRedirect("admin-dashboard.jsp");
            } else {
                request.setAttribute("errorMessage", validationMessage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("admin-login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("admin-login.jsp?error=1");
        }
    }
}
