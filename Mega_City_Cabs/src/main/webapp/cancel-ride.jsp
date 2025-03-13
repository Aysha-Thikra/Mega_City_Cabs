<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Ride - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        body {
            background-color: #ff8400;
            font-family: Arial, sans-serif;
        }

        .confirmation-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }

        .confirmation-header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #4f200d;
        }

        .message {
            font-size: 18px;
            color: #dc3545;
            font-weight: bold;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            color: #fff;
            background-color: #dc3545;
            margin-top: 20px;
        }

        .btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <div class="confirmation-container">
        <%
            String bookingId = request.getParameter("bookingId");
            String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
            String dbUser = "root";
            String dbPassword = "1234";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUser, dbPassword);

                String updateQuery = "UPDATE booking SET status = 'Booking Cancelled' WHERE booking_id = ?";
                pstmt = conn.prepareStatement(updateQuery);
                pstmt.setString(1, bookingId);
                int result = pstmt.executeUpdate();

                if (result > 0) {
                    out.println("<div class='confirmation-header'>Ride Cancelled</div>");
                    out.println("<div class='message'>The ride has been successfully cancelled!</div>");
                } else {
                    out.println("<div class='confirmation-header'>Error</div>");
                    out.println("<div class='message'>Something went wrong. Please try again later.</div>");
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='confirmation-header'>Error</div>");
                out.println("<div class='message'>Something went wrong. Please try again later.</div>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
        <br><br><a href="ride-requests.jsp?userId=<%= session.getAttribute("userId") %>" class="btn">Back to Ride Requests</a>
    </div>
</body>
</html>
