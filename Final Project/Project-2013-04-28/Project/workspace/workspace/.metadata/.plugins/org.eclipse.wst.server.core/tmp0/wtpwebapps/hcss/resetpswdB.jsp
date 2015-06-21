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
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ResultSet rs1=null;
    String email = request.getParameter("email");
    String password =request.getParameter("password");
    String contactNo = request.getParameter("mobile_no");
    String uid = request.getParameter("uid");
    String check=session.getAttribute("check").toString();

 boolean flag = false;
 boolean flag1 = false;
    int countmail=0;
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
            strQuery = "select u_id,mobile_no from user where email='"+email+"'";
            rs1 = st.executeQuery(strQuery);
          ResultSetMetaData rsmd1= rs1.getMetaData();
            int numberOfColumns1 = rsmd1.getColumnCount();
           while(rs1.next())
            {
                for(int i=1;i<=numberOfColumns1;i+=3)
                {
                    flag = check.equals(uid);
                     flag1 = rs1.getString(i+1).equals(contactNo);
                   }
            }
            
               
                if(flag)
                    {
                        if(flag1)
                        {
                            PreparedStatement  stat=con.prepareStatement("update user set password='"+hexString.toString()+"' where email='"+email+"'");
                            stat.executeUpdate();

                            con.close();
                            response.sendRedirect("index.jsp#3");
                        }
                        }
               
    }
    else
    {
        out.println("You need to submit your form");
    }
%>

