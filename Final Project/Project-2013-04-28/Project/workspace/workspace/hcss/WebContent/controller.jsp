<%
if(session.isNew()!=true)
{
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", -1);
    response.setHeader("Pragma", "no-cache");

    if(session.getAttribute("Username")==null)
    {
        response.sendRedirect("sessionend.jsp");
    }
    else
    {

    }
}
%>