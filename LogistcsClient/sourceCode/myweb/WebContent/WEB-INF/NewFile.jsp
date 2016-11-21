<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
          Connection conn=null;
		  Statement stmt=null;
		  String sql=null;
		  ResultSet rs=null;
		  
		  %>
<form name="form3" method="post" action="">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
 <td>       
       <%
      
       try
       {
       
          Class.forName("com.mysql.jdbc.Driver").newInstance();
          String url ="jdbc:mysql://localhost:3306/wl?user=wl&password=wl";
          conn= DriverManager.getConnection(url);
          stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          sql="select GoodsID from tbGoods";
          rs=stmt.executeQuery(sql);
         
          while(rs.next())
          {
        	  out.println(rs.getString(1));
          }
       }
   		catch (java.sql.SQLException e)
           {
               System.out.println(e.getMessage());
               
           } 
           catch (Exception ex)// 
           {
               System.out.println(ex.getMessage());
           } 
           finally {      
           try {
               if (conn != null)
                   conn.close();
           } catch (java.sql.SQLException e) {
           	System.out.println(e.getMessage());
           }
          
           try {
               if (stmt != null)
               	stmt.close();
           } catch (java.sql.SQLException e) {
           	System.out.println(e.getMessage());
           }
           try {
               if (conn != null)
               	conn.close();
           } catch (java.sql.SQLException e) {
           	System.out.println(e.getMessage());
           }
               
           }           
        
      %>           
    
		
 
   </td>
</tr>
   
     
         
</table>
</form>
</body>
</html>