<%@ page import="java.sql.*" %>
<%
    String userID = request.getParameter("userID");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String address = request.getParameter("address");
    String NIC = request.getParameter("NIC");
    String phoneNumber = request.getParameter("phoneNumber");
    String email = request.getParameter("email");
    String licenseNumber = request.getParameter("licenseNumber");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
    String dbUser = "root";
    String dbPassword = "1234";
    Connection conn = null;
    PreparedStatement stmt = null;

    boolean usernameUpdated = false;
    boolean passwordUpdated = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql;
        if (password != null && !password.isEmpty()) {
            sql = "UPDATE users SET firstName=?, lastName=?, address=?, NIC=?, phoneNumber=?, email=?, licenseNumber=?, username=?, password=? WHERE userID=? AND userLevel=3";
            stmt = conn.prepareStatement(sql);
            stmt.setString(9, password);
            stmt.setString(10, userID);
            passwordUpdated = true;
        } else {
            sql = "UPDATE users SET firstName=?, lastName=?, address=?, NIC=?, phoneNumber=?, email=?, licenseNumber=?, username=? WHERE userID=? AND userLevel=3";
            stmt = conn.prepareStatement(sql);
            stmt.setString(9, userID);
        }

        stmt.setString(1, firstName);
        stmt.setString(2, lastName);
        stmt.setString(3, address);
        stmt.setString(4, NIC);
        stmt.setString(5, phoneNumber);
        stmt.setString(6, email);
        stmt.setString(7, licenseNumber);
        stmt.setString(8, username);
        
        if (!username.equals(session.getAttribute("username"))) {
            usernameUpdated = true;
        }

        stmt.executeUpdate();

        if (usernameUpdated || passwordUpdated) {
            session.invalidate();
            response.sendRedirect("driver-login.jsp?message=Changes successfully updated. Please log in again.");
        } else {
%>
        <script>
            alert("Profile updated successfully!");
            window.location.href = "driver-profile.jsp";
        </script>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("An error occurred while updating your profile. Please try again.");
            window.location.href = "driver-profile.jsp";
        </script>
<%
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
