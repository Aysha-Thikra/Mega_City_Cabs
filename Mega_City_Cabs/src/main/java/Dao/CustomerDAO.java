package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Bean.Customer;

public class CustomerDAO {
    private String jdbcUrl = "jdbc:mysql://127.0.0.1:3306/MegaCityCabs_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO users (userID, firstName, lastName, address, NIC, phoneNumber, email, username, password, userLevel, licenseNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_LAST_USERID_SQL = "SELECT userID FROM users ORDER BY userID DESC LIMIT 1";
    private static final String CHECK_USERNAME_SQL = "SELECT COUNT(*) FROM users WHERE username = ?";
    private static final String CHECK_EMAIL_SQL = "SELECT COUNT(*) FROM users WHERE email = ?";
    private static final String CHECK_NIC_SQL = "SELECT COUNT(*) FROM users WHERE NIC = ?";

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found!");
        }
    }

    public String generateNextUserID() throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_LAST_USERID_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            if (resultSet.next()) {
                String lastUserID = resultSet.getString("userID");
                int userIdNumber = Integer.parseInt(lastUserID.substring(1)) + 1;
                return String.format("U%05d", userIdNumber);
            } else {
                return "U00001";
            }
        }
    }

    public String checkUniqueFields(Customer customer) throws SQLException {
        try (Connection connection = getConnection()) {
        	
            try (PreparedStatement checkUsername = connection.prepareStatement(CHECK_USERNAME_SQL)) {
                checkUsername.setString(1, customer.getUsername());
                try (ResultSet rs = checkUsername.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        return "Username already exists!";
                    }
                }
            }

            try (PreparedStatement checkEmail = connection.prepareStatement(CHECK_EMAIL_SQL)) {
                checkEmail.setString(1, customer.getEmail());
                try (ResultSet rs = checkEmail.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        return "Email already exists!";
                    }
                }
            }

            try (PreparedStatement checkNIC = connection.prepareStatement(CHECK_NIC_SQL)) {
                checkNIC.setString(1, customer.getNIC());
                try (ResultSet rs = checkNIC.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        return "NIC already exists!";
                    }
                }
            }
        }
        return null;
    }

    public String insertCustomer(Customer customer) throws SQLException {
        String uniqueCheck = checkUniqueFields(customer);
        if (uniqueCheck != null) {
            return uniqueCheck;
        }

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {

            preparedStatement.setString(1, customer.getUserID());
            preparedStatement.setString(2, customer.getFirstName());
            preparedStatement.setString(3, customer.getLastName());
            preparedStatement.setString(4, customer.getAddress());
            preparedStatement.setString(5, customer.getNIC());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getUsername());
            preparedStatement.setString(9, customer.getPassword());
            preparedStatement.setInt(10, customer.getUserLevel());
            preparedStatement.setString(11, "Not needed");

            preparedStatement.executeUpdate();
            return "success";
        }
    }
}
