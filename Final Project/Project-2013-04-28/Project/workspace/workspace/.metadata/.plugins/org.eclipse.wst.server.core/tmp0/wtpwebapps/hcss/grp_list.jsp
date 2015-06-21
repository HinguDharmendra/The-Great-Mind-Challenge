<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@include file="controller.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<form method="post" action="group.jsp">
    <table align="right">
        <tr>
            <td><input type="text" value="" name="guser" size="20"/></td>
            <td> </td>
            <td><input type="submit" name="submit" value="Search_User"/></td>
        </tr>
    </table>
</form>
<br/>
<%
Connection con21 = null;
Class.forName("com.ibm.db2.jcc.DB2Driver");
con21 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
Statement st21 = con21.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
boolean indicator=false;
ResultSet rs21 = st21.executeQuery("select * from group where requestee='"+session.getAttribute("Username")+"' and approve='y'");
ResultSetMetaData rsmd21 = rs21.getMetaData();
int numberOfColumns21 = rsmd21.getColumnCount();
%>
<br>
<h3 align="center"><p>Group_List</p></h3>
<%
if(rs21.next())
{
    indicator=true;
%>
<table cellspacing="25px" id="port" align="center">
<%
}
rs21.beforeFirst();
while(rs21.next())
{%><tr><%
    for(int i=1;i<=numberOfColumns21;i+=4)
    {%>
    <td><%out.println(rs21.getString(i).toString());%></td>
    <%}}
%></tr></table><%



Statement st22 = con21.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
ResultSet rs22 = st22.executeQuery("select * from group where requester='"+session.getAttribute("Username")+"' and approve='y'");
ResultSetMetaData rsmd22 = rs22.getMetaData();
int numberOfColumns22 = rsmd22.getColumnCount();
boolean indicator3=false;
if(rs22.next())
{
    indicator3=true;
%>
<table cellspacing="25px" id="port" align="center">
<%
}
rs22.beforeFirst();
while(rs22.next())
{%><tr><%
    for(int i=1;i<=numberOfColumns21;i+=4)
    {%>
    <td><%out.println(rs22.getString(i).toString());%></td>
    <%}
    }
%>
</tr></table>
<%

if(indicator==false && indicator3==false)
{%><center><%out.println("No Members in Groups.");%></center><%}
con21.close();
%>


