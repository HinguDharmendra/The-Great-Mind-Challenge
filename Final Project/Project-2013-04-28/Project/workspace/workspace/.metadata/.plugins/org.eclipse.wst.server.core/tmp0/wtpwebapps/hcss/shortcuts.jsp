<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="controller.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


        <font color="white">
<%
    String usershort=""+session.getAttribute("Username");

Connection con6 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con6 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st6 = con6.createStatement();

ResultSet rs6 = st6.executeQuery("select * from shortcuts where users='"+usershort+"'");
ResultSetMetaData rsmd6 = rs6.getMetaData();
int numberOfColumns6 = rsmd6.getColumnCount();%>
<table id="port" cellspacing="25px" align="center">
    <caption><h3>Get the instant access to your personal data.</h3></caption>
    <tr>
    <th align="center">Logged in Email</th>
    <th align="center">Passport Number</th>
    <th align="center">PAN card Number</th>
    <th align="center">ATM PIN Number</th>
    <th align="center">Driving License Number</th>
    <th align="center">Aadhar Card Number</th>
    <th align="center">Bank Account Number</th>
</tr>
<tr>

<%
while(rs6.next())
{
    for(int i=1;i<=numberOfColumns6;i++)
    {
        %>
        
            <td align="center"><%out.println(rs6.getString(i));%></td>
        
        <%
    }
}
        %></tr></table>
<%
con6.close();
%>
<table align="center">
        <tr align="center">
            <td align="center"><a href="insertdata.jsp#2"><font color="white"><h3>Change Content</h3></font></a></td>
            <td></td><td></td><td></td>
            <td align="center"><a href="insertdata.jsp#1"><font color="white"><h3>Add Content</h3></font></a></td>
        </tr>
</table>
        </font>

