<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,db.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome <%=session.getAttribute("admin_login").toString()%></title>
<style type="text/css">
 .class1{background-color:#FFE6F2;font-size:20px;color:#000033;width:23%;}
 .class2{background-color:#0066FF;font-size:20px;color:#FFFFFF;width:23%;}
</style>
<script language="javascript" src="jquery.js"></script>
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
                <td style="padding-left:30px;padding-top:15px" valign="top">
				<form name="start_insurance" action="" method="post">
				<div id="ch_div" align="center">
				 Insurance No 
				   <input type="text" name="insu_number" required="required" placeholder="ins no"/>
				<input type="submit" style="color:#FFFFFF;background-color:#000099;border:none;height:23px;width:90px" value="Check>>" name="check_btn"/>
				</div>
				</form>
		<%if(request.getParameter("check_btn")!=null){
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
		 PreparedStatement pst=con.prepareStatement("select *from insurance where ins_no=?");
		 pst.setLong(1,Long.parseLong(request.getParameter("insu_number")));
		 ResultSet rs=pst.executeQuery();
		 if(rs.next()){ %>
		 <script>
		  document.getElementById("ch_div").style.visibility="hidden";
		 </script>
				 <table width="92%" border="1" cellspacing="0" cellpadding="10"bordercolor="#C6C6FF">
				 <caption>
<a href="check_insurance.jsp" style="text-align:center;color:#FF0000"> << Back</a>
				 <h2>Insurance Details </h2>
				 </caption>
		<tr>
    <td class="class1">Ins. no </td>
    <td class="class1">Ins ID </td>
    <td class="class1">Name</td> 
    <td class="class1">Address</td>
  </tr>
		<tr>
		  <td class="class2"><%=rs.getLong("ins_no")%></td>
		  <td class="class2"><%=rs.getInt("ins_id")%></td>
		  <td class="class2"><%=rs.getString("name")%></td>
		  <td class="class2"><%=rs.getString("address")%></td>
		  </tr>
		<tr>
		  <td class="class1">Date Of Birth </td>
		  <td class="class1">Email</td>
		  <td class="class1">Contact</td>
		  <td class="class1">Duration</td>
		  </tr>
		<tr>
		  <td class="class2"><%=rs.getString("dob")%></td>
		  <td class="class2"><%=rs.getString("email")%></td>
		  <td class="class2"><%=rs.getLong("contact")%></td>
		  <td class="class2"><%=rs.getInt("duration")%> Yr.</td>
		  </tr>
		<tr>
		  <td class="class1">EMI</td>
		  <td class="class1">Premium months </td>
		  <td class="class1">Total Premium </td>
		  <td class="class1">End Date </td>
		  </tr>
		<tr>
		  <td class="class2"><%=rs.getDouble("emi")%> INR</td>
		  <td class="class2"><%=rs.getString("payble_premium")%></td>
		  <td class="class2"><%=rs.getDouble("total_premium")%> INR</td>
		  <td class="class2"><%=rs.getString("end_date")%></td>
		  </tr>
		<tr>
		  <td class="class1">Premium time </td>
		  <td class="class1">Total Paid </td>
		  <td class="class1">Start Date </td>
		  <td class="class1">&nbsp;</td>
		  </tr>
		<tr>
		  <td class="class2">Every <%=rs.getInt("pre_time")%> months </td>
		  <td class="class2"><%=rs.getDouble("total_paid")%> INR</td>
		  <td class="class2"><%=rs.getString("start_date")%></td>
		  <td class="class2">&nbsp;</td>
		  </tr>
  <tr>
</table><%}
else{ %>
 <h2>Insurance not registered!</h2>
<% }
		}%>
	
				</td>
              </tr>
            </table></td>
          </tr>
        </table>
    </body>
</html>
