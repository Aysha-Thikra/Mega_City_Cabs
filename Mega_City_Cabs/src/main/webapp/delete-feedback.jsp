<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String feedbackID = request.getParameter("feedbackID");

    String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
    String dbUser = "root";
    String dbPassword = "1234";
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);
        
        String sql = "DELETE FROM feedback WHERE feedbackID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, feedbackID);

        int result = pstmt.executeUpdate();
        if (result > 0) {
            response.sendRedirect("manage-feedbacks.jsp");
        } else {
            out.println("<script>alert('Failed to delete feedback.'); window.location='manage-feedbacks.jsp';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error occurred while deleting feedback.'); window.location='manage-feedbacks.jsp';</script>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
