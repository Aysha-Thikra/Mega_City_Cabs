package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Bean.Driver;

public class DriverDAO {
    private String jdbcUrl = "jdbc:mysql://127.0.0.1:3306/MegaCityCabs_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    private static final String INSERT_DRIVER_SQL = "INSERT INTO users (userID, firstName, lastName, address, NIC, phoneNumber, email, licenseNumber, username, password, userLevel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_LAST_USERID_SQL = "SELECT userID FROM users ORDER BY userID DESC LIMIT 1";
    private static final String CHECK_USERNAME_SQL = "SELECT COUNT(*) FROM users WHERE username = ?";
    private static final String CHECK_EMAIL_SQL = "SELECT COUNT(*) FROM users WHERE email = ?";
    private static final String CHECK_NIC_SQL = "SELECT COUNT(*) FROM users WHERE NIC = ?";
    private static final String CHECK_LICENSE_SQL = "SELECT COUNT(*) FROM users WHERE licenseNumber = ?";

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

    public String checkUniqueFields(Driver driver) throws SQLException {
        try (Connection connection = getConnection()) {

        	try (PreparedStatement checkUsername = connection.prepareStatement(CHECK_USERNAME_SQL)) {
                checkUsername.setString(1, driver.getUsername());
                try (ResultSet rs = checkUsername.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        return "Username already exists!";
                    }
                }
            }

            try (PreparedStatement checkEmail = connection.prepareStatement(CHECK_EMAIL_SQL)) {
                checkEmail.setString(1, driver.getEmail());
                try (ResultSet rs = checkEmail.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        return "Email already exists!";
                    }
                }
            }

            try (PreparedStatement checkNIC = connection.prepareStatement(CHECK_NIC_SQL)) {
                checkNIC.setString(1, driver.getNIC());
                try (ResultSet rs = checkNIC.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        return "NIC already exists!";
                    }
                }
            }

            try (PreparedStatement checkLicense = connection.prepareStatement(CHECK_LICENSE_SQL)) {
                checkLicense.setString(1, driver.getLicenseNumber());
                try (ResultSet rs = checkLicense.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        return "License number already exists!";
                    }
                }
            }
        }
        return null;
    }

    public void insertDriver(Driver driver) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DRIVER_SQL)) {

            preparedStatement.setString(1, driver.getUserID());
            preparedStatement.setString(2, driver.getFirstName());
            preparedStatement.setString(3, driver.getLastName());
            preparedStatement.setString(4, driver.getAddress());
            preparedStatement.setString(5, driver.getNIC());
            preparedStatement.setString(6, driver.getPhoneNumber());
            preparedStatement.setString(7, driver.getEmail());
            preparedStatement.setString(8, driver.getLicenseNumber());
            preparedStatement.setString(9, driver.getUsername());
            preparedStatement.setString(10, driver.getPassword());
            preparedStatement.setInt(11, driver.getUserLevel());

            preparedStatement.executeUpdate();
        }
    }
}
