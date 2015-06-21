<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
ResultSet rs1=null;
String psprt = request.getParameter("psprt");
String pannum = request.getParameter("pannum");
String pinnum = request.getParameter("pinnum");
String dlic = request.getParameter("dlic");
String adno = request.getParameter("adno");
String bno = request.getParameter("bno");
//out.println(bno);

if(request.getParameter("submit")!=null)
{
    Connection con = null;
    Class.forName("com.ibm.db2.jcc.DB2Driver");
    con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
    
    Statement st = con.createStatement();
    String strQuery=null;

    strQuery = "select * from shortcuts where users='"+session.getAttribute("Usename")+"'";
    rs1 = st.executeQuery(strQuery);

        PreparedStatement  stat=con.prepareStatement("update shortcuts set users='"+session.getAttribute("Username")+"', psprt='"+psprt+"', pannum='"+pannum+"', pinnum='"+pinnum+"', dlic='"+dlic+"', adno='"+adno+"', bno='"+bno+"'");
        stat.executeUpdate();

        con.close();
        response.sendRedirect("welcome1.jsp#3");

}
else
{
    out.println("You need to submit your form");
}
%>
