<%@page import="java.sql.*" %>
<%
    String ses_name=null;
	 long acno=0;
	 double user_balance=0.0;
   int ses_value=Integer.parseInt(session.getAttribute("user_login").toString());
 try{
 Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql:///bank","root","");
 PreparedStatement ses_stmt=con.prepareStatement("select fname,lname,accno,balance from accounts where cust_username=?");
            ses_stmt.setInt(1, ses_value);
            ResultSet ses_rs=ses_stmt.executeQuery();
            if(ses_rs.next()){
			acno=ses_rs.getLong("accno");
			user_balance=ses_rs.getDouble("balance");
		ses_name=ses_rs.getString("fname")+" "+ses_rs.getString("lname");
       }
	   }
 catch(Exception e){ out.print(e);}
%>
<table style="width:100%;background-color:#CCFFFF;color:#0000CC">
<tr><td style="width:50%;font-size: 20px">
<strong> Welcome <span style="color:#FF00FF"><%=ses_name%></span> </h3>
</td>
<td style="width:50%" align="right">
<form name="logout" method="post" action="logout">
<input type="submit" style="" name="logout" value="LogOut"/></form>
</td>
</tr>
</table>