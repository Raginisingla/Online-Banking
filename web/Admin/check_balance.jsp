<%-- 
    Document   : Welcome
    Author     : jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,db.CheckBalance"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check user balance</title>
    </head>
    <body>
      
	<table width="1000" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td>
			<%@include file="header.html" %>
			</td>
          </tr>
		  <tr><Td>
		  <%@include file="ses.jsp"%>
		  </Td></tr>
          <tr>
            <td><table width="1000" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="width:30%" valign="top">
				<%@include file="sidebanner.html" %>
				</td>
                                <td valign="top" align="center"><br><br>
				<form method="post" action="">
				<table width="50%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td align="center">
	<h2>Check Available Balance</h2>	</td>
    </tr>
  <tr>
    <td>
        A/c No. <input type="number" name="chbal_acno" required="required"> <input type="submit" value="Submit" name="chbal_btn">
        <br>
        <br>
       <%
       if(request.getParameter("chbal_acno")!=null){
       if(CheckBalance.getBalance(Integer.parseInt(request.getParameter("chbal_acno")))==-1){
           %>
           <h2 style="color:red">Account Not Found!</h2>    
           <%
}
       else{
       %>
       <h2 style="color:blue">A/c No. : <%=request.getParameter("chbal_acno")%></h2>
       <h2 style="color:blue">Balance: <span style="color:blueviolet"> <%=CheckBalance.getBalance(Integer.parseInt(request.getParameter("chbal_acno")))%></span></h2>
       <% }
       }
       %>
	</td>
    </tr>
</table>

				</form>
				</td>
              </tr>
            </table></td>
          </tr>
        </table>
    </body>
</html>
