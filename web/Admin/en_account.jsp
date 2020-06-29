<%-- 
    Document   : en_loan
    Created on : May 3, 2015, 8:43:23 AM
    Author     : SATYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,db.Connect"%>
<!DOCTYPE html>
<html>
    <head>
	<style>
	
	</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Loan Link</title>
				<link href="style.css" type="text/css" rel="stylesheet">
    </head>
    <body class="loan">
       <table width="100%" cellpadding="0" cellspacing="0" align="center" border="0" style="text-align:center;">
	   <tr style="background-color:#0099FF; font-size:20px;">
	   <td class="color1">Date</td>
	   <td class="color2">Name</td>
	   <td class="color1">Mobile</td>
	   <td class="color2">Email</td>
	   <td class="color1">City</td>
	   <td class="color2">Category</td>
	   <td class="color1">Emp_Type</td>
	   <td class="color2">Other</td>
	   </tr>
	   <tr><td colspan="10" style="background-color:#666666;"><hr style="border:none;"/></td></tr>
	   	<%
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con	=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
				Statement stmt	=con.createStatement();
				ResultSet Loan_rs=stmt.executeQuery("select * from en_account");
				while(Loan_rs.next())
				{%>
			<tr>
	   			<td class="color1"><%=Loan_rs.getString("date")%></td>
	   			<td class="color2"><%=Loan_rs.getString("name")%></td>
				<td class="color1"><%=Loan_rs.getString("mobile")%></td>
				<td class="color2"><%=Loan_rs.getString("email")%></td>
				<td class="color1"><%=Loan_rs.getString("city")%></td>

				<td class="color2"><%=Loan_rs.getString("category")%></td>
				
	   			<td class="color1"><%=Loan_rs.getString("emp_type")%></td>
	   			<td class="color2"><%=Loan_rs.getString("other")%></td>
	   		</tr>
	   
				
				<%}
			}
			catch(Exception ex){}
		%>
    </table>
    </body>
</html>
