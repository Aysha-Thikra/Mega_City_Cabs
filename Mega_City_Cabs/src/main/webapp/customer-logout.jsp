<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>  <!-- Ensure the session is enabled -->
<%
    // Invalidate the session to log out
    session.invalidate();
    response.sendRedirect("customer-login.jsp");  // Redirect to login page after logout
%>
