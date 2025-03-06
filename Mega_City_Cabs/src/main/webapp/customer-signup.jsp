<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Signup - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/signup.css?v=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ff8400;
        }

        .signup-container {
            text-align: center;
            padding: 100px 20px;
            margin: auto;
            width: 90%;
            max-width: 900px;
            margin-bottom: -80px;
            margin-top: 20px;
        }

        .signup-subtext {
            font-size: 16px;
            color: #666;
            margin-bottom: 20px;
        }

        .form-wrapper {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .signup-form {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }

        .signup-form .form-group {
            display: flex;
            align-items: center;
            background: #a0a0a0;
            border-radius: 8px;
            padding: 12px;
        }

        .signup-form .form-group i {
            color: #555;
            margin-right: 10px;
            font-size: 16px;
        }

        .signup-form .form-group input {
            border: none;
            background: transparent;
            outline: none;
            flex: 1;
            font-size: 16px;
            padding: 5px;
        }

        .signup-btn {
            background: linear-gradient(135deg, #ff8400, #ffd110);
            color: white;
            border: none;
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            transition: background 0.3s ease-in-out;
            grid-column: 1 / 4;
        }

        .signup-btn:hover {
            background: linear-gradient(135deg, #ffd110, #ff8400);
        }

        /* Already Have an Account */
        .login-link {
            margin-top: 15px;
            font-size: 16px;
            color: #555;
        }

        .login-link a {
            color: #ff8400;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 800px) {
            .signup-form {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 600px) {
            .signup-container {
                width: 100%;
            }

            .signup-form {
                grid-template-columns: 1fr;
            }
        }

    </style>
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
            <button onclick="location.href='signup.jsp';" class="signup-btn-2">Sign Up</button>
        </div>
    </header>
    
    <!-- Error Message Popup -->
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <script>
            alert("<%= errorMessage.replace("\"", "\\\"") %>");
        </script>
    <%
        }
    %>
    
    <!-- Customer Signup Form -->
    <div class="signup-container">
        <div class="form-wrapper">
            <h2>Customer Signup</h2>
            <p class="signup-subtext">Create your account to access Mega City Cabs services.</p>

            <form action="customer-signup" method="post" class="signup-form">

                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="first_name" placeholder="First Name" required>
                </div>
                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="last_name" placeholder="Last Name" required>
                </div>
                <div class="form-group">
                    <i class="fas fa-phone"></i>
                    <input type="tel" id="phone" name="phone" placeholder="Phone Number" required maxlength="12" pattern="\d{3}-\d{7}" title="Phone number must be in the format xxx-xxxxxxx">
                </div>
                <div class="form-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Email Address" required>
                </div>
                <div class="form-group">
                    <i class="fas fa-map-marker-alt"></i>
                    <input type="text" name="address" placeholder="Address" required>
                </div>
                <div class="form-group">
				    <i class="fas fa-id-card"></i>
				    <input type="text" name="nic" placeholder="NIC Number" required
				        pattern="^\d{9}[Vv]$|^\d{12}$" 
				        title="NIC should be either 9 digits followed by 'V' or 'v' (123456789V) or 12 digits (200012345678).">
				</div>
                <div class="form-group">
                    <i class="fas fa-user-circle"></i>
                    <input type="text" name="username" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Password must be at least 6 characters, contain at least one number, one lowercase and one uppercase letter.">
                </div>
                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="confirm_password" placeholder="Confirm Password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Password must be at least 6 characters, contain at least one number, one lowercase and one uppercase letter.">
                </div>
                <button type="submit" class="signup-btn">Sign Up</button>
            </form>

            <p class="login-link">Already have an account? <a href="customer-login.jsp">Login</a></p>
        </div>
    </div>
    
    <!-- Footer Section -->
    <footer>
        <div class="footer-container">
            <div class="footer-left">
                <p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
            </div>
            <div class="footer-right">
                <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
                <a href="about-us.jsp"><i class="fas fa-info-circle"></i> About Us</a>
                <a href="reviews.jsp"><i class="fas fa-comments"></i> Reviews</a>
                <a href="help.jsp"><i class="fas fa-question-circle"></i> Help</a>
                <a href="services.jsp"><i class="fas fa-wrench"></i> Services</a>
            </div>
        </div>
    </footer>
</body>
</html>