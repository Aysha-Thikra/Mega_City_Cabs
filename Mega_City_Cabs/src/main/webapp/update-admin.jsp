<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Admin - Mega City Cabs</title>
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

        .logout-btn {
            background-color: var(--orange);
            color: white;
            padding: var(--btn-padding);
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-weight: var(--font-weight);
        }

        .dashboard-container {
            max-width: 800px;
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
            align-items: flex-start;
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

        input, button {
            padding: 10px;
            margin: 10px 0;
            width: 100%;
            border-radius: var(--border-radius);
            border: 1px solid #ddd;
            font-size: 16px;
        }

        .form-container form input[type="submit"] {
            background-color: var(--orange);
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-container form input[type="submit"]:hover {
            background-color: #e87e00;
        }

        label {
            width: 100%;
            margin-bottom: 5px;
            font-size: 16px;
            font-weight: var(--font-weight);
            color: var(--brown);
            margin-left: 50px;
        }

        input {
            width: calc(100% - 20px);
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
            <%
                String userID = request.getParameter("userID");
                String firstName = "";
                String lastName = "";
                String email = "";
                String phone = "";
                String NIC = "";
                String username = "";

                String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
                String dbUser = "root";
                String dbPassword = "1234";
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);
                    String sql = "SELECT firstName, lastName, email, phoneNumber, NIC, username FROM users WHERE userID = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, userID);
                    rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        firstName = rs.getString("firstName");
                        lastName = rs.getString("lastName");
                        email = rs.getString("email");
                        phone = rs.getString("phoneNumber");
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
            Update Admin Details
        </div>

        <div class="form-container">
            <form action="update-admin.jsp" method="post">
                <input type="hidden" name="userID" value="<%= userID %>">

                <!-- Label for First Name -->
                <label for="firstName">First Name :</label>
                <input type="text" id="firstName" name="firstName" value="<%= firstName %>" required placeholder="First Name">
                
                <!-- Label for Last Name -->
                <label for="lastName">Last Name :</label>
                <input type="text" id="lastName" name="lastName" value="<%= lastName %>" required placeholder="Last Name">
                
                <!-- Label for Email -->
                <label for="email">Email :</label>
                <input type="email" id="email" name="email" value="<%= email %>" required placeholder="Email">
                
                <!-- Label for Phone Number -->
                <label for="phone">Phone Number :</label>
                <input type="text" id="phone" name="phone" value="<%= phone %>" required placeholder="Phone Number">
                
                <!-- Label for NIC -->
                <label for="NIC">NIC :</label>
                <input type="text" id="NIC" name="NIC" value="<%= NIC %>" required placeholder="NIC">
                
                <!-- Label for Username -->
                <label for="username">Username :</label>
                <input type="text" id="username" name="username" value="<%= username %>" required placeholder="Username">
                
                <input type="submit" value="Update Admin">
            </form>

            <%
                String message = "";
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    String newFirstName = request.getParameter("firstName");
                    String newLastName = request.getParameter("lastName");
                    String newEmail = request.getParameter("email");
                    String newPhone = request.getParameter("phone");
                    String newNIC = request.getParameter("NIC");
                    String newUsername = request.getParameter("username");

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(url, dbUser, dbPassword);
                        String sql = "UPDATE users SET firstName = ?, lastName = ?, email = ?, phoneNumber = ?, NIC = ?, username = ? WHERE userID = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, newFirstName);
                        pstmt.setString(2, newLastName);
                        pstmt.setString(3, newEmail);
                        pstmt.setString(4, newPhone);
                        pstmt.setString(5, newNIC);
                        pstmt.setString(6, newUsername);
                        pstmt.setString(7, userID);
                        int result = pstmt.executeUpdate();
                        
                        if (result > 0) {
                            message = "Admin details updated successfully!";
                        } else {
                            message = "Failed to update admin details.";
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        message = "An error occurred while updating admin details.";
                    } finally {
                        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                        if (conn != null) try { conn.close(); } catch (SQLException e) {}
                    }
                }
            %>
            <script>
			    <% if (!message.isEmpty()) { %>
			        alert("<%= message %>");
			        window.location.href = 'manage-admins.jsp';
			    <% } %>
			</script>


            <a href="manage-admins.jsp" class="cancel-btn">Cancel</a>
        </div>
    </div>
</body>
</html>
