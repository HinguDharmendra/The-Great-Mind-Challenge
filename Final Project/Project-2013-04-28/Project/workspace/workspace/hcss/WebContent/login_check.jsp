<%@page import="java.util.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.security.*"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" import="java.sql.*"%>
 <%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String pswd=password;
    ResultSet rs;
     if(request.getParameter("Submit")!=null)
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
                for (int i = 0; i < digest.length; i++) {
                    password = Integer.toHexString(0xFF & digest[i]);

                if (password.length() < 2) {
                   password = "0" + password;
                 }

                 hexString.append(password);
                 }
        
        strQuery = "select count(*) from user where email='"+username+"' and password='"+hexString.toString()+"'";
        rs = st.executeQuery(strQuery);
        while(rs.next())
        {
             
              if(rs.getInt(1) > 0)
            {
                session.setAttribute("Username", username);
                session.setAttribute("Password", password);
                session.setAttribute("pswd", pswd);
                if(username.equals("admin"))
                    {
                response.sendRedirect("admin_welcome.jsp");
                     }
                else
                {
                response.sendRedirect("welcome1.jsp");
                }
             }
            else
            {
                out.println("Invalid Username or Password");
                  response.sendRedirect("error.jsp");
            }
        }
       }
else
{
out.println("you need to submit your form");
}
     
%>