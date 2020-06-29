<%-- 
    Document   : Welcome
    Author     : jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Details</title>
    </head>
    <body>
     <form name="" action="">
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
                <td align="center">
				  <table width="600" border="0" cellspacing="10" cellpadding="0">
                    <tr>
                      <td style="font-size:x-large">Enter Account No. 
                          <input type="number" required="required" value="" name="ch_acno" style="width:200px;height:20px"/>
					  <input type="submit" value="Submit" name="ch_sbmt" style="width:80px;height:30px"/></td>
                      <% 
                      if(request.getParameter("ch_sbmt")!=null){
                      response.sendRedirect("CheckDetails.jsp?ch_acno="+request.getParameter("ch_acno"));
                      }
                      %>
                    </tr>
                  </table>				</td>
              </tr>
            </table></td>
          </tr>
        </table>
		</form>
    </body>
</html>
