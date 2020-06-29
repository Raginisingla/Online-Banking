<%-- 
    Document   : welcome
    Created on : Apr 17, 2015, 10:41:13 AM
    Author     : SATYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" type="text/css" rel="stylesheet"/>
        <title>User Settings</title>
		<script language="javascript" src="jquery.js"></script>
    </head>
    <body class="settings">       
		<table border="0" cellspacing="0" cellpadding="0" style="width: 100%">   
     <tr>
                        <td colspan="2"><%@include file="wel_header.html"%></td>
                    </tr>
					  <tr>
    <td colspan="2"><%@include file="ses.jsp"%></td>
    </tr>
	<tr>
      <td colspan="2"><%@ include file="wel_menu.html"%></td>
	</tr>
	
  <tr>
    <td width="20%" valign="top"><%@include file="leftslider.html" %></td>
   
	<!-- links of welcome page-->
	
    <td width="80%" style="padding-left:30px" valign="top"><br><br>
	<div id="existing_ac" style="border-bottom:groove 1px;width:500px" align="left">	<img src="image/templatemo_right_nav.png"><strong style="font-size:20px">Password Setting </strong> </div>
	<div id="existing_ac_data" style="display:none"> <br><%
	String checkpass="";
	Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql:///online_banking","root","");
	try{
	 Statement set_stmt=con.createStatement();
	 ResultSet set_rs=set_stmt.executeQuery("select *from account_info where accno='"+acno+"'");
	 set_rs.next();
	 if(set_rs.getString("pwd_infodate").equals("null"))
	  checkpass="Password never changed";
	 else
	  checkpass="Password changed on "+set_rs.getString("pwd_infodate")+" at "+set_rs.getString("pwd_infotime");
	 set_rs.close();
	}
	catch(Exception e){ out.print(e);} %>
	<%=checkpass%> &nbsp;&nbsp;&nbsp;&nbsp; <a style="cursor:pointer;color:blue
	;text-decoration:underline" id="change">Change</a><br><br>
	<form name="change_password" action="" method="post">
	  <table width="50%" border="0" cellspacing="0" cellpadding="15" style="display:none;border:1px solid;border-radius:10px" id="chpass_table">
  <tr>
    <td>New Password</td>
    <td><input type="password" name="new_pass" required="required"/></td>
  </tr>
  <tr>
    <td>Confirm Password</td>
    <td><input type="password" name="new_pass1" required="required"/></td>
  </tr>
  <tr>
    <td>Old Password</td>
    <td><input type="password" name="old_pass" required="required"/></td>
  </tr>
  <tr>
  	<td colspan="2" align="center"><input type="submit" value="Change" name="chpass_btn"/></td></tr>
</table>
<% //change password event
 if(request.getParameter("chpass_btn")!=null){
 try{
  String newpass=request.getParameter("new_pass");
  String newpass1=request.getParameter("new_pass1");
  String oldpass1=request.getParameter("old_pass");
  String oldpass="";
  if(newpass.equals(newpass1)){
    Statement set_stmt1=con.createStatement();
    ResultSet set_rs1=set_stmt1.executeQuery("select cust_password from accounts where accno='"+acno+"'");
	if(set_rs1.next()){
         oldpass=set_rs1.getString("cust_password");
      set_stmt1.close();
      }
   if(oldpass.equals(oldpass1)){

      Statement set_stmt2=con.createStatement();
      set_stmt2.executeUpdate("update accounts set cust_password='"+newpass+"' where accno='"+acno+"' and cust_password='"+oldpass+"'");
      set_stmt2.executeUpdate("update account_info set pwd_infodate=curdate(),pwd_infotime=curtime() where accno='"+acno+"'");
      out.print("<script>alert('Password changed. You will be logged out. Please login again.')</script>");
      session.invalidate(); 
      response.sendRedirect("user_login.jsp");
   }
	else
       out.print("<script>alert('You entered wrong password')</script>"); 
  }
  else
    out.print("<script>alert('Password does not match')</script>");
  } 
  catch(Exception e){ out.print(e); }
 }
%>
	</form>
	</div>
	
	
	<script>
	$(document).ready(function(){
	 $("#existing_ac").click(function(){
	  $("#existing_ac_data").slideToggle(1000);
	 });
	 $("#change").click(function(){
	  $("#chpass_table").slideToggle();
	 });
	});
	</script>
	</td>
  </tr>
  <tr>
  <!--<td colspan="2"></td> -->
  </tr>
</table>
		
		
		
    </body>
</html>
