package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import org.mindrot.jbcrypt.BCrypt;

import Bean.Customer;
import Dao.CustomerDAO;

@WebServlet("/customersignupservlet")
public class CustomerSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match");
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer-signup.jsp");
            dispatcher.forward(request, response);
            return;
        }

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

        Customer newCustomer = new Customer(firstName, lastName, address, nic, phone, email, username, hashedPassword);

        if (CustomerDAO.insertCustomer(newCustomer)) {
            request.setAttribute("successMessage", "Signup successful! Please login.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer-login.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Signup failed. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer-signup.jsp");
            dispatcher.forward(request, response);
        }
    }
}
