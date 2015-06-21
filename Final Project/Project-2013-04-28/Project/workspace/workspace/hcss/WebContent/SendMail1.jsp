<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@ page import="javax.net.ssl.*" %>
<html>
<head>
<title>Highly Confidential Security System</title>
 <link href="css/hcss.css" rel="stylesheet" type="text/css" />
</head>
<body background="images/distressed.jpeg">
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
<%
int uid=0;
String to = request.getParameter("to");

try
{
    Class.forName("com.ibm.db2.jcc.DB2Driver");
    Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTING","DB2admin","mdh");
    Statement stmt=con.createStatement();
    ResultSet reset = stmt.executeQuery("Select u_id from user where email='"+to+"'");
    while(reset.next())
    {
	uid=reset.getInt(1);
    }
}
catch(Exception E)
{
    out.print("Connection Error");
    out.print(E.getMessage());
}


String host = "smtp.gmail.com";
String from="hcss.mdh@gmail.com";  // write your email address means from email address.
//String subject = request.getParameter("subject");
String subject="highly confidential security system";
//String messageText = request.getParameter("body");
double a=1234512* Math.random();
session.setAttribute("check",a);
String messageText="please enter this code field in the form"+"  "+a;
boolean sessionDebug = true;
// Create some properties and get the default Session.
//System.setProperty("smtp.protocols", "SSLv3");
Properties props = System.getProperties();

props.put("mail.smtp.user", from);
props.put("mail.smtp.starttls.enable","true");
//props.setProperty("mail.transport.protocol","smtp");
//props.setProperty("smtp.gmail.com","smtp");
props.setProperty("mail.smtp.host",host);
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "465");    //port is 587 for TLS  if you use SSL then port is 465

props.put("mail.debug", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

Session mailSession = Session.getInstance(props,null);
 
// Set debug on the Session
// Passing false will not echo debug info, and passing True will.
 
mailSession.setDebug(sessionDebug);
 
// Instantiate a new MimeMessage and fill it with the
// required information.
 
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setSentDate(new Date());
msg.setText(messageText);
 
// Hand the message to the default transport service
// for delivery.
 try {
 Transport transport = mailSession.getTransport("smtp");
transport.connect(host, "hcss.mdh@gmail.com", "mdh.hcss");
transport.sendMessage(msg, msg.getAllRecipients());
transport.close();
} catch(Exception m){
    m.printStackTrace();

}
%>
<div id="port">
<h3>
<%
//transport.send(msg);
out.println("Mail was sent to "+to);
out.println(" from "+from);
//out.println(" using host "+host+".");
%>
</h3>
<h3>Click here to reset the password AND ENTER THE CODE YOU RECEIVED IN YOUR MAIL BOX.<br/></h3>
                <a href="resetpswdF.jsp" class="cross-link">
                        <font color="red">Reset Password</font>
                    </a>
</div>
 <div id="templatemo_footer">

        Copyright © 2014 Highly Confidential Security Team |<font color="red" ><i> The Fallen</i></font>

    </div> <!-- end of templatemo_footer -->
</body>
</html>