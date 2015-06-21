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
    if(request.getParameter("submit")!=null)
    {
    String type = request.getParameter("category");
    java.io.File f = new File("C:/Data/"+session.getAttribute("Username")+"/"+type+"/");
    if(!f.exists())
        f.mkdir();

    if(type.equals("documents"))
        response.sendRedirect("welcome2.jsp#1");
    else if(type.equals("images"))
        response.sendRedirect("welcome2.jsp#2");
    else if(type.equals("audio"))
        response.sendRedirect("welcome2.jsp#3");
    else if(type.equals("videos"))
        response.sendRedirect("welcome2.jsp#4");
    }
    else
    {
        out.println("You need to submit your form");
    }
%>
