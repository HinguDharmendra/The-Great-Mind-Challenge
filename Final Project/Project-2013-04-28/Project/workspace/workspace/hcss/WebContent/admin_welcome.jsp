
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
if(session.isNew()!=true)
{
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", -1);
    response.setHeader("Pragma", "no-cache");

    if(session.getAttribute("Username")==null)
    {
        out.println("You need to Login first!");
        //response.sendRedirect("sessionend.jsp");
    }
    else
    {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		<div id="hcss_content_right">
                    <div class="loc" id="hiuser">
                Hi, <%out.print(session.getAttribute("Username"));%>&nbsp;&nbsp;
                <a href="logout.jsp">
                    <font color="red"> Logout</font>
                </a>
                </div><br/>
                    
                    <div class="slider-wrap">
                            <div id="slider1" class="csw">
                                    <div class="panelContainer">
                                            <div class="panel" title="View Users">
                                                <div class="wrapper">

                                                    <%@include file="user_view.jsp" %>
                                                            
                                        		</div>
                                            </div>
                                        <div class="panel" title="Delete Users">
                                                <div class="wrapper">

                                                         <%@include file="users_delete.jsp" %>
                                                            
                                        		</div>
                                            </div>
                                        <div class="panel" title="View Files">
                                                <div class="wrapper">

                                                    <%@include file="file_view.jsp" %>
                                                            
                                        		</div>
                                            </div>
                                        <div class="panel" title="Delete Files">
                                                <div class="wrapper">

                                                           <%@include file="file_delete.jsp" %>
                                                            
                                        		</div>
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
                                                            <%
}}%>
