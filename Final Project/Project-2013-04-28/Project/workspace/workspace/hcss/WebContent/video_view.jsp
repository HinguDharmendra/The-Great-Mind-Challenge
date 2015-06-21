
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
<%
String path=request.getParameter("pname");

%>
    <video src=<%out.println(path);%> controls="controls"></video>
    </body>
</html>
