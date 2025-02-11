<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/contact-us.css?v=1.3">
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

    <!-- Contact Section -->
    <div class="contact-container">
        <h2>Get in Touch with Us</h2>
        <p>We are here to assist you! Reach out for inquiries, feedback, or support.</p>

        <div class="form-container">
            <!-- Left Side: Image -->
            <div class="form-left">
                <img src="images/contact.png" alt="Contact Us">
            </div>

            <div class="form-right">
                <h3>Send Us a Message</h3>
                <form action="contact-servlet" method="POST">
                    <div class="input-group">
                        <input type="text" name="name" required>
                        <label>Your Name</label>
                    </div>
                    <div class="input-group">
                        <input type="email" name="email" required>
                        <label>Your Email</label>
                    </div>
                    <div class="input-group">
                        <input type="text" name="subject" required>
                        <label>Subject</label>
                    </div>
                    <div class="input-group">
                        <textarea name="message" rows="5"required></textarea>
                        <label>Your Message</label>
                    </div>
                    <button type="submit" class="submit-btn">Send Message</button>
                </form>
            </div>
        </div>

        <!-- Contact Information Section -->
        <div class="contact-info">
            <h3>Contact Information</h3>
            <p><i class="fas fa-map-marker-alt"></i> No.12/A, Duplication Road, Colombo- 03, Sri Lanka</p>
            <p><i class="fas fa-phone-alt"></i> +94 11 767 7889</p>
            <p><i class="fas fa-envelope"></i> info@megacitycabs.com</p>
            <p><i class="fas fa-clock"></i> Mon - Sun: 24/7 Service</p>
            <div class="map-container">
                <iframe 
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31686.519805739803!2d79.8488!3d6.9271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25928945301e1%3A0x9a7b42f3c6160c5a!2sColombo%2C%20Sri%20Lanka!5e0!3m2!1sen!2sus!4v1638824394891!5m2!1sen!2sus" 
                    width="100%" height="200" style="border:0;" allowfullscreen="" loading="lazy">
                </iframe>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="footer-container">
            <div class="footer-left">
                <p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
            </div>
            <div class="footer-right">
                <a href="home.jsp" class="footer-link"><i class="fas fa-home"></i> Home</a>
                <a href="about-us.jsp" class="footer-link"><i class="fas fa-info-circle"></i> About Us</a> 
                <a href="reviews.jsp" class="footer-link"><i class="fas fa-comments"></i> Reviews</a>
                <a href="help.jsp" class="footer-link"><i class="fas fa-question-circle"></i> Help</a>
                <a href="services.jsp" class="footer-link"><i class="fas fa-wrench"></i> Services</a>
            </div>
        </div>
    </footer>

</body>
</html>
