<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>


<%@ page import="ujs.Info" %>
<jsp:useBean id="bean" class="ujs.Info" scope="session"></jsp:useBean>

<%  
		String ggID=request.getParameter("test");
		String cTime=null;
		String ggCar=request.getParameter("gCar");

		String GoodsID=null;
		String CarNum=null;
		String GoodsWeight=null;
		String StartCity=null;
		String EndCity=null;
		String StartTime=null;
		String EndTime=null;
		
		
		String CarLoad=null;
%>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
#allmap {width: 800px;height: 500px;overflow: hidden;margin:0;}
#l-map{height:800px;width:234px;float:left;border-right:2px solid #bcbcbc;}
#r-result{height:800px;width:60px;float:left;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=273d0bc9eef480aa77cf844924fe1caa"></script>

<title>Welcome to Logistics Manage System!</title>
</head>


<body>

<%-- <inquire:GoodsInfo gggID="<%= ggID %>"/>--%>

<%-- 根据ggID更新地图--%>
<%
          Connection conn=null;
		  Statement stmt=null;
		  String sql=null;
		  ResultSet rs=null;
		 
		if(ggID!=null)
		{
		 
	      StringBuffer city=null;
		  try
          {
          Class.forName("com.mysql.jdbc.Driver").newInstance();
          String url ="jdbc:mysql://localhost:3306/wl?user=wl&password=wl";
          conn= DriverManager.getConnection(url);
          stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          sql="select * from tbGoods where GoodsID='"+ggID+"'";
          rs=stmt.executeQuery(sql);
         
          while(rs.next())
          {
           		GoodsID=rs.getString(1);
           		GoodsWeight=rs.getString(2);
				CarNum=rs.getString(3);
				
				
        	  if(rs.getString(4).equalsIgnoreCase("beijing"))
        	  {
        	     StartCity="北京";
        	  }
        	  else if(rs.getString(4).equalsIgnoreCase("shanghai"))
        	  {
        	  	 StartCity="上海";
        	  }
        	  else if(rs.getString(4).equalsIgnoreCase("guangzhou"))
        	  {
        	  	 StartCity="广州";
        	  }
        	  else if(rs.getString(4).equalsIgnoreCase("chongqing"))
        	  {
        	  	 StartCity="重庆";
        	  }
        	  else if(rs.getString(4).equalsIgnoreCase("xian"))
        	  {
        	  	 StartCity="西安";
        	  }
        	  
        	  if(rs.getString(5).equalsIgnoreCase("beijing"))
        	  {
        	     EndCity="北京";
        	  }
        	  else if(rs.getString(5).equalsIgnoreCase("shanghai"))
        	  {
        	  	 EndCity="上海";
        	  }
        	  else if(rs.getString(5).equalsIgnoreCase("guangzhou"))
        	  {
        	  	 EndCity="广州";
        	  }
        	  else if(rs.getString(5).equalsIgnoreCase("chongqing"))
        	  {
        	  	 EndCity="重庆";
        	  }
        	  else if(rs.getString(5).equalsIgnoreCase("xian"))
        	  {
        	  	 EndCity="西安";
        	  }
        	  StartTime=rs.getString(6);
        	  EndTime=rs.getString(7);
   	  
          }
       }
   		catch (java.sql.SQLException e)
           {
               System.out.println(e.getMessage());             
           } 
           catch (Exception ex)
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
		}
		if(ggCar!=null)
		{
			 
		      StringBuffer city=null;
			  try
	          {
	          Class.forName("com.mysql.jdbc.Driver").newInstance();
	          String url ="jdbc:mysql://localhost:3306/wl?user=wl&password=wl";
	          conn= DriverManager.getConnection(url);
	          stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	          sql="select * from tbCar where CarNum='"+ggCar+"'";
	          rs=stmt.executeQuery(sql);
	         
	          while(rs.next())
	          {
	        	  	CarNum=rs.getString(1);
	           		CarLoad=rs.getString(2);
	           		StartCity=rs.getString(3);
	           		EndCity=rs.getString(4);
					
	        	  if(rs.getString(3).equalsIgnoreCase("beijing"))
	        	  {
	        	     StartCity="北京";
	        	  }
	        	  else if(rs.getString(3).equalsIgnoreCase("shanghai"))
	        	  {
	        	  	 StartCity="上海";
	        	  }
	        	  else if(rs.getString(3).equalsIgnoreCase("guangzhou"))
	        	  {
	        	  	 StartCity="广州";
	        	  }
	        	  else if(rs.getString(3).equalsIgnoreCase("chongqing"))
	        	  {
	        	  	 StartCity="重庆";
	        	  }
	        	  else if(rs.getString(3).equalsIgnoreCase("xian"))
	        	  {
	        	  	 StartCity="西安";
	        	  }
	        	  
	        	  if(rs.getString(4).equalsIgnoreCase("beijing"))
	        	  {
	        	     EndCity="北京";
	        	  }
	        	  else if(rs.getString(4).equalsIgnoreCase("shanghai"))
	        	  {
	        	  	 EndCity="上海";
	        	  }
	        	  else if(rs.getString(4).equalsIgnoreCase("guangzhou"))
	        	  {
	        	  	 EndCity="广州";
	        	  }
	        	  else if(rs.getString(4).equalsIgnoreCase("chongqing"))
	        	  {
	        	  	 EndCity="重庆";
	        	  }
	        	  else if(rs.getString(4).equalsIgnoreCase("xian"))
	        	  {
	        	  	 EndCity="西安";
	        	  }
	        	  StartTime=rs.getString(5);
	        	  EndTime=rs.getString(5);
	   	  
	          }
	       }
	   		catch (java.sql.SQLException e)
	           {
	               System.out.println(e.getMessage());             
	           } 
	           catch (Exception ex)
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
			}
			
 
 %>
 <form name="form3" method="post" action="index.jsp">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
   <td  height="90" align="center" colspan="2">
       <img src="images/top.png" width="1000" height="90">
   </td>
 </tr>
 
 <tr height="500" >
 
   <td width="80%" align="center" >
     <!--  放地图 -->
   <div id="allmap" ></div>
     
   </td>
   
   <td width="20%" align="center" >
   
   <table align="center" bordercolor="grey" border=1 >
   
     <tr height="40">
      <td valign="top" width="40%" align="center">
       当前时间:
      </td>
      <td align="center">
      	<%
      
       try
       {
       
          Class.forName("com.mysql.jdbc.Driver").newInstance();
          String url ="jdbc:mysql://localhost:3306/wl?user=wl&password=wl";
          conn= DriverManager.getConnection(url);
          stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          sql="select CurrTime from tbTime";
          rs=stmt.executeQuery(sql);
         
          while(rs.next())
          {
        	  cTime=rs.getString(1);
        	  out.println( rs.getString(1));
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
      
      <tr height="60" >
       <td colspan="2" align="center"><font size=5>
       <%
if(ggID!=null)
{
	if(ggCar.equalsIgnoreCase("0"))
	{
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

java.util.Date d = null;
d = format.parse(StartTime);
java.sql.Date st = new java.sql.Date(d.getTime());
d = format.parse(EndTime);
java.sql.Date et = new java.sql.Date(d.getTime());
d = format.parse(cTime);
java.sql.Date ct = new java.sql.Date(d.getTime());

//java.sql.Date NowTime = new java.sql.Date(System.currentTimeMillis());
       
         if(st.after(ct))
        	 out.println("尚未发货");
         if(et.before(ct))
         		out.println("货物已送达");
         if(st.before(ct) && et.after(ct))
  			out.println("正在途中");
	}
	else if(ggID.equalsIgnoreCase("0"))
	{
		
		
		out.println(StartCity+"开往"+EndCity);
		
	}
}

       else 
       {
    		out.println("请选择车辆或货物以查询");
       	
       }
        	 %>
           
          
           </font>
      </td>
     </tr>
     
    <tr height="40">
     
       <td colspan="2">
   选择车辆：
    <select name="cID" onChange="c()">
       
       <%
      
       try
       {
       
          Class.forName("com.mysql.jdbc.Driver").newInstance();
          String url ="jdbc:mysql://localhost:3306/wl?user=wl&password=wl";
          conn= DriverManager.getConnection(url);
          stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          sql="select CarNum from tbCar";
          rs=stmt.executeQuery(sql);
         
          while(rs.next())
          {
        	  out.println("<option value='" +rs.getString(1)+ "'>"+ rs.getString(1) +"</option>");
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

    
		</select>
		<input type="hidden" name="gCar" value=<%= CarNum %>/>
        
       </td>
    </tr>
    
 
   <tr height="60" valign="top">
   <td colspan="2">
   选择货物：
    <select name="gID" onChange="f()">
       
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
        	  out.println("<option value='" +rs.getString(1)+ "'>"+ rs.getString(1) +"</option>");
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

    
		</select>
        
           <input type="hidden" name="test" value=<%= GoodsID %>/>
    
   </td>
   </tr>
   
     
       <tr height="300" valign="top">
       <td  colspan="2">
       
       <div><BR>
		<%-- 	<%= foundResult %> --%>
		       <%
if(ggID!=null)
{
	if(ggCar.equalsIgnoreCase("0"))
	{out.println("<table><tr><td width=80px>货物编号:</td><td>" +GoodsID); 
	out.println("</td></tr><tr><td>货物重量:</td><td>" +GoodsWeight+"千克"); 
	out.println("</td></tr><tr><td>车辆编号:</td><td>" +CarNum); 
	out.println("</td></tr><tr><td>始发地:</td><td>" +StartCity); 
	out.println("</td></tr><tr><td>目的地:</td><td>" +EndCity); 
	out.println("</td></tr><tr><td>发货时间:</td><td>" +StartTime); 
	out.println("</td></tr><tr><td>收货时间:</td><td>" +EndTime); 
	out.println("</td></tr></table>");
	}
	else if(ggID.equalsIgnoreCase("0"))
	{out.println("<table><tr><td width=80px>车辆编号:</td><td>" +CarNum); 
	out.println("</td></tr><tr><td>车辆载重:</td><td>" +CarLoad+"千克"); 
	out.println("</td></tr><tr><td>始发地:</td><td>" +StartCity); 
	out.println("</td></tr><tr><td>目的地:</td><td>" +EndCity); 
	out.println("</td></tr><tr><td>发车时间:</td><td>" +StartTime); 
	out.println("</td></tr><tr><td>抵达时间:</td><td>" + EndTime); 
	out.println("</td></tr></table>");
		
	}
}

       else 
       {
       

       	
       }
        	 %>

		
        	
       </div>     
       </td>
       </tr>
       

       </table>
 </tr>

 <tr height="30" align="center" bgcolor=grey>
           <td colspan="2">
           <div>CopyRights</div>
           </td>
         </tr>
         
</table>
</form>

</body>
<script type="text/javascript">
   function search(){
     var id = document.getElementsByName("gID").value;
      
     window.location = "index.jsp" ;
   }
</script>

<script type="text/javascript">
var map = new BMap.Map("allmap");
map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
map.enableScrollWheelZoom();                            //启用滚轮放大缩小
map.addControl(new BMap.MapTypeControl());          //添加地图类型控件



//GPS坐标
var xx = 119.8;
var yy =31.58;
var gpsPoint = new BMap.Point(xx,yy);

map.addControl(new BMap.NavigationControl());

//添加谷歌marker和label
var markergps = new BMap.Marker(gpsPoint);
map.addOverlay(markergps); //添加GPS标注
var labelgps = new BMap.Label("我的位置",{offset:new BMap.Size(20,-10)});
markergps.setLabel(labelgps); //添加GPS标注


var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});
driving.search("<%= StartCity%>", "<%= EndCity%>");
var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});
driving.search("<%= StartCity%>", "<%= EndCity%>");



</script>

<script type="text/javascript" language="javascript">
 function f(){
 document.forms["form3"].test.value =document.forms["form3"].gID.value;  //获取jsp中表单的值
 document.forms["form3"].gCar.value ="0"; 
 document.form3.submit();
 }
</script> 

<script type="text/javascript" language="javascript">
 function c(){
 document.forms["form3"].gCar.value =document.forms["form3"].cID.value;  //获取jsp中表单的值
 document.forms["form3"].test.value ="0";
 document.form3.submit();
 }
</script> 
</html>


