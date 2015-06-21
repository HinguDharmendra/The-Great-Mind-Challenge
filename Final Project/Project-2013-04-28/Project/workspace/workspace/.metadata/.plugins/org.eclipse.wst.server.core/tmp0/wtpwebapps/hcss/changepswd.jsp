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
<script type="text/javascript">
function CheckPassword(inputtxt)
{

var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
if(inputtxt.value.match(paswd))
{
    return true;
}
else
{
alert('Password should be at least 7 character long and must include atleast one numeric and one special character');
inputtxt.value ="";
return false;
}
}
function VerifyPswd(cpswd, pswd)
{
    if(cpswd.value == pswd.value)
{
    return true;
}
else
{
alert('Password did not matched');
pswd.value ="";
cpswd.value="";
return false;
}
}
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
                <br/>
                    <div class="slider-wrap">
                            <div id="slider1" class="csw">
                                    <div class="panelContainer">
                                            <div class="panel" title="Password Update">
                                                <div class="wrapper">
                                                    <form action="updatepswd.jsp" method="post">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <label>Current Password:</label>
                                                                </td>
                                                                <td>
                                                                    <input type="password" name="password"/>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <label>New Password:</label>
                                                                </td>
                                                                <td>
                                                                    <input type="password" name="npassword1" onchange="CheckPassword(npassword1);"/>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <label>Confirm Password:</label>
                                                                </td>
                                                                <td>
                                                                    <input type="password" name="npassword2" onchange="VerifyPswd(npassword2, npassword1);"/>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <input type="submit" name="submit" value="Submit"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </form>
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
