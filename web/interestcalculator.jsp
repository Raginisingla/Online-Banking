<%-- 
    Document   : interestcalculator
    Created on : 3 Oct, 2017, 4:44:11 PM
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
        <div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    
    <tr>
      <td valign="top">
	  <%@ include file="top.jsp" %>
	  </td>
    </tr>
    <tr>
     <td>
         <table width="700" border="0" cellspacing="13" cellpadding="0" align="center">
            
             <td align:center>  <h1>Interest Calculator</h1></td>
               <tr>
    <td>Enter Principle Amount </td>
    <td><input type="text" name="cal_amount"/></td>
  </tr>
  <tr>
    <td>Duration</td>
    <td><input type="text" name="cal_duration" /></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
        <input type="button" value="Check" onClick></td>
    </tr>
  <tr>
    <td>Total Amount You owns: </td>
    <td><p style="color:blue;font-size:x-large"></p></td>
  </tr>
</table>

	 </td>
    </tr>
	 <tr>
      <td><%@ include file="footer.html" %></td>
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
</html>
