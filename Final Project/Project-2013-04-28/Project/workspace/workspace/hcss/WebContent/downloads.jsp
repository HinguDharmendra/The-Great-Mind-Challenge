<%@page import="java.io.FileInputStream"%>
<%
  //String filename = request.getParameter("fname");
  String filepath = request.getParameter("pname");
  String filepath1=filepath.substring(0, filepath.length()-4);

  //String filename1=filename.substring(0, filename.length()-2);
  //response.setContentType("APPLICATION/OCTET-STREAM");
  response.setContentType("APPLICATION/X-DOWNLOAD");//boss pdf chala hai

  //response.setContentType("application/pdf");
  response.setHeader("Content-Disposition","attachment; filename=\"" + filepath1 + "\"");

  FileInputStream fileInputStream = new FileInputStream(filepath1);

  int i;
  while ((i=fileInputStream.read()) != -1) {
    out.write(i);
  }
  fileInputStream.close();
  //response.sendRedirect("welcome.jsp");
%> 