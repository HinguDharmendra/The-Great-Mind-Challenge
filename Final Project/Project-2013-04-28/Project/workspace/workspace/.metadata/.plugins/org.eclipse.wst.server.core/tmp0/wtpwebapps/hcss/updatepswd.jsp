
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.lang.String" %>
<%@page import="java.security.*"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ResultSet rs1=null;
    String passwordo = request.getParameter("password");
    String password = request.getParameter("npassword1");
   
    boolean flag = false;
    if(request.getParameter("submit")!=null)
    {
        String pswdu=session.getAttribute("pswd").toString();
        if(passwordo.equals(pswdu))
            {
            Connection con = null;
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
            Statement st = con.createStatement();
            String strQuery=null;
            MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
                mdAlgorithm.update(password.getBytes());
                byte[] digest = mdAlgorithm.digest();
                StringBuffer hexString = new StringBuffer();
                for (int i = 0; i < digest.length; i++)
                {
                    password = Integer.toHexString(0xFF & digest[i]);

                 if (password.length() < 2)
                      {
                        password = "0" + password;
                      }

                 hexString.append(password);
                }
                password = hexString.toString();
           PreparedStatement  stat=con.prepareStatement("update user set password='"+password+"' where email='"+session.getAttribute("Username")+"'");
                stat.executeUpdate();
                session.setAttribute("password", password);
                con.close();
                response.sendRedirect("welcome1.jsp#1");
            }
        else
            {
            response.sendRedirect("error.jsp");
        }
            
    }
    else
    {
        out.println("You need to submit your form");
    }
%>
