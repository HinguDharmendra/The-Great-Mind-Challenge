<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

        <%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>

<%
    String name = request.getParameter("author");
    String email = request.getParameter("email");
    String message =request.getParameter("text");
    if(request.getParameter("submit")!=null)
    {
            Connection con = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

                PreparedStatement  stat=con.prepareStatement("insert into contact_us (name, email, message) values(?,?,?)");
                stat.setString(1, name);
                stat.setString(2, email);
                stat.setString(3, message);
                stat.executeUpdate();

                con.close();

                response.sendRedirect("index.jsp");
            }
    
    
%>
