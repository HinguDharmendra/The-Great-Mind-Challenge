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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Highly Confidential Security System</title>
        <link href="css/hcss.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="js/jquery-ui-1.10.2/css/jquery-ui-1.10.2.custom.min.css" />
                <meta name="description" content="Highly Confidential Security System"/>
		<meta name="keywords" content="VJTI, Security, system, highly confidential, confidential"/>
		<meta name="author" content="Dharmendra Hingu, Harnish Gevaria, Meenali Kaprani"/>

                <script src="js/jquery-ui-1.10.2/js/jquery-1.9.1.js" type="text/javascript"></script>
                <script src="js/jquery-ui-1.10.2/js/jquery-ui-1.10.2.custom.js" type="text/javascript"></script>
                <script src="js/jquery-easing.1.2.pack.js" type="text/javascript"></script>
                <script src="js/jquery-easing-compatibility.1.2.pack.js" type="text/javascript"></script>
                <script src="js/coda-slider.1.1.1.pack.js" type="text/javascript"></script>
               <script type="text/javascript">
                    jQuery(window).bind("load", function() {
                        jQuery("div#slider1").codaSlider()
                        });
                </script>
</head>

   <body background="images/distressed.jpeg"><font color="white">
    <div id="hcss_title_bar_wrapper">
	<div id="hcss_logo">
          <img src="images/logob300150.png" alt="LOGO"/>
	</div>

        <div id="hcss_title_bar">
		<p id='head'>Highly Confidential Security System</p>
	</div>
    </div>

    <div id="search" align="right">
        <!--<a href="logout.jsp">Logout</a>-->
	<form method="post" action ="search.jsp">
            <input type="text" name='search'></input>
            <input type="submit" name='submit' value='Search'></input>
	</form>
    </div>

    <div id="hcss_content_wrapper">

		<!-- start of slider -->
               <div class="loc" id="hiuser">
                Hi, <%out.print(session.getAttribute("Username"));%>&nbsp;&nbsp;
                <a href="logout.jsp">
                    <font color="red"> Logout</font>
                </a>
                </div>
                <br/>
            <div class="slider-wrap">
                <div id="slider1" class="csw">
                    <div class="panelContainer">
			<div class="panel" title="Portfolio">
				<div class="wrapper">

                                    <%@include file="portfolio.jsp" %>
					<div class="loc">
                                        <p>

                                         <a href="#2" class="cross-link" title="Go to Page 2">Next &#187;</a>
                                        </p>
                                         </div>

				</div>
			</div>

			<div class="panel" title="Locker">
				<div class="wrapper">
                                    <div class="loc"><br/><a href="welcome2.jsp#5">LOCKER<br/>&nbsp;</a><br/></div><br/>
                                    <div class="loc"><br/><a href="welcome2.jsp#1">DOCUMENTS<br/>&nbsp;</a></div><br/>
                                    <div class="loc"><br/><a href="welcome2.jsp#2">IMAGES<br/>&nbsp;</a></div><br/>
                                    <div class="loc"><br/><a href="welcome2.jsp#3">AUDIO<br/>&nbsp;</a></div><br/>
                                    <div class="loc"><br/><a href="welcome2.jsp#4">VIDEO<br/>&nbsp;</a></div><br/>

                                    <div class="loc">
                                    <p>
                                        <a href="#1" class="cross-link" title="Go to Page 1">&#171; Previous</a>
                                        |
                                        <a href="#3" class="cross-link" title="Go to Page 3">Next &#187;</a>
                                    </p>
                                        </div>
                                </div>
			</div>
                        <div class="panel" title="Shortcut">
				<div class="wrapper">
                                    <%@include file="shortcuts.jsp" %>
                                    <div class="loc">
                                    <p>
                                        <a href="#2" class="cross-link" title="Go to Page 4">&#171; Previous</a>
                                        |
                                        <a href="#4" class="cross-link" title="Go to Page 6">Next &#187;</a>
                                    </p>
                                        </div>
                                </div>
			</div>
                        <div class="panel" title="Shared Files">
				<div class="wrapper">
                                     <%@include file="sharedfiles.jsp" %>
                                    <div class="loc">
                                    <p>
                                        <a href="#3" class="cross-link" title="Go to Page 3">&#171; Previous</a>
                                        |
                                        <a href="#5" class="cross-link" title="Go to Page 5">Next &#187;</a>
                                    </p>
                                        </div>
                                </div>
			</div>
                        <div class="panel" title="Contact List">
                                <div class="wrapper">
                                    <%@include file="grp_list.jsp" %> 

                                <div class="loc">
                                    <p>
                                        <a href="#4" class="cross-link" title="Go to Page 4">&#171; Previous</a>
                                        |
                                        <a href="#6" class="cross-link" title="Go to Page 6">Next &#187;</a>
                                    </p>
                                </div>
                                </div>
                        </div>
                        <div class="panel" title="Notifications">
                                <div class="wrapper">
                                    <%@include file="notification.jsp" %> 

                                <div class="loc">
                                    <p>
                                        <a href="#5" class="cross-link" title="Go to Page 5">&#171; Previous</a>
                                         |
                                        <a href="#7" class="cross-link" title="Go to Page 7">Next &#187;</a>
                                    </p>
                                </div>
							 </div>
                        </div>
<div class="panel" title="Share Files">
				<div class="wrapper">
                                     <%@include file="sharefiles.jsp" %>
                                    <div class="loc">
                                    <p>
                                        <a href="#6" class="cross-link" title="Go to Page 6">&#171; Previous</a>
                                       
                                    </p>
                                        </div>
                                </div>
			</div>


                    </div><!-- .panelContainer -->
                </div><!-- #slider1 -->
            </div><!-- .slider-wrap -->

    </div><!-- hcss_content_wrapper--></font>
    <div id="templatemo_footer">

        Copyright © 2014 Highly Confidential Security Team |<font color="red" ><i> The Fallen</i></font>

    </div> <!-- end of templatemo_footer -->
</body>
</html>
<%
}}%>