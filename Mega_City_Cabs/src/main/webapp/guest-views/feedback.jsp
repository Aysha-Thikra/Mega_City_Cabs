<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback - Mega City Cabs</title>
    <link rel="stylesheet" href="../CSS/feedback.css?v=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon">
</head>
<body>

    <!-- Menu Bar -->
    <header class="menu-bar">
        <div class="logo">
            <img src="../images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links">
            <a href="../home.jsp">Home</a>
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

    <!-- Feedback Form Section -->
    <div class="feedback-container">
        <div class="form-wrapper">
        <h2>We Value Your Feedback</h2>
        <p class="feedback-subtext">Help us improve by sharing your thoughts about our service.</p>
        
            <form action="submit-feedback-servlet" method="post" class="feedback-form">
                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="name" placeholder="Your Name" required>
                </div>
                <div class="form-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Your Email" required>
                </div>
                <div class="form-group">
                    <i class="fas fa-comment"></i>
                    <textarea name="message" placeholder="Your Feedback" rows="4" required></textarea>
                </div>

                <button type="submit" class="feedback-btn">Submit Feedback</button>
            </form>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="footer-container">
            <div class="footer-left">
                <p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
            </div>
            <div class="footer-right">
                <a href="../home.jsp"><i class="fas fa-home"></i> Home</a>
                <a href="about-us.jsp"><i class="fas fa-info-circle"></i> About Us</a>
                <a href="reviews.jsp"><i class="fas fa-comments"></i> Reviews</a>
                <a href="help.jsp"><i class="fas fa-question-circle"></i> Help</a>
                <a href="services.jsp"><i class="fas fa-wrench"></i> Services</a>
            </div>
        </div>
    </footer>

</body>
</html>
    