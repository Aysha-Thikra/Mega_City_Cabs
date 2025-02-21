<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        /* Root Color Variables */
        :root {
            --yellow: #ffd110;
            --orange: #ff8400;
            --brown: #4f200d;
            --black-transparent: rgba(0, 0, 0, 0.5);
        }

        .payment-container {
            max-width: 600px;
            margin: 80px auto 0;
            padding: 25px;
            background: #fff;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            text-align: center;
            margin-top: 120px;
        }

        .payment-container h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: var(--brown);
            font-weight: 600;
        }

        .payment-fields {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 15px;
            text-align: left;
            font-size: 16px;
            margin-bottom: 25px;
            padding: 15px 20px;
            background: #f9f9f9;
            border-radius: 8px;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
        }

        .payment-fields input {
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-top: 5px;
            width: 100%;
        }

        .payment-fields p {
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
            font-size: 15px;
            color: #444;
            display: flex;
            align-items: center;
        }

        .payment-fields p:last-child {
            border-bottom: none;
        }

        .payment-fields i {
            margin-right: 10px;
            color: var(--orange);
        }

        .payment-fields strong {
            margin-right: 10px;
            font-weight: 600;
        }

        .back-btn, .confirm-btn, .cancel-btn {
            background: linear-gradient(135deg, var(--yellow), var(--orange));
            color: white;
            padding: 14px 18px;
            border: none;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }

        .back-btn {
            background: linear-gradient(135deg, #ffc107, #e0a800);
        }

        .cancel-btn {
            background: linear-gradient(135deg, #ff4c4c, #e02424);
        }

        .back-btn:hover {
            background: linear-gradient(135deg, #e0a800, #c69500);
            transform: translateY(-2px);
        }

        .confirm-btn:hover {
            background: linear-gradient(135deg, #e0a800, #c69500);
            transform: translateY(-2px);
        }

        .cancel-btn:hover {
            background: linear-gradient(135deg, #e02424, #c21f1f);
            transform: translateY(-2px);
        }

        @media (max-width: 600px) {
            .payment-container {
                width: 90%;
                margin: 40px auto;
            }
        }
    </style>

    <script>
        function formatCardNumber(event) {
            var cardNumber = event.target.value.replace(/\D/g, '');
            if (cardNumber.length <= 16) {
                cardNumber = cardNumber.replace(/(\d{4})(?=\d)/g, '$1-');
            }
            event.target.value = cardNumber;
        }

        function validateCardNumber() {
            var cardNumber = document.getElementById("cardNumber").value.replace(/\D/g, '');
            var regex = /^[0-9]{16}$/;
            if (!regex.test(cardNumber)) {
                alert("Please enter a valid card number with 16 digits.");
                return false;
            }
            return true;
        }

        function validateCVV() {
            var cvv = document.getElementById("cvv").value;
            var regex = /^[0-9]{3}$/;
            if (!regex.test(cvv)) {
                alert("Please enter a valid CVV with 3 digits.");
                return false;
            }
            return true;
        }

        function validateExpiryDate() {
            var expiryDate = document.getElementById("expiryDate").value;
            var regex = /^(0[1-9]|1[0-2])\/\d{2}$/;
            if (!regex.test(expiryDate)) {
                alert("Please enter a valid expiry date in MM/YY format.");
                return false;
            }
            return true;
        }

        function validateCardholderName() {
            var cardholderName = document.getElementById("cardholderName").value;
            var regex = /^[A-Za-z\s]+$/;
            if (!regex.test(cardholderName)) {
                alert("Please enter a valid cardholder name (letters and spaces only).");
                return false;
            }
            return true;
        }

        function validateForm() {
            return validateCardNumber() && validateCVV() && validateExpiryDate() && validateCardholderName();
        }

        function formatExpiryDate(event) {
            var expiryDate = event.target.value.replace(/\D/g, '');
            if (expiryDate.length > 2) {
                expiryDate = expiryDate.substring(0, 2) + '/' + expiryDate.substring(2, 4);
            }
            event.target.value = expiryDate;
        }
    </script>
</head>

<body style="background-color: #ff8400;">

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

    <!-- Payment Form -->
    <div class="payment-container">
        <h2>Enter Payment Details</h2>
        <form action="payment-success.jsp" method="post" onsubmit="return validateForm()">
            <div class="payment-fields">
                <div class="field-item">
                    <p><i class="fas fa-credit-card"></i><strong>Card Number:</strong><input type="text" id="cardNumber" name="cardNumber" maxlength="19" oninput="formatCardNumber(event)" required></p>
                    <p><i class="fas fa-calendar-alt"></i><strong>Expiry Date:</strong><input type="text" id="expiryDate" name="expiryDate" maxlength="5" oninput="formatExpiryDate(event)" required></p>
                    <p><i class="fas fa-lock"></i><strong>CVV:</strong><input type="text" id="cvv" name="cvv" maxlength="3" required></p>
                </div>
                <div class="field-item">
                    <p><i class="fas fa-user"></i><strong>Cardholder Name:</strong><input type="text" id="cardholderName" name="cardholderName" required></p>
                    <p><i class="fas fa-money-bill-wave"></i><strong>Total Amount (LKR):</strong><input type="text" name="totalAmount" value="<%= request.getParameter("fare") %>" disabled></p>
                </div>
            </div>
            
            <button class="confirm-btn" type="submit">Confirm Payment</button>
            <button class="back-btn" onclick="window.history.back()">Go Back</button>
            <button class="cancel-btn" onclick="location.href='home.jsp';">Cancel Ride</button>
        </form>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="footer-container">
            <div class="footer-left">
                <p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
            </div>
            <div class="footer-right">
                <a href="about-us.jsp" class="footer-link"><i class="fas fa-info-circle"></i> About Us </a>
                <a href="reviews.jsp" class="footer-link"><i class="fas fa-comments"></i> Reviews </a>
                <a href="contact-us.jsp" class="footer-link"><i class="fas fa-phone-alt"></i> Contact Us </a>
                <a href="help.jsp" class="footer-link"><i class="fas fa-question-circle"></i> Help </a>
                <a href="services.jsp" class="footer-link"><i class="fas fa-wrench"></i> Services </a>
            </div>
        </div>
    </footer>

</body>
</html>