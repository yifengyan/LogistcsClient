<%@ page language="java" contentType="text/html; charset=UTF-8; application/x-msdownload"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%   
      
      response.reset();//可以加也可以不加
      response.setContentType("application/x-download");
      String filedownload = "/home/zzy/workspace/myweb/WebContent/Table.doc";
      String filedisplay = "Table.doc";
      filedisplay = URLEncoder.encode(filedisplay,"UTF-8");
      response.addHeader("Content-Disposition","attachment;filename=" + filedisplay);

      OutputStream outp = null;
      FileInputStream in = null;
      try
      {
          outp = response.getOutputStream();
          in = new FileInputStream(filedownload);

          byte[] b = new byte[1024];
          int i = 0;

          while((i = in.read(b)) > 0)
          {
              outp.write(b, 0, i);
          }
          outp.flush();
      }
      catch(Exception e)
      {
          System.out.println("Error!");
          e.printStackTrace();
      }
      finally
      {
          if(in != null)
          {
              in.close();
              in = null;
          }
          if(outp != null)
          {
              outp.close();
              outp = null;
          }
      }%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>