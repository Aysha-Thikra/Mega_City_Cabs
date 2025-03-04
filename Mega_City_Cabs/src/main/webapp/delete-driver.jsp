<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Driver - Mega City Cabs</title>
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
            max-width: 1000px;
            margin: 80px auto;
            padding: 30px;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 150px;
        }

        .dashboard-header {
            font-size: 32px;
            font-weight: var(--font-weight);
            margin-bottom: 30px;
            color: var(--brown);
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }

        .form-container p {
            font-size: 18px;
            color: #333;
            margin-bottom: 20px;
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
            width: 100%;
            transition: background-color var(--transition), transform var(--transition);
        }

        .form-container a:hover {
            background-color: #e87e00;
            transform: translateY(-2px);
        }

        .form-container a:active {
            transform: translateY(1px);
        }

        .cancel-btn {
            background-color: #dc3545;
        }

        .cancel-btn:hover {
            background-color: #c82333;
        }

        .cancel-btn:active {
            transform: translateY(1px);
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

    <div class="dashboard-container">
        <div class="dashboard-header">
            Delete Driver
        </div>

        <%
            String driverID = request.getParameter("userID");
            String message = "";

            String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
            String dbUser = "root";
            String dbPassword = "1234";
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                if (driverID != null && !driverID.isEmpty()) {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    String sql = "DELETE FROM users WHERE userID = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, driverID);

                    int result = pstmt.executeUpdate();
                    if (result > 0) {
                        message = "Driver deleted successfully!";
                    } else {
                        message = "Failed to delete driver.";
                    }
                } else {
                    message = "No driver ID provided.";
                }

            } catch (Exception e) {
                e.printStackTrace();
                message = "An error occurred while deleting the driver.";
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>

        <div class="form-container">
            <p><%= message %></p>
            <a href="manage-drivers.jsp" class="cancel-btn">Back to Manage Drivers</a>
        </div>
    </div>
</body>
</html>
