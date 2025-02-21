package Servlet;

import Bean.Driver;
import Dao.DriverDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/driver-signup")
public class DriverSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DriverDAO driverDAO = new DriverDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userID = driverDAO.generateNextUserID();

            String firstName = request.getParameter("first_name").trim();
            String lastName = request.getParameter("last_name").trim();
            String phone = request.getParameter("phone").trim();
            String email = request.getParameter("email").trim();
            String address = request.getParameter("address").trim();
            String nic = request.getParameter("nic").trim();
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();
            String licenseNumber = request.getParameter("license_number").trim();

            Driver driver = new Driver(userID, firstName, lastName, address, nic, phone, email, username, password, licenseNumber);

            String validationResult = driverDAO.checkUniqueFields(driver);
            if (validationResult != null) {
                request.setAttribute("errorMessage", validationResult);
                RequestDispatcher dispatcher = request.getRequestDispatcher("driver-signup.jsp");
                dispatcher.forward(request, response);
                return;
            }

            driverDAO.insertDriver(driver);

            RequestDispatcher dispatcher = request.getRequestDispatcher("driver-login.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("driver-signup.jsp?error=1");
        }
    }
}
