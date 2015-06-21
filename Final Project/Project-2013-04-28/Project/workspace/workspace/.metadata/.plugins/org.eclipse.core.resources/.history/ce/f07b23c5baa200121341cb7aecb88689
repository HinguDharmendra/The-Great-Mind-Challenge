<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.security.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<%
 Connection con = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2ADMIN","mdh");
            PreparedStatement  stat=con.prepareStatement("insert into user (fname, mname, lname, email, gender, password, mobile_no, dob) values(?,?,?,?,?,?,?,?)");
            stat.setString(1, "HARNI");
            stat.setString(2, "g");
            stat.setString(3, "gevaria");
            stat.setString(4, "har@gmail.com");
            stat.setString(5,"2");
            stat.setString(6, "harni");
            stat.setString(7, "9876543210");
            stat.setString(8, "1992-1-2");
            stat.executeUpdate();
                con.close();
%>
</body>
</html>