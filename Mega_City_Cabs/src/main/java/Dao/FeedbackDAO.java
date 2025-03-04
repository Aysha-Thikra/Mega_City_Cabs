package Dao;

import java.sql.*;
import Bean.FeedbackBean;

public class FeedbackDAO {
    private Connection conn;

    public FeedbackDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean insertFeedback(FeedbackBean feedbackBean) {
        boolean isInserted = false;
        PreparedStatement pstmt = null;

        try {
            String sql = "INSERT INTO feedback (feedbackID, userID, feedback, username) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, feedbackBean.getFeedbackID());
            pstmt.setString(2, feedbackBean.getUserID());
            pstmt.setString(3, feedbackBean.getFeedback());
            pstmt.setString(4, feedbackBean.getUsername());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isInserted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isInserted;
    }
}
