<%-- 
    Document   : Welcome
    Author     : Jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statement</title>
    </head>
    <body onload="printDate()">
           
	<table style="background-color: #E1EEFE" width="1000" border="0" cellspacing="0" cellpadding="0" align="center">
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
                                <td valign="top" align="center">
								<br>
								<h2>Transaction Statement</h2>
<form action="print_statement.jsp" name="show_dep" method="post"> 
  <table style="width:80%;border-color:#EBEBEB" cellspacing="0" cellpadding="10" border="1">
  <tr><td align="center" colspan="2">
  A/c No :<input type="number" required="required" name="st_acno">
  </td></tr>
  <tr><td>Date : from<input type="text" name="st_startdate" required="required" placeholder="YY/MM/DD"/>
      </td><td>to 
  <script language="javascript">
      function printDate(){
  var a=new Date();
  var date=a.getFullYear()+"/"+(a.getMonth()+1)+"/"+a.getDate();
  var enddate=document.getElementById("st_enddate");
  enddate.value=date;
      }
  </script>
  <input type="text" name="st_enddate" required="required" id="st_enddate"  placeholder="YY/MM/DD" readonly="false"/>
  </td></tr>
  <td align="center" colspan="2">
  <input type="submit" value="Print Mini Statement>>"/>
  </table>
 </form></td></tr>
  </table>
                                </td>
							
              </tr></table>

</div>
</body>
</html>