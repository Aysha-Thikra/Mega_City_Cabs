<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Feedbacks - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        :root {
            --yellow: #ffd110;
            --orange: #ff8400;
            --brown: #4f200d;
            --border-radius: 10px;
            --btn-padding: 10px 20px;
            --font-weight: 600;
            --transition: 0.3s ease;
        }

        body {
            background-color: #ff8400;
            font-family: 'Arial', sans-serif;
        }

        .dashboard-container {
            max-width: 1000px;
            margin: 100px auto;
            padding: 30px;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: var(--border-radius);
            text-align: center;
            margin-top: 130px;
        }

        .dashboard-header {
            font-size: 28px;
            font-weight: var(--font-weight);
            margin-bottom: 20px;
            color: var(--brown);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: justify;
        }

        th {
            background-color: var(--orange);
            color: var(--brown);
            font-weight: var(--font-weight);
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .delete-btn {
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
		
		.delete-btn {
		    background-color: #dc3545;
		    color: white;
		}
		
		.delete-btn:hover {
		    background-color: #c82333;
		    transform: scale(1.05);
		}

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: var(--btn-padding);
            background-color: var(--orange);
            color: white;
            font-weight: var(--font-weight);
            text-decoration: none;
            border-radius: var(--border-radius);
            transition: background-color var(--transition);
        }

        .back-btn:hover {
            background-color: #e87e00;
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
        <div class="dashboard-header">Manage Feedbacks</div>

        <table>
            <tr>
                <th>Feedback ID</th>
                <th>Username</th>
                <th>Feedback</th>
                <th>Action</th>
            </tr>

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
                    
                    String query = "SELECT feedbackID, username, feedback FROM feedback";
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        String feedbackID = rs.getString("feedbackID");
                        String username = rs.getString("username");
                        String feedbackText = rs.getString("feedback");
            %>
                        <tr>
                            <td><%= feedbackID %></td>
                            <td><%= username %></td>
                            <td><%= feedbackText %></td>
                            <td>
                                <form action="delete-feedback.jsp" method="post" style="text-align: center;">
                                    <input type="hidden" name="feedbackID" value="<%= feedbackID %>">
                                    <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this customer feedback?');"><i class="fas fa-trash-alt"></i> </button>
                                </form>
                            </td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            %>
        </table>

    </div>
</body>
</html>
