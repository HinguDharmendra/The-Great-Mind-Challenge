<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="controller.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Highly Confidential Security System</title>
        <link href="css/hcss.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Highly Confidential Security System"/>
		<meta name="keywords" content="VJTI, Security, system, highly confidential, confidential"/>
		<meta name="author" content="Dharmendra Hingu, Harnish Gevaria, Meenali Kaprani"/>
                <script src="js/jquery-1.2.1.pack.js" type="text/javascript"></script>
                <script src="js/jquery-easing.1.2.pack.js" type="text/javascript"></script>
                <script src="js/jquery-easing-compatibility.1.2.pack.js" type="text/javascript"></script>
                <script src="js/coda-slider.1.1.1.pack.js" type="text/javascript"></script>
                <script type="text/javascript"  src="js/DD_roundies_0.0.2a-min.js"></script>
                <script type="text/javascript">


                    jQuery(window).bind("load", function() {
                                    jQuery("div#slider1").codaSlider()
		});
</script>

</head>
<body background="images/distressed.jpeg">
    <font color="white">
    <div id='cream'>
	<div id="hcss_title_bar_wrapper">
		<div id="hcss_logo">
                  <img src="images/logob300150.png" alt="LOGO"/>
		</div>
		<div id="hcss_title_bar">
			<p id='head'>Highly Confidential Security System</p>
		</div>
	</div>

	<div id="search" align="right">
		<form method="post" action ="search.jsp">
			<input type="text" name='search'></input>
			<input type="submit" name='submit' value='Search'></input>
		</form>
	</div>
    </div>
    	<div id="hcss_content_wrapper">
            <div class="loc" id="hiuser">
                Hi, <%out.print(session.getAttribute("Username"));%>&nbsp;&nbsp;
                <a href="logout.jsp">
                    <font color="red"> Logout</font>
                </a>|
                <a href="welcome1.jsp">
                    <font color="red"> Home</font>
                </a>
            </div>
                <div class="slider-wrap">
                    <div id="slider1" class="csw">
                        <div class="panelContainer">
                            <div class="panel" title="Results">
                                <div class="wrapper">
                                    <%
                                    boolean indicator=false;
                                    String search=request.getParameter("search");
                                    if(request.getParameter("submit")!=null)
                                    {
                                    try
                                    {
                                        Class.forName("com.ibm.db2.jcc.DB2Driver");
                                        Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
                                        Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

                                    ResultSet rs = st.executeQuery("select fname, mname, lname, email, mobile_no, dob from user where email not in 'admin' and  email like '%"+search+"%' or fname like '%"+search+"%'");
                                    ResultSetMetaData rsmd = rs.getMetaData();
                                    int numberOfColumns = rsmd.getColumnCount();
                                    if(rs.next())
                                    {indicator=true;%>
                                    <table id="port" cellspacing="25px" align="center">
                                        <caption><h3>Users</h3></caption>
                                        <tr>
                                        <th>First_Name</th>
                                        <th>Middle_Name</th>
                                        <th>Last_Name</th>
                                        <th>Email</th>
                                        <th>Contact_No</th>
                                        <th>Date_of_Birth</th></tr>
                                    <%}
                                    rs.beforeFirst();
                                    while(rs.next())
                                    {%><tr><%
                                        for(int i=1;i<=numberOfColumns;i++)
                                        {
                                            %><td align="center"><%out.println(rs.getString(i));%></td><%
                                        }
                                    %></tr><% }
                                    %>
                                        </table>


                                        
                                        <br/><br/>



                                    <%
                                    Statement st1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                                    ResultSet rs1 = st1.executeQuery("select filename, type from file where filename like '%"+search+"%' or type like '%"+search+"%'and users='"+session.getAttribute("Username")+"'");
                                    ResultSetMetaData rsmd1 = rs1.getMetaData();
                                    int numberOfColumns1 = rsmd1.getColumnCount();%>

                                    <%
                                    if(rs1.next())
                                    {indicator=true;%>
                                    <table id="port" cellspacing="25px" align="center">
                                        <caption><h3>Your_Files</h3></caption>
                                        <tr>
                                        <th>File_Name</th>
                                        <th>Type_of_File</th></tr>
                                    <%}
                                    rs1.beforeFirst();
                                    while(rs1.next())
                                    {%><tr><%
                                        for(int i=1;i<=numberOfColumns1;i+=2)
                                        {
                                            %><td align="center"><a href="welcome2.jsp"><%out.println(rs1.getString(i));%></a></td>
                                              <td align="center"><%out.println(rs1.getString(i+1));%></td><%
                                        }
                                     %></tr><%}
                                    %>
                                       </table>



                                        <br/><br/>



                                    <%
                                    Statement st2 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                                    ResultSet rs2 = st2.executeQuery("select suser, ouser, location from sfile where location like '%"+search+"%' and ouser='"+session.getAttribute("Username")+"' or suser='"+session.getAttribute("Username")+"'");
                                    ResultSetMetaData rsmd2 = rs2.getMetaData();
                                    int numberOfColumns2 = rsmd2.getColumnCount();%>

                                    <%
                                    if(rs2.next())
                                    {indicator=true;%>
                                    <table id="port" cellspacing="25px" align="center">
                                        <caption><h3>Shared_File_Info</h3></caption>
                                        <tr>
                                        <th>Shared_User</th>
                                        <th>Owner</th>
                                        <th>File_Name</th></tr>
                                    <%}
                                    rs2.beforeFirst();
                                    while(rs2.next())
                                    {%><tr><%
                                        for(int i=1;i<=numberOfColumns2;i+=3)
                                        {
                                            %><td align="center"><%out.println(rs2.getString(i));%></td>
                                              <td align="center"><%out.println(rs2.getString(i+1));%></td>
                                              <td align="center"><a href="welcome2.jsp"><%out.println(rs2.getString(i+2));%></a></td><%
                                        }
                                     %></tr><%}
                                    %>
                                       </table>
                                       
                                    <%
                                    if(indicator==false)
                                    {
                                        out.println("No Object Found.");
                                    }
                                    }
                                    catch(Exception E)
                                    {
                                        out.print(E.getMessage());
                                    }
                                    }
                                    %>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </font>
       <div id="templatemo_footer">

        Copyright © 2014 Highly Confidential Security Team |<font color="red" ><i> The Fallen</i></font>

    </div> <!-- end of templatemo_footer -->
</body>
</html>
