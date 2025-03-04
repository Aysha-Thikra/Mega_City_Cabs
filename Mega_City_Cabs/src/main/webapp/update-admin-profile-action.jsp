<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Admin Profile - Mega City Cabs</title>
</head>
<body>
    <%
        String userID = request.getParameter("userID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String NIC = request.getParameter("NIC");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;
        String message = "Error: Failed to update profile!";
        String statusClass = "error";

        if (userID == null || firstName == null || lastName == null || address == null || NIC == null || phoneNumber == null || email == null || username == null) {
            message = "All fields are required!";
        } else {
            try {
                String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
                String dbUser = "root";
                String dbPassword = "1234";
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUser, dbPassword);

                String sql = "UPDATE users SET firstName=?, lastName=?, address=?, NIC=?, phoneNumber=?, email=?, username=?";
                if (password != null && !password.trim().isEmpty()) {
                    sql += ", password=?";
                }
                sql += " WHERE userID=?";

                stmt = conn.prepareStatement(sql);
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, address);
                stmt.setString(4, NIC);
                stmt.setString(5, phoneNumber);
                stmt.setString(6, email);
                stmt.setString(7, username);

                if (password != null && !password.trim().isEmpty()) {
                    stmt.setString(8, password);
                    stmt.setString(9, userID);
                } else {
                    stmt.setString(8, userID);
                }

                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    message = "Profile updated successfully!";
                    statusClass = "success";
                } else {
                    message = "Failed to update profile. Please try again.";
                }
            } catch (Exception e) {
                e.printStackTrace();
                message = "Error: " + e.getMessage();
            } finally {
                if (stmt != null) try { stmt.close(); } catch (SQLException se) {}
                if (conn != null) try { conn.close(); } catch (SQLException se) {}
            }
        }
    %>

    <script type="text/javascript">
        <% if ("success".equals(statusClass)) { %>
            alert("<%= message %>");
        <% } else { %>
            alert("<%= message %>");
        <% } %>
        window.location.href = "admin-profile.jsp";
    </script>
</body>
</html>
