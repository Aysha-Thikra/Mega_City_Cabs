<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        :root {
            --yellow: #ffd110;
            --orange: #ff8400;
            --brown: #4f200d;
        }

        .dashboard-container {
            max-width: 1000px;
            margin: 100px auto;
            padding: 30px;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }

        .dashboard-header {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            color: var(--brown);
        }

        .form-input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .form-container {
            text-align: left;
        }

        .form-container button {
            padding: 10px 20px;
            background-color: var(--orange);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            margin-top: 20px;
            width: 100%;
        }

        .form-container button:hover {
            background-color: #e87e00;
        }

        .cancel-btn {
            background-color: #dc3545;
            color: white;
            border-radius: 8px;
            padding: 10px 20px;
            cursor: pointer;
            font-weight: 600;
            margin-top: 10px;
            width: 100%;
            text-decoration:none;
        }

        .cancel-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body style="background-color: #ff8400;">
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

    <div class="dashboard-container">
        <div class="dashboard-header">Edit Customer</div>

        <%
            String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
            String dbUser = "root";
            String dbPassword = "1234";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String userID = request.getParameter("userID");
            String firstName = "", lastName = "", email = "", phone = "", address = "", NIC = "", username = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUser, dbPassword);
                
                String sql = "SELECT firstName, lastName, email, phoneNumber, address, NIC, username FROM users WHERE userID = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userID);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    firstName = rs.getString("firstName");
                    lastName = rs.getString("lastName");
                    email = rs.getString("email");
                    phone = rs.getString("phoneNumber");
                    address = rs.getString("address");
                    NIC = rs.getString("NIC");
                    username = rs.getString("username");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>

        <div class="form-container">
            <form action="update-customer.jsp" method="post">
                <input type="hidden" name="userID" value="<%= userID %>">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" class="form-input" value="<%= firstName %>" required>

                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" class="form-input" value="<%= lastName %>" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" class="form-input" value="<%= email %>" required>

                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" class="form-input" value="<%= phone %>" required>

                <label for="address">Address</label>
                <input type="text" id="address" name="address" class="form-input" value="<%= address %>" required>

                <label for="NIC">NIC</label>
                <input type="text" id="NIC" name="NIC" class="form-input" value="<%= NIC %>" required>

                <label for="username">Username</label>
                <input type="text" id="username" name="username" class="form-input" value="<%= username %>" required>

                <button type="submit">Update Customer</button>
                <a href="manage-customers.jsp"><button type="button" class="cancel-btn">Cancel</button></a>
            </form>
        </div>
    </div>
</body>
</html>
