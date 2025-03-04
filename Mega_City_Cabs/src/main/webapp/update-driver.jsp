<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Driver - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        body {
            background-color: #ff8400;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        .update-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .update-container h2 {
            color: #4f200d;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
        }

        button {
            padding: 12px;
            background-color: #ff8400;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        button:hover {
            background-color: #e87e00;
        }

        .cancel-btn {
            background-color: #dc3545;
        }

        .cancel-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <!-- Add your Navbar here -->
    <header class="menu-bar">
        <div class="logo">
            <img src="images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links">
            <a href="admin-dashboard.jsp">Dashboard</a>
            <a href="manage-customers.jsp">Manage Customers</a>
            <a href="manage-bookings.jsp">Manage Bookings</a>
            <a href="manage-cars.jsp">Manage Cars</a>
            <a href="manage-drivers.jsp">Manage Drivers</a>
            <a href="manage-feedbacks.jsp">Manage Feedbacks</a>
        </nav>
        <div class="buttons">
            <button onclick="location.href='admin-logout.jsp';" class="logout-btn">Logout</button>
        </div>
    </header>

    <div class="update-container">
        <h2>Update Driver Details</h2>

        <%
            String userID = request.getParameter("userID");
            String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
            String dbUser = "root";
            String dbPassword = "1234";
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            String firstName = "", lastName = "", address = "", NIC = "", phoneNumber = "", email = "", licenseNumber = "", username = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUser, dbPassword);
                
                String sql = "SELECT userID, firstName, lastName, address, NIC, phoneNumber, email, licenseNumber, username FROM users WHERE userID=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, userID);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    firstName = rs.getString("firstName");
                    lastName = rs.getString("lastName");
                    address = rs.getString("address");
                    NIC = rs.getString("NIC");
                    phoneNumber = rs.getString("phoneNumber");
                    email = rs.getString("email");
                    licenseNumber = rs.getString("licenseNumber");
                    username = rs.getString("username");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>

        <form action="update-driver-action.jsp" method="POST">
            <input type="hidden" name="userID" value="<%= userID %>">
            <input type="text" name="firstName" value="<%= firstName %>" required>
            <input type="text" name="lastName" value="<%= lastName %>" required>
            <input type="text" name="address" value="<%= address %>" required>
            <input type="text" name="NIC" value="<%= NIC %>" required>
            <input type="text" name="phoneNumber" value="<%= phoneNumber %>" required>
            <input type="email" name="email" value="<%= email %>" required>
            <input type="text" name="licenseNumber" value="<%= licenseNumber %>" required>
            <input type="text" name="username" value="<%= username %>" required>
            <button type="submit">Update</button>
            <a href="manage-drivers.jsp"><button type="button" class="cancel-btn">Cancel</button></a>
        </form>
    </div>

</body>
</html>
