<%@include file="controller.jsp"%>
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
            String c=request.getParameter("file");
            //out.println(c);
            Connection con3 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con3 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st3 = con3.createStatement();
            

            st3.executeUpdate("DELETE FROM FILE WHERE FILENAME = '"+c+"'");

            out.println("successfully deleted the file");
                        //response.sendRedirect("admin.jsp");
            con3.close();
            }
        else{
        out.println("You need to submit form first");}
        response.sendRedirect("admin_welcome.jsp#4");
         %>
