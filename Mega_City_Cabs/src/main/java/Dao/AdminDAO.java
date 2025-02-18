package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Bean.Admin;

public class AdminDAO {
    private String jdbcUrl = "jdbc:mysql://127.0.0.1:3306/MegaCityCabs_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    private static final String INSERT_ADMIN_SQL = "INSERT INTO users (userID, firstName, lastName, address, NIC, phoneNumber, email, licenseNumber, username, password, userLevel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_LAST_USERID_SQL = "SELECT userID FROM users ORDER BY userID DESC LIMIT 1";

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

    public void insertAdmin(Admin admin) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADMIN_SQL)) {

            preparedStatement.setString(1, admin.getUserID());
            preparedStatement.setString(2, admin.getFirstName());
            preparedStatement.setString(3, admin.getLastName());
            preparedStatement.setString(4, admin.getAddress());
            preparedStatement.setString(5, admin.getNIC());
            preparedStatement.setString(6, admin.getPhoneNumber());
            preparedStatement.setString(7, admin.getEmail());
            preparedStatement.setString(8, admin.getLicenseNumber());
            preparedStatement.setString(9, admin.getUsername());
            preparedStatement.setString(10, admin.getPassword());
            preparedStatement.setInt(11, admin.getUserLevel());

            preparedStatement.executeUpdate();
        }
    }
}
