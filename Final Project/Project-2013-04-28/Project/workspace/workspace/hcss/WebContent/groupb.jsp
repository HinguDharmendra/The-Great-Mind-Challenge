<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="controller.jsp" %>
<%
    String requestee1 = request.getParameter("group");
    String requestee = requestee1.substring(0, requestee1.length()-2);
    String requester = session.getAttribute("Username").toString();

    if(request.getParameter("submit")!=null)
        {
        try
        {
            Class.forName("com.ibm.db2.jcc.DB2Driver");
            Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
            Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = st.executeQuery("select * from group where requester='"+requester+"' and requestee='"+requestee+"'");
            int count=0;
              while(rs.next())
              {
                count++;
              }
              if(count > 0)
              {
                out.println("Request Has Already Been Sent");
              }
              else
              {
                PreparedStatement  stat=con.prepareStatement("insert into group (requester, requestee, approve) values(?,?,?)");
                stat.setString(1, requester);
                stat.setString(2, requestee);
                stat.setString(3, "n");
                stat.executeUpdate();
                response.sendRedirect("welcome1.jsp#6");//out.println("Proper");
              }

        }
        catch(Exception E)
        {
            out.print(E.getMessage());
        }
        }
    else
        {out.println("You need to submit your form first!");}


        %>