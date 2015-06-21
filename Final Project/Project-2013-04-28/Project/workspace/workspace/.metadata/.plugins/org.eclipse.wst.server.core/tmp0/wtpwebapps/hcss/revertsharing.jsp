<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
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
    String suser1="";
    String path1="";
    suser1 = request.getParameter("user");
    if(suser1.equals(""))
    {
        out.println("Enter both the fields");
    }
    String suser=suser1.substring(0, suser1.length()-2);
    
    //out.println(suser);
    //out.println(suser.charAt(20));
    //out.println(suser.length());
    ///String suser1=suser.substring(0, suser.length()-2)

    path1 = request.getParameter("fileloc");
    if(path1.equals(""))
    {
        out.println("Enter both the fields");
    }
    String path=path1.substring(0, path1.length()-2);

    //out.println(path.charAt(59));
    //out.println(path.length());
    //out.println(path);
    boolean done=false;

    if(request.getParameter("submit")!=null)
    {
        try
        {
                Class.forName("com.ibm.db2.jcc.DB2Driver");
                Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select suser, location from sfile where suser='"+suser+"'");
                ResultSetMetaData rsmd = rs.getMetaData();
                int numberOfColumns = rsmd.getColumnCount();
                while(rs.next())
                {
                    for(int i=1;i<=numberOfColumns;i+=2)
                    {
                        //if(path.length()==rs.getString(2).toString().length())
                        if(path.equals(rs.getString(2)))
                        {
                            done=true;
                            //delete
                            PreparedStatement psmnt = null;
                            psmnt = con.prepareStatement("delete sfile where location='"+path+"' and suser='"+suser+"'");
                            int s = psmnt.executeUpdate();
                            if(s>0){
                            response.sendRedirect("welcome1.jsp#5");
                            con.close();
                            }
                            else{
                            out.println("Error!");
                            con.close();}
                            //out.println(rs.getString(2).toString().length());
                            //out.println(rs.getString(2));
                            //out.println("Proper");
                        }
                        
                    }
                }
                if(done==false)
                {
                    out.println("Select Matching Pair of Values");
                }
        }
        catch(Exception e)
        {
            out.println(e);
        }

/*



                psmnt = con.prepareStatement("insert into sfile (suser,ouser,location) values (?,?,?)");
                psmnt.setString(1,suser1);
                psmnt.setString(2,owner);
                //psmnt.setString(3,filename);
                psmnt.setString(3,path);
                int s = psmnt.executeUpdate();
                if(s>0){
                response.sendRedirect("welcome1.jsp#4");
                con.close();
                }
                else{
                out.println("Error!");
                con.close();
                }
        }
        catch(Exception e){
            e.printStackTrace();
        }

*/
    }
    else
    {
        out.println("You need to submit your form");
    }
%>