# #️⃣ Mega City Cabs

![Mega City Cabs](https://github.com/user-attachments/assets/2b5dfb3b-a679-46b0-87fc-053a81b34592)


## 🚖 Overview
Mega City Cabs is a web-based dynamic platform designed to facilitate efficient and seamless ride booking, driver management, and customer services. The system allows customers to book rides, manage booking activities, and provide feedback. It also enables drivers to manage assigned trips and ride requests, while administrators oversee bookings, users, and vehicles.

The application follows a **3-tier architecture** and integrates the **Singleton pattern** for database connections, ensuring high performance and scalability. The backend is developed using **Java (JSP & Servlets)** and the **Eclipse IDE**, while **MySQL** is used for database management.

---

## 🎯 Features
### **👤 Customer Features**
- 📝 User Registration & Login
- 🚖 Book a Ride
- 📆 Manage Bookings
- 📜 View Ride History
- ⭐ Provide Feedback
- 🧾 Print Booking E-Bill
- ✏️ Edit Profile
- 🔓 Logout

### **🚗 Driver Features**
- 📝 User Registration & Login
- 📋 View Assigned Rides
- 🔄 Manage Ride Requests
- ✏️ Edit Profile
- 🔓 Logout

### **🛠 Admin Features**
- 📝 User Registration & Login
- 👥 Manage Admins, Customers & Drivers
- 🆕 Register New Drivers
- 🆕 Register New Admins
- 📋 Manage Bookings
- 🧾 Print Booking E-Bill
- 🚘 Manage Cars
- ⭐ Manage Feedback
- 📧 Manage Inquiries
- 🆕 Register New Admin Accounts
- ✏️ Edit Profile
- 🔓 Logout

---

## 🏗 System Architecture
The system follows a **3-tier architecture**:
1. **Presentation Layer (Frontend):** Handles the UI and user interactions using:
   - 🎨 HTML, CSS, Bootstrap (for responsive UI design)
   - 🖥 JavaScript (for client-side interactivity)

2. **Business Logic Layer (Backend):** Manages core functionality like ride booking, authentication, and database operations using:
   - ☕ Java (Servlets & JSP)
   - 🖥 Eclipse IDE (for Java development)
   - 🌐 Apache Tomcat (for web application deployment)

3. **Data Access Layer (Database):** Stores and retrieves data using:
   - 🗄 MySQL Workbench (for database management)
   - ⚡ Singleton Pattern (for optimized database connection management)

---

## 🛠 Tech Stack
| Component        | Technology |
|-----------------|------------|
| **Frontend**    | HTML, CSS, Bootstrap, JavaScript |
| **Backend**     | Java (JSP, Servlets) |
| **Database**    | MySQL |
| **Development IDE** | Eclipse IDE |
| **Web Server**  | Apache Tomcat |
| **Architecture** | 3-Tier MVC |
| **Design Pattern** | Singleton (Database Connection) |

---

## ⚙ Installation & Setup
### **📌 Requirement**
Ensure you have the following installed on your system:
- ☕ **Java Development Kit (JDK 8 or later)**
- 🖥 **Eclipse IDE (or any Java-supported IDE)**
- 🌐 **Apache Tomcat (9.x or later)**
- 🗄 **MySQL Workbench & MySQL Server**
- 🛠 **Git (for version control)**

### **Step 1: Clone the Repository**
```sh
 git clone https://github.com/Aysha-Thikra/Mega_City_Cabs.git
 cd Mega_City_Cabs
```

### **Step 2: Set Up the Database**
1. Open MySQL Workbench and create a new database:
   ```sql
   CREATE DATABASE MegaCityCabs_db;
   ```
2. Import the database schema from `Mega City Cabs Database.sql`.
3. Update database credentials inside the Java code:
   ```properties
   db.url="jdbc:mysql://localhost:3306/MegaCityCabs_db"
   db.user="username"
   db.password="password"
   ```

### **Step 3: Configure & Deploy in Eclipse**
1. Open Eclipse IDE and import the project (`File` → `Import` → `Existing Projects into Workspace`).
2. Configure **Tomcat Server**:
   - `Window` → `Preferences` → `Server` → `Runtime Environments` → `Add` → Select **Apache Tomcat 9**
3. Run the project (`Run` → `Run on Server`).

### **Step 4: Access the Application**

---

## 🗄 Database Schema
### **📌 Tables Overview**
| Table Name    | Description |
|--------------|-------------|
| `users`      | Stores user details (Admins, Customers, Drivers) based on `user_level` |
| `bookings`   | Stores ride bookings and statuses |
| `cars`       | Stores car details and availability |
| `feedbacks`  | Stores customer feedback |
| `contact`    | Stores user inquiries and support requests |

---

## 🔒 Security Measures
- 🔑 **Session Management**: Ensures user authentication before accessing sensitive data.
- 🔐 **Password Hashing**: Secure storage of user passwords.
- 🛡 **SQL Injection Prevention**: Uses prepared statements to avoid SQL injection attacks.
- 🎭 **Role-Based Access Control (RBAC)**: Ensures different users (Admin, Driver, Customer) have appropriate access permissions.

---

## 🚀 Future Enhancements
- 💳 **Integration with Payment Gateway (PayPal, Stripe, etc.)**
- 🗺 **Real-time Ride Tracking using Google Maps API**
- 📩 **SMS & Email Notifications for Booking Confirmations**
- 🤖 **AI-based Fare Prediction & Ride Suggestions**

---

## 🏆 Author
This project is fully developed by **Aysha Thikra**.
