<%-- 
    Document   : user_login
    Created on : 28 Sep, 2017, 4:02:19 PM
    Author     : hp
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
    </head>
    <body>
        <div>
        <%
 if(session.getAttribute("user_login")!=null){
  response.sendRedirect("welcome.jsp");
 }
%>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td>
          <%@ include file="primarymenu.html"%>
	  </td>
    </tr>
    <tr>
      <td valign="top" style="background-color:#F3F3F3"><br/><br/>
	  <%
	   if(request.getParameter("action")!=null){
	    out.print("<h3 style='color:blue;text-align:center'>"+request.getParameter("action")+"</h3>");
	   }
	  %>
	  <form name="user_login" method="post" action="">
	  <table style="width:40%;background-color:#FFFFFF;border:1px solid #9B9B9B;box-shadow:2px 2px 2px 2px skyblue;border-radius:10px" cellspacing="0" cellpadding="15" align="center">
  <caption><h2 style="color:#FF99FF"><br>
    Secure Login</h2><br>
  </caption>
  <tr>
    <td>UserName</td>
    <td><input type="text" name="ulogin_uname" required="required"/></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><input type="password" name="ulogin_pass" required="required"/></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
	<input type="submit" name="ulogin_btn" value="Login" style="height:30px;background-color:#FF0000;color:#FFFFFF;width:80px;font-size:18px;border-radius:10px;cursor:pointer"/>
	</td>
    </tr>
</table>
<% if(request.getParameter("ulogin_btn")!=null){
 String ulogin_uname=request.getParameter("ulogin_uname");
 String ulogin_upass=request.getParameter("ulogin_pass");
 Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql:///online_banking","root","");
 PreparedStatement pstmt=con.prepareStatement("select cust_username,cust_password from accounts where cust_username=?");
 pstmt.setString(1,ulogin_uname);
 ResultSet rs=pstmt.executeQuery();
 if(rs.next()){
  if(rs.getString("cust_username").equals(ulogin_uname) && rs.getString("cust_password").equals(ulogin_upass)){
   session.setAttribute("user_login",ulogin_uname);
       if(rs.getString("cust_username").equals(rs.getString("cust_password")))
			  response.sendRedirect("userchange_pass.jsp");
			 else
			  response.sendRedirect("welcome.jsp");
  } 
  else{
   out.print("<script>alert('Wrong password for usename "+ulogin_uname+"')</script>");
  }
 }
 else{
  out.print("<script>alert('UserName does not exist!')</script>");
 }
}
%>
</form><br><br>
	  </td>
    </tr>
	 <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
	  </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>
</div>
</body>
