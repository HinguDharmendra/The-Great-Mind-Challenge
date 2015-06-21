<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

  function ValidateEmail()
  {
  var uemail = register.email;
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  if(uemail.value.match(mailformat))
  {
  return true;
  }
  else
  {
  alert("You have entered an invalid email address!");
  uemail.value="";
  uemail.focus();

  return false;
  }
  }
  function allLetter(value)
  {
  var uname = value;
  var letters = /^[A-Za-z]+$/;
  if(uname.value.match(letters))
  {
  return true;
  }
  else
  {
  alert('Field must have alphabet characters only');
  uname.value="";
  uname.focus();
  return false;
  }
  }
  function allNum(value)
  {
  var uno = value;
  var letters = /^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$/;
  if(uno.value.match(letters))
  {
  return true;
  }
  else
  {
  alert('Mobile Number must be Numeric and 10 digit');
  uno.value="";
  uno.focus();
  return false;
  }
  }

 </script>
<html>
<head>
<title>Highly Confidential Security System</title>
 <link href="css/hcss.css" rel="stylesheet" type="text/css" />
</head>
<body background="images/distressed.jpeg"><font color="white">
<div id='cream'>
	<div id="hcss_title_bar_wrapper">
		<div id="hcss_logo">
                   <img src="images/logob300150.png" alt="LOGO"/>
		</div>
		<div id="hcss_title_bar">
			<p id='head'>Highly Confidential Security System</p>
		</div>
	</div>
        <!--<a href="index.jsp#3">Login</a><a href="index.jsp#4">Register</a>-->
	</div>
        <h3>Please Enter All Your Details Same As You Entered While Registration. <br/></h3>

        <table border=0 id="port" align="center">
        <form method="post" action="resetpswdB.jsp" name="register">
        <tr>
                <td colspan=2 align="center"> </td>
        </tr>
        <tr>
		<td>Email</td>
		<td><input type="text" name="email" onchange="ValidateEmail();"></td>
	</tr>
	<tr>
		<td>New Password</td>
		<td><input type="password" name="password" onchange="CheckPassword(password);"></td>
	</tr>
        <tr>
		<td>Confirm Password</td>
		<td><input type="password" name="confirmpassword" onchange="VerifyPswd(confirmpassword, password);"></td>
	</tr>
	<tr>
		<td>Mobile No</td>
		<td><input type="text" name="mobile_no" onchange="allNum(mobile_no);"></td>
	</tr>
        <tr>
		<td>Security Code</td>
		<td><input type="text" name="uid" ></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="Submit" value="Register"></td>
	</tr>
</form>
</table>
    <p align="center">Please <a href="index.jsp#3"><font color="red">Login</font></a> Again for further services.</p>
     <div id="templatemo_footer">

        Copyright © 2014 Highly Confidential Security Team |<font color="red" ><i> The Fallen</i></font>

    </div> <!-- end of templatemo_footer -->

</font>
</body>
</html>