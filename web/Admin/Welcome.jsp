<%-- 
    Document   : Welcome
    Author     : jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome <%=session.getAttribute("admin_login").toString()%></title>
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
                <td style="width:30%">
				<%@include file="sidebanner.html" %>
				</td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table>
    </body>
</html>
