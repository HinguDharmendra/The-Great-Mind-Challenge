
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.security.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html" %>

<%
    String firstname = request.getParameter("fname");
    String middlename = request.getParameter("mname");
    String lastname = request.getParameter("lname");
    //String email = request.getParameter("email");
    //String password =request.getParameter("password");
    String contactNo = request.getParameter("mobile_no");
    //String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    if(request.getParameter("submit")!=null)
    {
            Connection con = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

                PreparedStatement  stat=con.prepareStatement("update user set fname='"+firstname+"', mname='"+middlename+"', lname='"+lastname+"', mobile_no='"+contactNo+"', dob='"+dob+"' where email='"+session.getAttribute("Username")+"'");
                stat.executeUpdate();

                con.close();
                response.sendRedirect("welcome1.jsp");
    }
    else
    {
        out.println("You need to submit your form");
    }
%>

