<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complete Open Account Process</title>
    </head>
    <body>
        
	<table width="1000" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td>
			<%@include file="header.html" %>
			</td>
          </tr>
		  <tr><Td>
		 <%@ include file="ses.jsp" %> 
		  </Td></tr>
   <tr>
            <td>
			<table width="1000" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="width:30%" valign="top">
				<%@include file="sidebanner.html" %>
				</td>
                    <td>				
                <%
      String qryid=request.getParameter("cust_id");
      //out.print(qryemail);
      %>
      <%!long newacno=0;%>
      <% Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_banking","root","");
     if(request.getParameter("ac_submit")!=null){
	 out.print("open account");
     String per_add=request.getParameter("per_add");
     String pre_add=request.getParameter("pre_add");
     String state=request.getParameter("state");
     String city=request.getParameter("city");
     String actype=request.getParameter("acc_type");
     //int balance=Integer.parseInt(request.getParameter("ini_amt"));
     String nominee=request.getParameter("nom_name");
     String pic_name=request.getParameter("pic_name");
     //MultipartRequest mr=new MultipartRequest(request, "upload");
     try{     
     PreparedStatement pstmt=con.prepareStatement("select accno from accounts where cust_id=?");
	 pstmt.setInt(1,Integer.parseInt(qryid));
     ResultSet new_rs=pstmt.executeQuery();
     if(new_rs.next()){
     newacno=new_rs.getLong("accno");
     }
     pstmt.close();
     PreparedStatement pstmt1=con.prepareStatement("update accounts set peradd=?,preadd=?,state=?,city=?,actype=?,balance=?,nominee=?,creationdate=curdate(),pic=? where accno=?");
     pstmt1.setString(1,per_add); pstmt1.setString(2, pre_add); pstmt1.setString(3,state); pstmt1.setString(4,city); pstmt1.setString(5,actype);pstmt1.setDouble(6,0.00); pstmt1.setString(7,nominee); pstmt1.setString(8,pic_name); pstmt1.setLong(9,newacno);
     pstmt1.executeUpdate();
     pstmt1.close();
     Statement stmt1=con.createStatement();
     stmt1.executeUpdate("insert into account_docs(`accno`) values('"+newacno+"')");
     stmt1.executeUpdate("insert into account_info(`accno`) values('"+newacno+"')");
     out.print("<script>alert('account created succesfully!')</script>");
     response.sendRedirect("CheckDetails.jsp?ch_acno="+newacno);
     }
     catch(SQLException e){ out.print(e); }
     catch(Exception e){ out.print(e); } 
    }
   %>             
   <form method="post" action=""><br>
     <table width="60%" cellpadding="4" cellspacing="10" border="0" class="total_cls" style="border:1px groove black; border-radius:15px;">
					<caption><h2>Second Page Opening New Account</h2></caption>
					<tr>
					<td>Permanent Address</td>
					<td><textarea name="per_add" required="required"></textarea></td>
					</tr>
					<tr>
					<td>Present Address</td>
					<td><textarea name="pre_add" required="required"></textarea></td>
					</tr>
					<tr>
					<td>State</td>
					<td><select name="state" required="required">
					<option>Punjab</option></select></td>
					</tr>
					<tr>
					<td>City</td>
					<td><input type="text" name="city" required="required" list="dlcity"/>
					<datalist id="dlcity">
					<%
					 Statement stmt_city=con.createStatement();
					 ResultSet rs_city=stmt_city.executeQuery("select *from cities");
					 while(rs_city.next()){
					%>
					<option><%=rs_city.getString("name")%></option> <% } %>
					</datalist>
					</td>
					</tr>
					<tr>
					<td>Account Type</td>
					<td><select name="acc_type" required="required">
					<option>Saving</option>
					<option>Current</option></select>
					</td>
					</tr>
					<tr>
					<td>Initial Account Amount</td>
					<td><input type="text" name="ini_amnt" required="required"></td>
					</tr>
					<tr>
					<td>Nominee</td>
					<td><input type="text" name="nom_name" required="required"></td>
					</tr>
					<tr>
					<td>Image</td>
					<td><input type="file" name="pic_name" required="required"/></td>
					</tr>
					<tr><td></td>
					<td><input type="submit" value="Submit" name="ac_submit">
					<input type="reset" value="clear" name="clear"></td>
					</tr>
					</table>
				</form>
				</td>
            </tr>
			
        </table>
      </td></tr></table>
    </body>
    
</html>
