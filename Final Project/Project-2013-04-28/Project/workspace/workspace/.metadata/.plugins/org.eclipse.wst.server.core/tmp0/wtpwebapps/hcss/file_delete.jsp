<%@include file="controller.jsp" %>
    <%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.PreparedStatement" %>
    <%@page import="java.sql.ResultSet"%>
    <%@page language="java" import="java.sql.*"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

        <table id="port" cellspacing="25px" align="center">
                    <form method ="post" action="delete_file.jsp">
                        <th>Select</th><th>File_Name</th><th>User</th>
        <% 
            try
                {
                   Class.forName("com.ibm.db2.jcc.DB2Driver");
                  Connection con2 = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
                    Statement stmt2=con2.createStatement();
                    ResultSet reset2 = stmt2.executeQuery("Select * from FILE");
                    while(reset2.next())
                    {
            %>
               
                       <tr>
                         <td>
                            <input type="radio" name="file" value="<%out.print(reset2.getString(3));%>"/>
                         </td>
                         <td>
                             <%
                              out.println(reset2.getString(3));
                             %>
                          </td>
                         <td>
                             <%
                              out.println(reset2.getString(4));
                             %>
                          </td>
                          
                             <%
                    }
                }
                             catch(Exception E)
                                    {
                                        out.print("Connection Error");
                                        out.print(E.getMessage());
                                    }
           
                             %></tr>
                       <tr align="center">
                           <td align="center" colspan="3">
                              <input type="submit" name="submit" value="Delete" />

                           </td>
                       </tr>
                    </form>
         </table>
