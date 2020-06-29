<%-- 
    Document   : link_update
     Author     : Jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, db.Connect" %>

<!DOCTYPE html>
<html>
    <head>
	<style>
	.update_tab td
	{
	text-align:center;
	height:50px;
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:20px;
	
	text-align:center;
	}
	.update_tab td a
	{
	text-decoration:none;
	}
	
	</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="style.css" type="text/css" rel="stylesheet">
        <script src="jquery.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(document).ready(function()
		{
			$("#acc").click(function(){
				$("#frm1").css("background-color","#6699CC");
				$("#card").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#loan").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#ins").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#acc").css({"background-color":"#6699CC","border":"2px solid", "border-bottom-style":"none"});
			});
			$("#card").click(function(){
				$("#acc").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#ins").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#loan").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#frm1").css("background-color","#6699CC");
				$("#card").css({"background-color":"#6699CC","border":"2px solid", "border-bottom-style":"none"});
			});
			$("#ins").click(function(){
				$("#acc").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#card").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#loan").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#frm1").css("background-color","#6699CC");
				$("#ins").css({"background-color":"#6699CC","border":"2px solid", "border-bottom-style":"none"});
			});
			$("#loan").click(function(){
				$("#acc").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#card").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#ins").css({"background-color":"#CCCCCC","border":"0px solid"});
				$("#frm1").css("background-color","#6699CC");
				$("#loan").css({"background-color":"#6699CC","border":"2px solid", "border-bottom-style":"none"});
			});
		});
		</script>
		<title>link update page</title>
    </head>
    <body class="loan card acc ins">
      <table width="1000" cellpadding="0" cellspacing="0" border="0" align="center">
	  <tr>
	  <td><%@ include file="header.html"%></td>
	  </tr>
	  <tr>
	  <td><%@ include file="ses.jsp"%></td>
	  </tr>
	  <td>
	  		<table width="1000" cellpadding="0" cellspacing="0" align="center">
			<tr>
			<td width="20%" valign="top"><%@ include file="sidebanner.html"%></td>
			<td valign="top" align="center" width="80%" bgcolor="#999999" style="font-size:20px;">
			<p style="font-family:Aharoni; color:white;">Update Your Link Here</p>
					<table width="100%" cellpadding="0" cellspacing="0" align="center" border="0" class="update_tab">
					<tr style="background-color:#CCCCCC;">
					<td class="acc" id="acc"><a href="en_account.jsp" target="frm" >New Account</a></td>
					<td class="card" id="card"><a href="en_card.jsp" target="frm">New Card</a></td>
					<td class="ins" id="ins"><a href="en_insurance.jsp" target="frm">New Insurance</a></td>
					<td class="loan" id="loan"><a href="en_loan.jsp" target="frm">New Loan</a></td>
					</tr>
					<tr>
					<td colspan="4" id="frm1" background="images/car.png" bgcolor="#6699CC">
					<iframe name="frm" width="100%" height="340px" style="border:none;"></iframe></td>
					</tr>
					</table>
			</td>
			</tr>
			</table>
	  </td>
	  </table>
    </body>
</html>
