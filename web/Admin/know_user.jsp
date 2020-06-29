<%-- 
    Document   : Welcome
    Author     : Jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,db.Connect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hidden Information</title>
    </head>
    <body>
      <form method="post" name="know_user">
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
            <table width="60%"><tr><td>
			  Enter Account Number: </td><td>
		<input type="number" name="knw_acno" required="required"/></td></tr>
		<tr><td>    Enter employee password: </td>
<td>		<input type="password" name="knw_pass" required=""/></td></tr>
<tr><Td align="center" colspan="2"><input type="submit" name="knw_btn" value="Submit"/></Td></tr></table>
<%
 if(request.getParameter("knw_btn")!=null){
 String knw_pass=request.getParameter("knw_pass");
 String knw_pass1="";
 try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
  PreparedStatement stmt=con.prepareStatement("select *from admin where username=?");
  stmt.setString(1,sesvalue);
  ResultSet knw_rs=stmt.executeQuery();
  if(knw_rs.next()){
   knw_pass1=knw_rs.getString("password");
  }
  if(knw_pass.equals(knw_pass1)){
   PreparedStatement stmt1=con.prepareStatement("select cust_username from accounts where accno=?");
  stmt1.setInt(1,Integer.parseInt(request.getParameter("knw_acno")));
  ResultSet knw_rs1=stmt1.executeQuery();
  if(knw_rs1.next()){
   out.println("<h2>A/c No. "+request.getParameter("knw_acno")+"</h2>");
   out.print("<h2>UserName: "+knw_rs1.getInt("cust_username")+"</h2>");
  }
  else{
   out.print("<h3 style='color:red'>User Does Not Exist!</h2>");
  }
  }
  else{
   out.print("<strong style='font-size:18px;color:red'>Verification Failed !</strong>");
  }
  }
  catch(ClassNotFoundException e){
   out.print(e);
  }
  catch(SQLException e){
   out.print(e);
  }
  catch(Exception e){
   out.print(e);
  }
 }
%>
			
								 </td>
              </tr>
  </table>
                                </td>
							
              </tr></table></form>
</div>
</body>
</html>