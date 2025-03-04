<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reviews - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/reviews.css?v=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
</head>
<body>
    <header class="menu-bar">
        <div class="logo">
            <img src="images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links">
            <a href="home.jsp">Home</a>
            <a href="about-us.jsp">About Us</a>
            <a href="help.jsp">Help</a>
            <a href="services.jsp">Services</a>
            <a href="reviews.jsp">Reviews</a>
            <a href="contact-us.jsp">Contact Us</a>
        </nav>
        <div class="buttons">
            <button onclick="location.href='login.jsp';" class="login-btn">Login</button>
            <button onclick="location.href='signup.jsp';" class="signup-btn">Sign Up</button>
        </div>
    </header>

    <div class="review-container" style="margin-top: 5px; background-color: #ff8400;">
    <h2 style="color: #4f200d; font-size: 30px;">Customer Reviews</h2>
        <div class="review-box" style="background-color: #ffffff;">
            <div class="review-left">
                <p>We value your feedback! Leave a review about your experience with Mega City Cabs.</p>
                <button class="feedback-btn" onclick="location.href='customer-login.jsp';">Give Feedback</button>
            </div>
            <div class="review-right">
                <img src="images/feedback.png" alt="Customer Feedback" class="review-image">
            </div>
        </div>

        <br>
        <div class="reviews">
            <h3>What Our Customers Say</h3>
            <div class="review-grid">
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
                        
                        String query = "SELECT username, feedback FROM feedback";
                        pstmt = conn.prepareStatement(query);
                        rs = pstmt.executeQuery();
                        
                        while (rs.next()) {
                            String username = rs.getString("username");
                            String feedback = rs.getString("feedback");
                %>
                <div class="review-card">
                    <div class="reviewer-info">
                        <img src="images/reviewer.png" alt="<%= username %>">
                        <h4><%= username %></h4>
                    </div>
                    <p>"<%= feedback %>"</p>
                </div>
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
            </div>
        </div>
    </div>

    <footer>
        <div class="footer-container">
            <div class="footer-left">
                <p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
            </div>
            <div class="footer-right">
                <a href="home.jsp" class="footer-link"> <i class="fas fa-home"></i> Home </a>
                <a href="about-us.jsp" class="footer-link"> <i class="fas fa-info-circle"></i> About Us </a>
                <a href="contact-us.jsp" class="footer-link"> <i class="fas fa-phone-alt"></i> Contact Us </a>
                <a href="help.jsp" class="footer-link"> <i class="fas fa-question-circle"></i> Help </a>
                <a href="services.jsp" class="footer-link"> <i class="fas fa-wrench"></i> Services </a>
            </div>
        </div>
    </footer>
</body>
</html>
