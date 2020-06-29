<%-- 
    Document   : Welcome
    Author     : Jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Connect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=request.getParameter("ch_acno").toString()%> Account Details</title>
        <link href="style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
      
	<table width="1000" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td>
			<%@include file="header.html" %>
			</td>
          </tr>
		  <tr><td>
		  <%@include file="ses.jsp"%>
		  </td></tr>
          <tr>
              <td><table width="1000" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="width:30%" valign="top">
				<%@include file="sidebanner.html" %>
				</td>
                <td style="padding-left:20px"><br>
				<%
                                int ch_acno=Integer.parseInt(request.getParameter("ch_acno"));
                                try{				
				Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
                                Statement stmt=con.createStatement();
                                String ch_query="select *from accounts where accno='"+ch_acno+"'";
                                ResultSet ch_rs=stmt.executeQuery(ch_query);
                                if(ch_rs.next()){ %>
                                <table width="600" cellspacing="10" cellpadding="0" class="check_balance" style="border:1px groove;border-radius:15px">
  <caption><h3>
  Account No : <span style="color:#FF00FF">
  <%=ch_acno%></span>
  </h3></caption>
  <tr>
      <td><strong>Customer ID</strong></td>
      <td><%=ch_rs.getInt("cust_id")%></td>
  </tr>
  <tr>
    <td><strong>
            
            Name</strong></td>
    <td><%=ch_rs.getString("fname")%> <%=ch_rs.getString("lname")%></td>
    
  </tr>
  <tr>
    <td><strong>Father/Husband Name </strong></td>
    <td><%=ch_rs.getString("fathername")%></td>
    </tr>
  <tr>
    <td><strong>Email</strong></td>
    <td><%=ch_rs.getString("email")%></td>
    </tr>
  <tr>
    <td><strong>Date of birth </strong></td>
    <td><%=ch_rs.getString("dob")%></td>
    </tr>
  <tr>
    <td><strong>Gender</strong></td>
    <td><%=ch_rs.getString("gender")%></td>
    </tr>
  <tr>
    <td><strong>Permanent Address </strong></td>
    <td><%=ch_rs.getString("peradd")%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Present Address </strong></td>
    <td><%=ch_rs.getString("preadd")%> <%=ch_rs.getString("city")%> <%=ch_rs.getString("state")%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Account Type</strong></td>
    <td><%=ch_rs.getString("actype")%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Balance</strong></td>
    <td><%=ch_rs.getString("balance")%></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Date of Account open </strong></td>
    <td><%=ch_rs.getString("creationdate")%></td>
    <td>&nbsp;</td>
  </tr>
</table>
                                <% }
                                else{ 
                                 %>
                                <h1 style="color:red">Account Not Found! Please
                                    <a href="checkdetails1.jsp"> Go back</a>.</h1>
                                <% }
                                }
                                catch(ClassNotFoundException e){ out.print(e);  }
                                catch(SQLException e){ out.print(e); }
                                catch(Exception e){out.print(e);}
				%>
				

				</td>
              </tr>
            </table></td>
          </tr>
        </table>
    </body>
</html>
