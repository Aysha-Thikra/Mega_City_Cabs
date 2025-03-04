package Servlet;

import Bean.Admin;
import Dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin-signup")
public class AdminSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userID = adminDAO.generateNextUserID();

            String firstName = request.getParameter("first_name").trim();
            String lastName = request.getParameter("last_name").trim();
            String phone = request.getParameter("phone").trim();
            String email = request.getParameter("email").trim();
            String address = request.getParameter("address").trim();
            String nic = request.getParameter("nic").trim();
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();

            Admin admin = new Admin(userID, firstName, lastName, address, nic, phone, email, username, password);

            String validationMessage = adminDAO.checkUniqueFields(admin);
            if (validationMessage != null) {
                request.setAttribute("errorMessage", validationMessage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("admin-signup.jsp");
                dispatcher.forward(request, response);
                return;
            }

            adminDAO.insertAdmin(admin);

            response.sendRedirect("admin-login.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("admin-signup.jsp?error=1");
        }
    }
}
