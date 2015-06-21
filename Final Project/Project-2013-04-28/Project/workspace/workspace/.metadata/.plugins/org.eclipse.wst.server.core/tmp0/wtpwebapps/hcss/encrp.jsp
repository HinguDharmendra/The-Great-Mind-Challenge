<%-- 
    Document   : encrp
    Created on : 30 Mar, 2013, 11:11:51 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.File"%>
<%@page import="java.security.*"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%
String plainText = "123456";
MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(plainText.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
    plainText = Integer.toHexString(0xFF & digest[i]);

    if (plainText.length() < 2) {
        plainText = "0" + plainText;
    }

    hexString.append(plainText);
}

out.print(hexString.toString());
%>

