<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Admins - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        :root {
            --yellow: #ffd110;
            --orange: #ff8400;
            --brown: #4f200d;
            --border-radius: 10px;
            --btn-padding: 12px 24px;
            --font-weight: 600;
            --transition: 0.3s ease;
        }

        body {
            background-color: #ff8400;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 80px auto;
            padding: 30px;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 30px;
        }

        .dashboard-header {
            font-size: 32px;
            font-weight: var(--font-weight);
            margin-bottom: 30px;
            color: var(--brown);
        }

        .admin-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .admin-table th, .admin-table td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .admin-table th {
            background-color: var(--orange);
            color: var(--brown);
            text-align: center;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            max-width: 900px;
            margin: 20px auto;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 120px;
        }

        .form-container a {
            display: inline-block;
            padding: var(--btn-padding);
            background-color: var(--orange);
            color: white;
            font-weight: var(--font-weight);
            text-decoration: none;
            border-radius: var(--border-radius);
            text-align: center;
            width: 200px;
            transition: background-color var(--transition), transform var(--transition);
        }

        .form-container a:hover {
            background-color: #e87e00;
            transform: translateY(-2px);
        }

        .form-container a:active {
            transform: translateY(1px);
        }

        .edit-btn, .delete-btn {
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .edit-btn {
            background-color: #28a745;
            color: white;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .edit-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .delete-btn:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

        .edit-btn:active, .delete-btn:active {
            transform: scale(0.98);
        }

        .edit-btn i, .delete-btn i {
            font-size: 16px;
        }

    </style>
</head>
<body>

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

    <div class="form-container">
        <p>To register new admins click the add new admin button below and register them &#x1F447; </p>
        <a href="admin-signup.jsp">Register New Admin</a>
    </div>

    <div class="dashboard-container">
        <div class="dashboard-header">Manage Admins</div>

        <table class="admin-table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>NIC</th>
                    <th>Username</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
                    String dbUser = "root";
                    String dbPassword = "1234";
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(url, dbUser, dbPassword);
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery("SELECT userID, firstName, lastName, email, phoneNumber, NIC, username FROM users WHERE userLevel = 1"); // Assuming admin users have userLevel 1

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("userID") %></td>
                    <td><%= rs.getString("firstName") %></td>
                    <td><%= rs.getString("lastName") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("phoneNumber") %></td>
                    <td><%= rs.getString("NIC") %></td>
                    <td><%= rs.getString("username") %></td>
                    <td style="text-align: center;">
                        <a href="update-admin.jsp?userID=<%= rs.getString("userID") %>" class="edit-btn">
                            <i class="fas fa-edit"></i>
                        </a>
                        <a href="delete-admin.jsp?userID=<%= rs.getString("userID") %>" class="delete-btn" onclick="return confirm('Are you sure you want to delete this admin?');">
                            <i class="fas fa-trash-alt"></i>
                        </a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                        if (conn != null) try { conn.close(); } catch (SQLException e) {}
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
