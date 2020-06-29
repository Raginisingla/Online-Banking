<%-- 
    Document   : Welcome
    Created on : Mar 28, 2015, 9:54:07 PM
    Author     : BIRENDER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,db.Connect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Print Statement</title>
		<style type="text/css">
		.print_table th{
		width:15%;
		}
		.print_table1 td{
		width:15%;
		}
		</style>
    </head>
    <body>
           
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
                                <td valign="top" align="center"><br>
      <table width="90%" border="0" cellspacing="0" cellpadding="10" style="border-color:#EBEBEB;" class="print_table">
       <tr>
       <td colspan="5" align="center">
         A/c No. : <%=request.getParameter("st_acno")%></td>
                </tr>
                <tr>
                    <th>Date</th><th>Description</th><th>Deposit</th><th>Withdraw</th><th>total</th>
                </tr>
				</table>
                                    <div id="st_table" style="margin-top:-1px">
 <table width="90%" border="0" cellspacing="0" cellpadding="10" style="border-color:#EBEBEB" class="print_table1">              
                                    <%
int st_acno=Integer.parseInt(request.getParameter("st_acno"));
String st_startdate=request.getParameter("st_startdate");
String st_enddate=request.getParameter("st_enddate");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
Statement stmt=con.createStatement();
ResultSet st_rs=stmt.executeQuery("select *from transactions where accno='"+st_acno+"' and date between '"+st_startdate+"' and '"+st_enddate+"'");
while(st_rs.next()){
 %>
  <tr>
            <td><%=st_rs.getString("date")%></td>
            <td><%=st_rs.getString("description")%></td>
            <td><%=st_rs.getDouble("deposit")%> Cr.</td>
            <td><%=st_rs.getDouble("withdraw")%> Dr.</td>
            <td><%=st_rs.getDouble("total")%> Cr</td>
            </tr>
 <%
}
}
catch(ClassNotFoundException e){ out.print(e);}
catch(SQLException e){ out.print(e); }
catch(Exception e){ out.print(e); }
%>
       </div>
                                
                                <script>
                                    function callPrint(strid){
                                        var ptrcontent=document.getElementById(strid);
                                        var winprint=window.open('','',"left=0,top=0,width=700,height=600,toolbar=0,scrollbar=0,status=0");
                                        winprint.document.write(ptrcontent.innerHTML);
                                        winprint.document.close();
                                        winprint.focus();
                                        winprint.print();
                                        winprint.close();
                                    }
                                </script>
                                   
 </table> </div>
                                <p><a href="#" onClick="callPrint('st_table')">Print</a> </p></td></tr>
  </table>
                                </td>
							
              </tr></table>

</div>
</body>
</html>