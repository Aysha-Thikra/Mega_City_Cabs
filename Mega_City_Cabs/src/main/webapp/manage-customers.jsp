<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Customers - Mega City Cabs</title>
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
            margin-top: 120px;
            text-align: center;
        }

        .dashboard-header {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            color: var(--brown);
        }

        .customers-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .customers-table th, .customers-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        .customers-table th {
            background-color: var(--orange);
            color: var(--brown);
            text-align: center;
        }

        .customers-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .edit-btn{
        	margin-bottom: 10px;
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
        <div class="dashboard-header">Manage Customers</div>

        <table class="customers-table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
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
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(url, dbUser, dbPassword);
                        
                        String sql = "SELECT userID, firstName, lastName, email, phoneNumber, address, NIC, username FROM users WHERE userLevel = 2";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            String userID = rs.getString("userID");
                            String firstName = rs.getString("firstName");
                            String lastName = rs.getString("lastName");
                            String email = rs.getString("email");
                            String phone = rs.getString("phoneNumber");
                            String address = rs.getString("address");
                            String NIC = rs.getString("NIC");
                            String username = rs.getString("username");
                %>
                <tr>
                    <td><%= userID %></td>
                    <td><%= firstName %> <%= lastName %></td>
                    <td><%= email %></td>
                    <td><%= phone %></td>
                    <td><%= address %></td>
                    <td><%= NIC %></td>
                    <td><%= username %></td>
                    <td style="text-align: center;">
					    <a href="edit-customer.jsp?userID=<%= userID %>" class="edit-btn">
					        <i class="fas fa-edit"></i> 
					    </a>
					    <a href="delete-customer.jsp?userID=<%= userID %>" class="delete-btn" onclick="return confirm('Are you sure you want to delete this customer?');">
					        <i class="fas fa-trash-alt"></i> 
					    </a>
					</td>

                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
