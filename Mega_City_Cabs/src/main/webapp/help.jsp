<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/help.css?v=1.0">
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

    <!-- Heading Section -->
    <div class="assist-heading">
        <div class="assist-image-container">
            <img src="images/car + hoodi guy.png" alt="Car and Hoodie Guy" class="assist-image">
        </div>
        <div class="assist-text">
            <h2>How Can We Assist You?</h2>
            <p>Find answers to common questions and learn more about Mega City Cabs.</p>
        </div>
    </div>


    <!-- FAQ Section Heading -->
    <div class="faq-heading">
        <h2>Frequently Asked Questions</h2>
        <p>Here are some of the most common questions asked by our customers. If you need further assistance, feel free to reach out.</p>
    </div>

    <!-- FAQ Section -->
    <div class="faq-section">
        <div class="faq-container">
            <div class="faq-row">
                <div class="faq-card">
                    <i class="fas fa-taxi"></i>
                    <h3>How do I book a cab?</h3>
                    <p>Bookings can be made exclusively through our website. Simply navigate to the booking page, enter your details, and confirm your ride.</p>
                </div>
                <div class="faq-card">
                    <i class="fas fa-clock"></i>
                    <h3>Can I schedule a ride in advance?</h3>
                    <p>Yes! You can schedule a ride in advance by selecting the preferred date and time on our website.</p>
                </div>
            </div>
            <div class="faq-row">
                <div class="faq-card">
                    <i class="fas fa-credit-card"></i>
                    <h3>What payment methods are accepted?</h3>
                    <p>We accept credit/debit cards, digital wallets, and cash payments upon arrival.</p>
                </div>
                <div class="faq-card">
                    <i class="fas fa-exclamation-circle"></i>
                    <h3>What should I do if I have an issue with my ride?</h3>
                    <p>If you experience any issues, please contact our support team using the details provided on the contact card below.</p>
                </div>
            </div>
            <div class="faq-row">
                <div class="faq-card">
                    <i class="fas fa-map-marked-alt"></i>
                    <h3>Where does Mega City Cabs operate?</h3>
                    <p>We operate across major cities, ensuring convenient travel solutions for all your transportation needs.</p>
                </div>
                <div class="faq-card">
                    <i class="fas fa-question-circle"></i>
                    <h3>How can I contact customer support?</h3>
                    <p>You can reach our customer support via email at info@megacitycabs.com or call us at 011-7677889.</p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Book Now Section -->
    <div class="book-now-section">
        <div class="book-now-text">
            <h2>Ready to Ride?</h2>
            <p>Book your cab easily through our website. Just fill in the details, and your ride will be on its way!</p>
            <button onclick="location.href='customer-login.jsp';" class="book-now-btn">Book A Ride &nbsp;<i class="fa-solid fa-car-side"></i></i></button>
        </div>
        <div class="book-now-image">
            <img src="images/car + hoodi guy 2.png" alt="Book Now" class="book-now-img">
        </div>
    </div>

    <!-- Contact Card Section -->
    <div class="contact-card">
        <h2>Need Further Assistance?</h2>
        <p>If you have more questions or need help, reach out to our customer support team!</p>
        <img src="images/contact card.png" alt="Contact Image" class="contact-image">
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="footer-container">
            <div class="footer-left">
                <p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
            </div>
            <div class="footer-right">
                <a href="home.jsp" class="footer-link">
                    <i class="fas fa-info-circle"></i> Home
                </a>
                <a href="reviews.jsp" class="footer-link">
                    <i class="fas fa-comments"></i> Reviews
                </a>
                <a href="contact-us.jsp" class="footer-link">
                    <i class="fas fa-phone-alt"></i> Contact Us
                </a>
                <a href="about-us.jsp" class="footer-link">
                    <i class="fas fa-info-circle"></i> About Us
                </a>
                <a href="services.jsp" class="footer-link">
                    <i class="fas fa-wrench"></i> Services
                </a>
            </div>
        </div>
    </footer>
</body>
</html>