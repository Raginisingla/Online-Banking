<%-- 
    Document   : welcome
    Created on : Apr 17, 2015, 10:41:13 AM
    Author     : SATYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" type="text/css" rel="stylesheet"/>
        <title>Welcome to Online Banking System</title>
    </head>
    <body class="account">
       
		<table border="0" cellspacing="0" cellpadding="0" style="width: 100%">   
     <tr>
                        <td colspan="2"><%@include file="wel_header.html"%></td>
                    </tr>
		    <tr>
    <td colspan="2"><%@include file="ses.jsp"%></td>
    </tr>
    <tr>
      <td colspan="2"><%@ include file="wel_menu.html"%></td>
    </tr>
	
    <tr>
    <td width="20%" valign="top"><%@include file="leftslider.html" %></td>
   
	<!-- links of welcome page-->
	
    <td width="70%" valign="top">
	<%
	ResultSet wel_rs=null;
	 try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql:///online_banking","root","");
	  PreparedStatement pstmt=con.prepareStatement("select *from accounts where accno=?");
	  pstmt.setLong(1,acno);
	  wel_rs=pstmt.executeQuery();
	  wel_rs.next();
	 }
	 catch(Exception e){out.print(e); }
	%>
	<table width="60%" cellspacing="0" cellpadding="10" style="background-color:#F1E2E2;margin:30px 0px 0px 50px" border="1" bordercolor="#D5D5FF">
      <tr>
        <td>Name</td>
        <td><%=wel_rs.getString("fname")%> <%=wel_rs.getString("lname")%></td>
      </tr>
      <tr>
        <td>FatherName</td>
        <td><%=wel_rs.getString("fathername")%></td>
      </tr>
      <tr>
        <td>Email</td>
        <td><%=wel_rs.getString("email")%></td>
      </tr>
      <tr>
        <td>Contact</td>
        <td><%=wel_rs.getString("contact")%></td>
      </tr>
      <tr>
        <td>DOB</td>
        <td><%=wel_rs.getString("dob")%></td>
      </tr>
      <tr>
        <td>Address</td>
        <td><%=wel_rs.getString("preadd")%> <%=wel_rs.getString("city")%> <%=wel_rs.getString("state")%></td>
      </tr>
      <tr>
        <td>Account type </td>
        <td><%=wel_rs.getString("actype")%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  </tr>
</table>
		
		
		
    </body>
</html>
