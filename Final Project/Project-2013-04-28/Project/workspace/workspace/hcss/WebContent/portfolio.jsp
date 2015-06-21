<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="controller.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%

Connection con = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select fname,mname,lname,email,dob,mobile_no,gender from user where email='"+session.getAttribute("Username")+"'");
ResultSetMetaData rsmd = rs.getMetaData();
int numberOfColumns = rsmd.getColumnCount();
%><h3>
    User Profile
</h3>
<br/><br/>
<table id="port" cellspacing="25px" align="center">
    <tr>
        <th>First_Name</th>
        <th>Middle_Name</th>
        <th>Last_Name</th>
        <th>Email</th>
        <th>Date_of_Birth</th>
        <th>Phone_No</th>
        <th>Gender</th>

</tr>
    <tr>
<%
while(rs.next())
{
for(int i=1;i<=numberOfColumns;i++)
{
    if(rs.getString(i).equals("1"))
        {
%><td align="center"><%out.println("Male");%></td><%
            //out.println("\n"+"Male"+"\n");

        }
    else if(rs.getString(i).equals("2"))
        {
%><td align="center"><%out.println("Female");%></td><%
            //out.println("\n"+"Female"+"\n");
        }
    else
        {
        %>
<td align="center"><% out.println(rs.getString(i)); %>
</td>
<%
        }
        //out.println("\n"+rs.getString(i)+ "\n");
}
}
%>
</tr>
</table>

<table align="center">
    <tr>
        <td>
            <a href="changepswd.jsp"><font color="white"><h3>Change Password</h3></font></a>
        </td>
        <td></td><td></td><td></td>
        <td>
            <a href="updateprofile.jsp"><font color="white"><h3>Update Profile</h3></font></a>
        </td>
    </tr>
</table>

<%
con.close();%>