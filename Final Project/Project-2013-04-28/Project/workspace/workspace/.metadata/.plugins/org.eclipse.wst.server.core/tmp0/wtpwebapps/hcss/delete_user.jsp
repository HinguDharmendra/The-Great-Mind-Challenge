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
            String b=request.getParameter("name");
           out.println(b);
            Connection con1 = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con1= DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");

            Statement st1 = con1.createStatement();

            st1.executeUpdate("DELETE FROM USER WHERE EMAIL = '"+b+"'");
            
            out.println("successfully deleted the user");
                        //response.sendRedirect("admin.jsp");
con1.close();
}
        else{
        out.println("You need to submit the form first");}
        response.sendRedirect("admin_welcome.jsp#2");
         %>

