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
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String userx=""+session.getAttribute("Username");
ResultSet rs1=null;
String psprt = request.getParameter("psprt");
String pannum = request.getParameter("pannum");
String pinnum = request.getParameter("pinnum");
String dlic = request.getParameter("dlic");
String adno = request.getParameter("adno");
String bno = request.getParameter("bno");


if(request.getParameter("submit")!=null)
{
    Connection con = null;
    Class.forName("com.ibm.db2.jcc.DB2Driver");
    con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
    int count=0;
    Statement st = con.createStatement();
    String strQuery=null;

    strQuery = "select * from shortcuts where users='"+userx+"'";
    rs1 = st.executeQuery(strQuery);
    while(rs1.next())
    {
        count++;
    }
    if(count>0)
    {
        out.println("Data is already present, if you want to make changes. Switch to change content tab");
        con.close();
    }
    else
    {
        PreparedStatement  stat=con.prepareStatement("insert into shortcuts (users, psprt, pannum, pinnum, dlic, adno, bno) values(?,?,?,?,?,?,?)");
        stat.setString(1,""+session.getAttribute("Username"));
        stat.setString(2, psprt);
        stat.setString(3, pannum);
        stat.setString(4, pinnum);
        stat.setString(5, dlic);
        stat.setString(6, adno);
        stat.setString(7, bno);
        stat.executeUpdate();

        con.close();
        response.sendRedirect("welcome1.jsp#3");
    }
}
else
{
    out.println("You need to submit your form");
}
%>
