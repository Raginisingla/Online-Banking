<%-- 
    Document   : Welcome
    Author     : jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome <%=session.getAttribute("admin_login").toString()%></title>
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
                <td align="center"><br><br>
				<form name="debit_card" action="" method="post">
				<table width="70%" border="1" cellspacing="0" cellpadding="10" bordercolor="#FFCAFF" bgcolor="#CAE4FF">
                  <caption><h2>Debit Card Form</h2></caption>
				  <tr>
                    <td>A/c No </td>
                    <td><input type="number" name="db_acno" required="required"/></td>
                  </tr>
                  <tr>
                    <td>Card Number </td>
                    <td><input type="number" name="db_number" required="required"/></td>
                  </tr>
                  <tr>
                    <td>Isuuer Name </td>
                    <td><input type="text" name="db_name" required="required"/></td>
                  </tr>
                  <tr>
                    <td>Issued on </td>
                    <td><input type="date" name="db_issuedon" required="required"/></td>
                  </tr>
                  <tr>
                    <td>Expired on </td>
                  <script> var a=["jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"];</script>
                       <td><select name="db_month">
                               <script>
                                   for(var i=0;i<12;i++)
                                       document.write("<option value="+a[i]+">"+a[i]+"</option>");
                               </script>
                                </select>
                       <select name="db_year">
                               <script>
                                   var dt=new Date();
                                   for(var i=dt.getFullYear();i<=(dt.getFullYear()+25);i++)
                                       document.write("<option value="+i+">"+i+"</option>");
                               </script>
                                </select> 
                       </td>
                  </tr>
                  <tr>
                    <td>CVV2</td>
                    <td><input type="number" name="db_cvv2" required="required"/></td>
                  </tr>
                  <tr>
                    <td>pin no </td>
                    <td><input type="password" name="db_pin" required="required"/></td>
                  </tr>
                  <tr>
                    <td>card type </td>
                    <td><select name="db_cardtype">
					 <option value="visa">Visa</option>
					 <option value="Master Card">Master Card</option>
					 <option value="Maestro">Maestro</option>
					</select></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="center">
					<input type="submit" name="db_btn" value="Submit" style="border:0px;width:110px;background-color:#330099;color:white;height:25px;cursor:pointer;border-radius:10px"/>
					</td>
                  </tr>
                </table>
				</form>
				</td>
              </tr>
            </table></td>
          </tr>
        </table>
		<%
		 if(request.getParameter("db_btn")!=null){
                  try{
		  long db_acno=Long.parseLong(request.getParameter("db_acno"));
		  long db_number=Long.parseLong(request.getParameter("db_number"));
		  String db_name=request.getParameter("db_name");
		  String issued_on=request.getParameter("db_issuedon");
                  String db_expiredon=request.getParameter("db_month")+" "+request.getParameter("db_year");
                  int cvv2=Integer.parseInt(request.getParameter("db_cvv2"));
                  String db_pin=request.getParameter("db_pin");
                  String db_cardtype=request.getParameter("db_cardtype");
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
                  PreparedStatement pst=con.prepareStatement("insert into debit_card(`accno`,`card_no`,`issue_name`,`issue_on`,`expire_on`,`cvv2`,`pin_no`,`card_type`) values(?,?,?,?,?,?,?,?)");
                  pst.setLong(1, db_acno);
                  pst.setLong(2,db_number);
                  pst.setString(3,db_name);
                  pst.setString(4,issued_on);
                  pst.setString(5,db_expiredon);
                  pst.setInt(6,cvv2);
                  pst.setString(7,db_pin);
                  pst.setString(8,db_cardtype);
                  pst.executeUpdate();
                  out.print("Record Updated Successfully.");
                  }
                  catch(SQLException e){
                   out.print("<script>alert('You already issued debit card from our bank!')</script>");
                  }
                  catch(Exception e){
                   out.print(e);
                  }
                  }
                 
		%>
    </body>
</html>
