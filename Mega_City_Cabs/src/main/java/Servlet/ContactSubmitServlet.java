package Servlet;

import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/contact-submit")
public class ContactSubmitServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
        String dbUser = "root";
        String dbPassword = "1234";
        Connection conn = null;
        PreparedStatement stmt = null;
        String contactID = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPassword);
            
            contactID = generateContactID(conn);

            String sql = "INSERT INTO contact (contactID, name, email, subject, message) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, contactID);
            stmt.setString(2, name);
            stmt.setString(3, email);
            stmt.setString(4, subject);
            stmt.setString(5, message);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                out.println("<script>alert('Message sent successfully!'); window.location.href='contact-us.jsp';</script>");
            } else {
                out.println("<script>alert('Message not sent. Please try again.'); window.location.href='contact-us.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href='contact-us.jsp';</script>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            out.close();
        }
    }

    private String generateContactID(Connection conn) throws SQLException {
        String latestID = null;
        String newID = "MSG000001";

        String sql = "SELECT contactID FROM contact ORDER BY contactID DESC LIMIT 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                latestID = rs.getString("contactID");
                int num = Integer.parseInt(latestID.substring(3)) + 1;
                newID = String.format("MSG%06d", num);
            }
        }
        return newID;
    }
}
