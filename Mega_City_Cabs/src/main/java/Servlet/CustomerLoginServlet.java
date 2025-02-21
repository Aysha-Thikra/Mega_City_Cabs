package Servlet;

import Dao.CustomerLoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/customer-login")
public class CustomerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CustomerLoginDAO customerLoginDAO = new CustomerLoginDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        try {
            String validationMessage = customerLoginDAO.validateCustomerLogin(username, password);

            if (validationMessage.equals("success")) {
                request.getSession().setAttribute("username", username);
                
                response.sendRedirect("customer-dashboard.jsp");
            } else {
                request.setAttribute("errorMessage", validationMessage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("customer-login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("customer-login.jsp?error=1");
        }
    }
}
