<%-- 
    Document   : adhaar_reg
    Created on : 12 Oct, 2017, 5:09:22 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="0" cellspacing="0" cellpadding="0" style="width: 100%">   
     <tr>
                        <td colspan="2"><%@include file="wel_header.html"%></td>
                    </tr>
					  
	<tr>
      <td colspan="2"><%@ include file="wel_menu.html"%></td>
	</tr>
	
  <tr>
    <td width="20%" valign="top"><%@include file="leftslider.html" %></td>
      <td width="70%" valign="top">
	<form name="adhaar_reg" method="post">
	<table width="60%" cellspacing="0" cellpadding="10" style="background-color:#F1E2E2;margin:30px 0px 0px 50px" border="1" bordercolor="#D5D5FF">
      <caption><h3>Register Your Adhaar</h3></caption>
	  <tr>
        <td>Your Account Number </td>
        <td><%=acno%></td>
      </tr>
      <tr>
        <td>Enter Your adhaar No </td>
        <td><input type="text" style="width:150px" placeholder="12 digit adhaar number" required="required" name="adhaar_no"/></td>
      </tr>
      <tr>
        <td colspan="2" align="center"><input type="submit" name="adhaar_btn" value="Submit" style="cursor:pointer;border:0px;width:90px;height:25px;background-color:#CC33CC;color:#CCFFFF;border-radius:10px"/> </td>
      </tr>
    </table>
	</form>
		</td>
  </tr>
  <tr>
  
  </tr>
</table>
		
		
	
    </body>
</html>
