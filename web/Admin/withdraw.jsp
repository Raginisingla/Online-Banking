<%-- 
    Document   : Welcome
     Author     : jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,db.Connect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdraw</title>
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
                                <td valign="top">
<form action="" name="show_dep" method="post"> 
                    <table width="74%" border="0" cellspacing="10" cellpadding="0" align="left" style="border:groove 1px;border-radius:15px">
                        <caption>
                        <h2>Withdraw Form</h2>
                        </caption>
						<tr><td colspan="2"> <%
Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
						 try{  
   if(request.getParameter("dep_submit")!=null){
      String desc=null;
    if(request.getParameter("dep_desc").equals("Cheque")){
	 	if(request.getParameter("dep_chno").length()<1 || request.getParameter("dep_chno").equals(null)){
		   throw new Exception(); //throws exception if cheque no does not entered
		}	 
                else{
                desc="By Cheque "+request.getParameter("dep_chno");					
                }	 
		}
    else{
     desc="By Cash";
    }
	if(request.getParameter("dep_amount").length()<3 || request.getParameter("dep_amount").equals(null)){
       out.print("<h2 style='color:red'>Please fill valid amount.</h2>");
     } 
     else{
        Double amount=Double.parseDouble(request.getParameter("dep_amount")); 
        if(amount>dep_balance){
		 out.print("<h3 style='color:red'>Insufficient Funds!.</h3>");
		}
		else{
		Statement stmt1=con.createStatement();
        dep_balance=dep_balance-amount;
        String query="update accounts set balance='"+dep_balance+"' where accno='"+dep_acno1+"'";
        stmt1.executeUpdate(query);
        stmt1.close();        
        Statement stmt2=con.createStatement();
        stmt2.executeUpdate("insert into transactions(`accno`,`date`,`time`,`description`,`withdraw`,`total`) values('"+dep_acno1+"',curdate(),curtime(),'"+desc+"','"+amount+"','"+dep_balance+"')");
        stmt2.close();
     }}
}}
catch(NumberFormatException e){
 out.print("<script>alert('Invalid Amount Value!')</script>");
}
catch(Exception e){
 out.print("<b style='color:red'>Cheque Number???</b>");
}
if(request.getParameter("dep_cncl")!=null){
 response.sendRedirect("withdraw.jsp"); 
} %>
						</td></tr>
               <tr>
    <td>Acc_no</td>
    <%!int dep_acno1;
    double dep_balance;%>
    <td><input type="text" name="dep_accno" value="" required="required">
	<input name="dep_chbtn" type="submit" id="dep_chbtn" value="submit"></td>
  </tr></table></form><br>
  <form name="dep_deposit" method="post" action="">
<%
  
 if(request.getParameter("dep_chbtn")!=null){
  int dep_acno=Integer.parseInt(request.getParameter("dep_accno"));
  try{
  Statement stmt=con.createStatement();
  ResultSet dep_rs=stmt.executeQuery("select *from accounts where accno='"+dep_acno+"'");  
  if(dep_rs.next()){
      dep_acno1=dep_rs.getInt("accno");
      dep_balance=dep_rs.getDouble("balance");
  %><br>
  <table style="width:74%;border:1px groove;border-radius:15px">
  <tr>
  <td>First Holder Name</td>
    <td><input type="text" name="dep_fholder" value="<%=dep_rs.getString("fname")%>" readonly="true" id="first_name"></td>
	
    <td>Customer id</td>
    <td><input type="text" name="dep_cid" value="<%=dep_rs.getString("cust_id")%>" id="customer_id" readonly="true"></td>

  </tr>

  <tr>
    <td>Second Holder Name </td>
    <td><input name="dep_sholder" value="<%=dep_rs.getString("lname")%>" readonly="true" type="text" id="dep_sholder"></td>
  </tr>
  <tr>
    <td>Current Balance </td>
    <td><input name="dep_balance" value="<%=dep_rs.getString("balance")%>" type="text" id="dep_balance" readonly="true"></td>
  </tr>

  <tr>
    <td>Deposit Amount</td>
    <td><input name="dep_amount" type="text" id="dep_amount"></td>
  </tr>
<tr><td>Description</td>
<td>
<select name="dep_desc">
<option value="Cash">Cash</option>
<option value="Cheque">Cheque</option>
</select>
</td>
</tr>
   <tr>
    <td>Cheque.No(if Cheque)</td>
    <td><input name="dep_chno" type="text" id="dep_chno"></td>
  </tr>


  <tr>
      <td colspan="2" align="center"><input type="submit" name="dep_submit" value="Deposit"> 
          <input name="dep_cncl" type="submit" id="dep_cncl" value="Cancel"></td>
  </tr><tr>
  <td align="center" colspan="4">
    <script>document.getElementById("dep_chbtn"). disabled="true";</script>
    <% stmt.close();
  }
  else
  { %>
  <h2 style="color:red">Account is Invalid.</h2>
  <script>//document.getElementById("dep_chbtn"). disabled="false";</script>
  <%          
  }
  }
   catch(NumberFormatException e){out.print("<script>alert('Invalid Amount Value!')</script>"); }
   catch(SQLException e){ out.print(e); }
   catch(Exception e){ out.print(e); }
 } 
    %>
		  <strong style="color:green"> 
      <%
  if(dep_acno1!=0){
      %>
   Total Balance for A/c No <%=dep_acno1%> : <%=dep_balance%> INR
   <% } %> </strong>
   </td>
    </tr>
	  </table> 
 </form></td></tr>
  </table>
                                </td>
								 
              </tr></table>

</div>
</body>
</html>