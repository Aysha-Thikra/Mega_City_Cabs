<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Dao.FeedbackDAO, Bean.FeedbackBean"%>

<%
    String userId = (String) session.getAttribute("userId");

    if (userId == null) {
        out.println("Error: User ID is missing.");
    } else {
        String dbURL = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
        String dbUsername = "root";
        String dbPassword = "1234";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
            
            String sql = "SELECT firstName, lastName, email FROM users WHERE userID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            String firstName = "";
            String lastName = "";
            String email = "";

            if (rs.next()) {
                firstName = rs.getString("firstName");
                lastName = rs.getString("lastName");
                email = rs.getString("email");
                session.setAttribute("firstName", firstName);
                session.setAttribute("lastName", lastName);
                session.setAttribute("email", email);
            } else {
                out.println("Error: User not found.");
            }

            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String feedbackMessage = request.getParameter("message");

                if (feedbackMessage != null && !feedbackMessage.isEmpty()) {
                    String feedbackID = generateFeedbackID(conn);

                    FeedbackBean feedbackBean = new FeedbackBean();
                    feedbackBean.setFeedbackID(feedbackID);
                    feedbackBean.setUserID(userId);
                    feedbackBean.setFeedback(feedbackMessage);
                    feedbackBean.setUsername(firstName + " " + lastName);

                    String insertSQL = "INSERT INTO feedback (feedbackID, userID, feedback, username) VALUES (?, ?, ?, ?)";
                    pstmt = conn.prepareStatement(insertSQL);
                    pstmt.setString(1, feedbackBean.getFeedbackID());
                    pstmt.setString(2, feedbackBean.getUserID());
                    pstmt.setString(3, feedbackBean.getFeedback());
                    pstmt.setString(4, feedbackBean.getUsername());

                    int rowsAffected = pstmt.executeUpdate();
                    if (rowsAffected > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Feedback added successfully!');");
                        out.println("</script>");
                    } else {
                        out.println("Error: Unable to save feedback.");
                    }
                } else {
                    out.println("Feedback message is empty.");
                }
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<%! 
    private String generateFeedbackID(Connection conn) {
        String feedbackID = "F0001";
        try {
            String query = "SELECT MAX(CAST(SUBSTRING(feedbackID, 2) AS UNSIGNED)) FROM feedback";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int maxID = rs.getInt(1);
                feedbackID = String.format("F%04d", maxID + 1);
            }
            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackID;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/feedback.css?v=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
</head>
<body>

    <!-- Menu Bar -->
    <header class="menu-bar">
        <div class="logo">
            <img src="images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links">
            <a href="customer-dashboard.jsp">Dashboard</a>
            <a href="booking.jsp?userId=<%= userId %>">Book a Ride</a>
            <a href="booking-history.jsp?userId=<%= userId %>">Booking History</a>
            <a href="booking-activity.jsp?userId=<%= userId %>">Booking Activity</a>
            <a href="feedback.jsp?userId=<%= userId %>">Give Feedbacks</a>
            <a href="profile.jsp">Profile</a>
        </nav>
        <div class="buttons">
            <button onclick="location.href='customer-logout.jsp';" class="logout-btn">Logout</button>
        </div>
    </header>

    <!-- Feedback Form Section -->
    <div class="feedback-container">
        <div class="form-wrapper">
        <h2>We Value Your Feedback</h2>
        <p class="feedback-subtext">Help us improve by sharing your thoughts about our service.</p>
        
            <form action="feedback.jsp" method="post" class="feedback-form">
                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="name" value="<%= session.getAttribute("firstName") + " " + session.getAttribute("lastName") %>" readonly>
                </div>
                <div class="form-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" value="<%= session.getAttribute("email") %>" readonly>
                </div>
                <div class="form-group">
                    <i class="fas fa-comment"></i>
                    <textarea name="message" placeholder="Your Feedback" rows="4" required></textarea>
                </div>

                <button type="submit" class="feedback-btn">Submit Feedback</button>
            </form>
        </div>
    </div>

</body>
</html>
