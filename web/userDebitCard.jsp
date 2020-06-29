
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" type="text/css" rel="stylesheet"/>
		<script src="jquery.js" type="text/javascript"></script>
        <title></title>
		<style type="text/css">
		.tblcls{
		 opacity:0.2;
		}
		.tblcls1{
		opacity:10;
		}
		</style>
		<link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="debitCard">      	
	<table border="0" cellspacing="0" cellpadding="0" style="width: 100%">   
     <tr>
                   <td colspan="2"><%@include file="wel_header.html"%></td>
                    </tr>
					  <tr>
    <td colspan="2"><%@include file="ses.jsp"%></td>
    </tr>
    	  
	<tr>
      <td colspan="2" valign="top"><%@ include file="wel_menu.html"%></td>
	</tr>
	
  <tr>
    <td width="20%" valign="top"><%@include file="leftslider.html" %></td>
   
	<td width="80%" align="center" valign="top">
	<% 
	String opin="";              
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql:///online_banking","root","");
		Statement stmt	=con.createStatement();
		ResultSet debit_rs=stmt.executeQuery("select * from debit_card where accno= '"+acno+"'");
		if(debit_rs.next())
		{ opin=debit_rs.getString("pin_no");%>
    
	<br/><br/><br/>
	<table cellpadding="10" style="background-image:url('images/cardcopy.png');background-size:110% 110%;box-shadow:2px 3px 6px 10px gray;color:#D200D2;border-radius:18px;font-size:18px;" cellspacing="2" border="0" width="500" id="tbl">
	<tr> 
    <td>Account Number</td>
    <td><label><%=debit_rs.getString("accno")%></label></td>
    <td rowspan="3"><img src="images/master.png" width="121" height="79" align="middle"></td>
  	</tr>
  <tr>
    <td>Card Number</td>
    <td><label><%=debit_rs.getString("card_no")%></label></td>
  </tr>
  <tr>
    <td>Card Holder</td>
    <td><label><%=debit_rs.getString("issue_name")%></label></td>
  </tr>
  <tr>
    <td>Issue On</td>
    <td>Expiry On</td>
    <td>Cvv2 No</td>
  </tr>
  <tr>
    <td><label><%=debit_rs.getString("issue_on")%></label></td>
    <td><label><%=debit_rs.getString("expire_on")%></label></td>
    <td><input type="password" maxlength="3" value="<%=debit_rs.getString("cvv2")%>" style="width:80px" disabled="disabled"></td>
  </tr>
  <tr>
    <td>Pin Code</td>
	<td><input type="password" style="width:80px;" maxlength="4" value="<%=debit_rs.getString("pin_no")%>" disabled></td>
	<td><input type="submit" value="Change" name="cng_pin" id="sub" style="cursor:pointer;"></td>
	</tr></table>
	<%}
		else{ %>
		<h3 style="color:#33CC00">You do not have any Debit Card!</h3>
		<% }
		if(request.getParameter("pass_sub")!=null)
		{
		String pass1=request.getParameter("pass1");
		String pass2=request.getParameter("pass2");
        Statement stmt1	=	con.createStatement();
		if(pass1.equals(opin)){
		 stmt1.executeUpdate("update debit_card set pin_no='"+pass2+"' where id = '"+debit_rs.getString("id")+"'");
			out.print("<script>alert('Pin Changed Succesfully!')</script>");
		}
		else{
       out.print("<script>alert('You entered wrong pin.')</script>");
			}
		}
		}
		catch(Exception e){}
		%>
		
	<div id="div" style="border:1px solid black; width:350px; text-align:left; margin-top:-315px; margin-left:30px;opacity:10; background:url(images/business_banking_background_large_hero.jpg); border-radius:10px; box-shadow:1px 2px 5px 5px black">
	<form action="" name="ch_pin" method="post">
	<table border="0" style="width:100%;background-color:blue;color:white">
	<tr>
	<td>&nbsp;</td>
	<td>Old Pin</td>
	<td>New Pin</td>
	<td rowspan="2" valign="top"><input type="submit" name="pass_sub" value="Confirm" style="height:50px;cursor:pointer;"> </td>
	<td rowspan="2" valign="top"><a href="#" style="color:#FFFFFF" id="close">x</a></td>
	</tr>
	<tr>
	<td>&nbsp;</td>
	<td><input type="password" required="required" maxlength="4" style="width:80px" name="pass1"></td>
	<td><input type="password" required="required" maxlength="4" style="width:80px" name="pass2"></td>
	</tr>
	</table>
	</form>
	</div>				
<script type="text/javascript">
	$(document).ready(function(){
	$("#div").hide();
		$("#sub").click(function(){
			$("#div").slideToggle();
		});
	$("#close").click(function(){
	  $("#div").slideToggle();
	});
	});
	</script>
		
    </body>
</html>
