package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerLoginDAO {
    private String jdbcUrl = "jdbc:mysql://127.0.0.1:3306/MegaCityCabs_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    private static final String CHECK_CUSTOMER_SQL = "SELECT password FROM users WHERE username = ? AND userLevel = 2";

    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found!");
        }
    }

    public String validateCustomerLogin(String username, String password) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_CUSTOMER_SQL)) {

            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String storedPassword = resultSet.getString("password");
                    if (storedPassword.equals(password)) {
                        return "success";
                    } else {
                        return "Incorrect password!";
                    }
                } else {
                    return "Username not found!";
                }
            }
        }
    }
}
