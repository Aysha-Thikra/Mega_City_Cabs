package Servlet;

import Dao.DriverLoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/driver-login")
public class DriverLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DriverLoginDAO driverLoginDAO = new DriverLoginDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        try {
            String validationMessage = driverLoginDAO.validateDriverLogin(username, password);

            if (validationMessage.equals("success")) {
                request.getSession().setAttribute("username", username);
                
                response.sendRedirect("driver-dashboard.jsp");
            } else {
                request.setAttribute("errorMessage", validationMessage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("driver-login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("driver-login.jsp?error=1");
        }
    }
}
