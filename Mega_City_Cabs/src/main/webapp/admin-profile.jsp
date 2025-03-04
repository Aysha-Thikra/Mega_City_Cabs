<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css?v=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #ff8400;
        }
        .profile-container {
            text-align: center;
            padding: 60px 20px;
            margin: auto;
            width: 90%;
            max-width: 900px;
            margin-top: 50px;
        }
        .form-wrapper {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .profile-form {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }
        .profile-form .form-group {
            display: flex;
            align-items: center;
            background: #a0a0a0;
            border-radius: 8px;
            padding: 12px;
        }
        .profile-form .form-group i {
            color: #555;
            margin-right: 10px;
            font-size: 16px;
        }
        .profile-form .form-group input {
            border: none;
            background: transparent;
            outline: none;
            flex: 1;
            font-size: 16px;
            padding: 5px;
        }
        .update-btn {
            background: linear-gradient(135deg, #ff8400, #ffd110);
            color: white;
            border: none;
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            transition: background 0.3s ease-in-out;
            grid-column: 1 / 3;
        }
        .update-btn:hover {
            background: linear-gradient(135deg, #ffd110, #ff8400);
        }
        @media (max-width: 600px) {
            .profile-form {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <header class="menu-bar">
        <div class="logo" style="margin-left: 30px;">
            <img src="images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links" style="margin-right: -60px;">
            <a href="admin-dashboard.jsp">Dashboard</a>
            <a href="manage-customers.jsp">Manage Customers</a>
            <a href="manage-bookings.jsp">Manage Bookings</a>
            <a href="manage-cars.jsp">Manage Cars</a>
            <a href="manage-drivers.jsp">Manage Drivers</a>
            <a href="manage-feedbacks.jsp">Manage Feedbacks</a>
        </nav>
        <div class="buttons" style="margin-right: 10px; margin-left: 30px;">
            <button onclick="location.href='admin-logout.jsp';" class="logout-btn">Logout</button>
        </div>
    </header>

    <div class="profile-container">
        <div class="form-wrapper">
            <h2 style="color: #4f200d; font-weight: bold;">Admin Profile</h2>
            <%
                String sessionUsername = (String) session.getAttribute("admin_username");
                if (sessionUsername == null || sessionUsername.trim().isEmpty()) {
                    response.sendRedirect("admin-login.jsp");
                    return;
                }
                
                String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
                String dbUser = "root";
                String dbPassword = "1234";
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                String userID = "", firstName = "", lastName = "", address = "", NIC = "", phoneNumber = "", email = "", username = "";
                
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);
                    
                    String sql = "SELECT userID, firstName, lastName, address, NIC, phoneNumber, email, username FROM users WHERE username=? AND userLevel=1";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, sessionUsername);
                    rs = stmt.executeQuery();
                    
                    if (rs.next()) {
                        userID = rs.getString("userID");
                        firstName = rs.getString("firstName");
                        lastName = rs.getString("lastName");
                        address = rs.getString("address");
                        NIC = rs.getString("NIC");
                        phoneNumber = rs.getString("phoneNumber");
                        email = rs.getString("email");
                        username = rs.getString("username");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
            <form action="update-admin-profile-action.jsp" method="POST" class="profile-form">
                <input type="hidden" name="userID" value="<%= userID %>">
                <div class="form-group"><i class="fas fa-user"></i><input type="text" name="firstName" value="<%= firstName %>" required></div>
                <div class="form-group"><i class="fas fa-user"></i><input type="text" name="lastName" value="<%= lastName %>" required></div>
                <div class="form-group"><i class="fas fa-map-marker-alt"></i><input type="text" name="address" value="<%= address %>" required></div>
                <div class="form-group"><i class="fas fa-id-card"></i><input type="text" name="NIC" value="<%= NIC %>" required></div>
                <div class="form-group"><i class="fas fa-phone"></i><input type="text" name="phoneNumber" value="<%= phoneNumber %>" required></div>
                <div class="form-group"><i class="fas fa-envelope"></i><input type="email" name="email" value="<%= email %>" required></div>
                <div class="form-group"><i class="fas fa-user-circle"></i><input type="text" name="username" value="<%= username %>" required></div>
                <div class="form-group"><i class="fas fa-lock"></i><input type="password" name="password" placeholder="Leave it blank to keep current password"></div>
                <button type="submit" class="update-btn">Update Profile</button>
            </form>
        </div>
    </div>
</body>
</html>
