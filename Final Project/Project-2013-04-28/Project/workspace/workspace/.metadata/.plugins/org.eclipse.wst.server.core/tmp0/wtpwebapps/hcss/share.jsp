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
    ResultSet rs1=null;
    String suser = request.getParameter("user");
    String suser1=suser.substring(0, suser.length()-2);

    String path = request.getParameter("path");

    if(request.getParameter("submit")!=null)
    {
        PreparedStatement psmnt = null;
        String owner=""+session.getAttribute("Username");
        //  out.println(users.length());
        
        try
        {
                Class.forName("com.ibm.db2.jcc.DB2Driver");
                Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
                psmnt = con.prepareStatement("insert into sfile (suser,ouser,location) values (?,?,?)");
                psmnt.setString(1,suser1);
                psmnt.setString(2,owner);
                //psmnt.setString(3,filename);
                psmnt.setString(3,path);
                int s = psmnt.executeUpdate();
                if(s>0){
                response.sendRedirect("welcome1.jsp#4");
                con.close();
                }
                else{
                out.println("Error!");
                con.close();
                }
        }
        catch(Exception e){
            e.printStackTrace();
        }
     

    }
    else
    {
        out.println("You need to submit your form");
    }
%>