<%@include file="controller.jsp" %>

    <%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.Connection" %>
    <%@page import="java.sql.PreparedStatement" %>
    <%@page import="java.sql.ResultSet"%>
    <%@page language="java" import="java.sql.*"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>


        <table id="port" cellspacing="25px" align="center">
            
             <tr><th>Select</th><th>User</th></tr>
                    <form method ="post" action="newjsp.jsp">
                      

        <%
            try
                {
                   Class.forName("com.ibm.db2.jcc.DB2Driver");
                   Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
                    Statement stmt=con.createStatement();
                    ResultSet reset = stmt.executeQuery("select email from user where email not in 'admin'");
                    while(reset.next())
                    {
        %>
                <tr>
                         <td>
                            <input type="radio" name="name" value="<%out.print(reset.getString(1));%>"/>
                         </td>
                         <td>
                             <%
                              out.println(reset.getString(1));
                             %>
                          </td>
                    </tr>
                             <%
                    }
                }
                             catch(Exception E)
                                    {
                                        out.print("Connection Error");
                                        out.print(E.getMessage());
                                    }
                             %>
<tr>
      <td colspan="2" align="center">
                               <input type="submit" name="submit" value="View_Details"/>
                           </td>
                       </tr>
                    </form>
         </table>
