
<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
<%
try
{
    Class.forName("com.ibm.db2.jcc.DB2Driver");
    Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
    out.println("Done");
 }
catch(Exception E)
{
    out.print("Connection Error");
    out.print(E.getMessage());
}

%>
    </body>
</html>
