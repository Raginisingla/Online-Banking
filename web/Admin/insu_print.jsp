<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,db.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome <%=session.getAttribute("admin_login").toString()%></title>
<script language="javascript" src="jquery.js"></script>
    </head>
    <body>
      <%
	  int ins_id=Integer.parseInt(request.getParameter("insid"));
	  Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
	   PreparedStatement pst=con.prepareStatement("select *from insurance where ins_id='"+ins_id+"'");
	   ResultSet rs=pst.executeQuery();
	   rs.next();
	  %>
	<table width="1000" border="0" cellspacing="0" cellpadding="0" align="center">
         <tr><Td >
		  <%@include file="ses.jsp"%>
		  </Td></tr>
          <tr>
            <td align="center">
			<table width="70%" border="0" cellspacing="0" cellpadding="0">
              <td style="padding-left:30px;padding-top:15px" valign="top">
				<form name="start_insurance1" action="" method="post">
				 <table width="80%" border="1" cellspacing="0" cellpadding="10" style="background-color:#FFE6F2"  bordercolor="#C6C6FF">
				 <caption>
				 <h2>Insurance Details </h2>
				 </caption>
  <tr>
    <td>ID</td>
    <td><%=rs.getInt("ins_id")%></td>
  </tr>
  <tr>
    <td>Insurance No </td>
    <td><%=rs.getLong("ins_no")%></td>
  </tr>
  <tr>
    <td>Bank A\c No </td>
    <td><%=rs.getLong("accno")%></td>
  </tr>
  <tr>
    <td>Name</td>
    <td><%=rs.getString("name")%></td>
  </tr>
  <tr>
    <td>Address</td>
    <td><%=rs.getString("address")%></td>
  </tr>
  <tr>
    <td>Date of Birth </td>
    <td><%=rs.getString("dob")%></td>
  </tr>
  <tr>
    <td>Email</td>
    <td><%=rs.getString("email")%></td>
  </tr>
  <tr>
    <td>Contact</td>
    <td><%=rs.getLong("contact")%></td>
  </tr>
  <tr>
    <td>Duration of Insurance </td>
    <td><%=rs.getInt("duration")%> Years </td>
  </tr>
  <tr>
    <td>Premium amount </td>
    <td><%=rs.getDouble("emi")%> INR </td>
  </tr>
  <tr>
    <td>Next EMI month </td>
    <td><%=rs.getString("next_emi")%></td>
  </tr>
  <tr>
    <td>Total premium </td>
    <td><%=rs.getDouble("total_premium")%> INR </td>
  </tr>
  <tr>
    <td>End Date </td>
    <td><%=rs.getString("end_date")%></td>
  </tr>
  <tr>
    <td>Start Date </td>
    <td><%=rs.getString("start_date")%></td>
  </tr>
  <tr>
    <td>Premium months </td>
    <td><%=rs.getString("payble_premium")%></td>
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
