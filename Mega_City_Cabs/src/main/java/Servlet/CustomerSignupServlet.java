package Servlet;

import Bean.Customer;
import Dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/customer-signup")
public class CustomerSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userID = customerDAO.generateNextUserID();

            String firstName = request.getParameter("first_name").trim();
            String lastName = request.getParameter("last_name").trim();
            String phone = request.getParameter("phone").trim();
            String email = request.getParameter("email").trim();
            String address = request.getParameter("address").trim();
            String nic = request.getParameter("nic").trim();
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();

            Customer customer = new Customer(userID, firstName, lastName, address, nic, phone, email, username, password);

            String result = customerDAO.insertCustomer(customer);

            if ("success".equals(result)) {
                response.sendRedirect("customer-login.jsp");
            } else {
                request.setAttribute("errorMessage", result);
                RequestDispatcher dispatcher = request.getRequestDispatcher("customer-signup.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during registration.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer-signup.jsp");
            dispatcher.forward(request, response);
        }
    }
}
