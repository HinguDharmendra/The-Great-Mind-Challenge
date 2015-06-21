<%@include file="controller.jsp" %>
    
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
       "http://www.w3.org/TR/html4/loose.dtd">
    <%@page import="java.sql.*" %>
    <%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.Connection" %>
    <%@page import="java.lang.String" %>
    <%@page import="java.sql.PreparedStatement" %>
    <%@page import="java.sql.ResultSet"%>
    <%@page language="java" import="java.sql.*;"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>

    
            
            <%
            if(request.getParameter("submit")!=null)
                {
            String s=request.getParameter("name");
            //out.println(s);
           //String s="admin";
            %>
            <%

            Connection con4 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con4 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st4 = con4.createStatement();
            ResultSet rs4 = st4.executeQuery("select fname,mname,lname,email,dob,mobile_no,gender from user where email='"+s+"'");
            ResultSetMetaData rsmd = rs4.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
        %>
        <h3>
    User Profile
        </h3>
<br/><br/>
<%
while(rs4.next())
{
for(int i=1;i<=numberOfColumns;i++)
{
    if(rs4.getString(i).equals("1"))
        {
%><ul type="disc"><li><%out.println("Male");%></li><br/></ul><%
            //out.println("\n"+"Male"+"\n");

        }
    else if(rs4.getString(i).equals("2"))
        {
%><ul type="disc"><li><%out.println("Female");%></li><br/></ul><%
            //out.println("\n"+"Female"+"\n");
        }
    else
        {
        %>
<ul type="disc">
    <li><% out.println(rs4.getString(i)); %></li><br/>
</ul>
<%
        }
        //out.println("\n"+rs.getString(i)+ "\n");
}
}
%>
<a href="delete_user.jsp">delete user</a>
<%}
            else
                {
            out.println("You need to submit the form first");}%>
 
           