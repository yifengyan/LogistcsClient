<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ujs.*"%> 


<% String msg="欢迎登录!"; %>
<jsp:useBean id="bean" class="ujs.Info" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Login Page</title>
</head>
<Script language="javascript">
function f()
{
if(form1.name.value=="")
{
	alert("请输入用户名！！");
	form1.name.focus();
	form1.password.value="";
	return false;
}
if(form1.password.value=="")
{
	alert("请输入密码！！！");
	form1.password.focus();
	return false;
}
}
function goback()
{
	window.location.href="login.jsp";
}
</Script>

<body background="images/login.png" style="background-position:top; background-repeat:no-repeat;" >

<form action="hello" method="post" name="form1">
   <table align="center">
     <tr height=300 >
       <td>
       </td>
     </tr>
      <tr>
        <td align="right">用户名：</td>
        <td align="left"><input type="text" name="username" class="login"></td>
      </tr>
      <tr>
        <td align="right">密码：</td>
        <td align="left">
        
        <input type="password" name="password" class="login">
      
        </td>
        
      </tr>
      <tr height="60">
			<td colspan="2" align="center">
				<input type="submit" value="登录" name="login" onClick="f()">
				<input type="reset" value="清空" name="back" onClick="goback()">

			</td>
			
		</tr>
		     <tr >
			<td colspan="2" align="center">
			<a href="load.jsp">下载用户手册</a>
			
					
			</td>
			
		</tr>
	
   </table>
 </form>
<jsp:setProperty name="bean" property="id" param="username"/>
<jsp:setProperty name="bean" property="password" param="password"/>


</body>
</html>