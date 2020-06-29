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
	  int ins_id=10;
	  long ins_cont=0;;
	  String month[]={"jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"};
	  String today=month[Calendar.getInstance().get(Calendar.MONTH)]+" "+Calendar.getInstance().get(Calendar.YEAR);
	   Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
	   PreparedStatement pst=con.prepareStatement("select ins_id from insurance");
	   ResultSet rs=pst.executeQuery();
	   while(rs.next()){ 
	   ins_id=rs.getInt("ins_id");
	   }
	  %>
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
				 <table width="80%" border="1" cellspacing="0" cellpadding="10" style="background-color:#FFE6F2"  bordercolor="#C6C6FF">
				 <caption><h2>Insurance Form</h2></caption>
  <tr>
    <td>ID</td>
    <td><%=ins_id+1%></td>
  </tr>
  <tr>
    <td>Name</td>
    <td><input type="text" name="insu_name" required="required"/></td>
  </tr>
  <tr>
    <td>Address</td>
    <td><textarea required="required" name="insu_address"></textarea></td>
  </tr>
  <tr>
    <td>Date of Birth </td>
    <td><input type="date" name="insu_dob" required="required"//></td>
  </tr>
  <tr>
    <td>Email</td>
    <td><input type="email" name="insu_email" required="required"//></td>
  </tr>
  <tr>
    <td>Contact</td>
    <td><input type="number" name="insu_contact" required="required"//></td>
  </tr>
  <tr>
    <td>Duration</td>
    <td><select name="insu_duration" required="required"/>
	<script>
	 for(var i=1;i<=30;i++)
	 document.write("<option value="+i+">"+i+"</option>");
	 </script>
	</select></td>
  </tr>
  <tr>
    <td>EMI</td>
    <td><input type="text" name="insu_emi" required="required"//></td>
  </tr>
  <tr>
    <td>First EMI month </td>
    <td><input type="text" name="insu_emimonth" readonly="true" value="<%=today%>"/></td>
  </tr>
  <tr>
    <td>payable premium (months) </td>
    <td><input type="text" name="insu_payables" placeholder="ex. jan apr jul oct" required="required"//></td>
  </tr>
  <tr>
    <td>Premium time </td>
    <td><select name="insu_time" required="required"/>
	<script>
	 for(var i=1;i<=12;i++)
	 document.write("<option value="+i+">"+i+"</option>");
	 </script>
	</select></td>
  </tr>
  <tr>
    <td colspan="2">Are you Bank customer <input name="insu_cust" type="radio" value="yes" required="required" id="insu_cust"/>Yes 
	<input name="insu_cust" type="radio" value="no" required="required" id="insu_cust1"/> No 
        <input type="text" placeholder="Account number" name="insu_acno" id="insu_bank" required="required"/><span id="error"></span>	</td>
    </tr>
  <tr>
    <td colspan="2" align="center">
	<input type="submit" value="Register" style="background-color:#FF66CC;color:#0000CC;height:30px;width:150px;border:0px;border-radius:9px;box-shadow:2px 2px 2px skyblue;cursor:pointer" name="insu_btn"/>
	</td>
  </tr>
</table>
</form>

	
<script>
	$(document).ready(function(){
	$("#insu_bank").attr("readonly",true);
	$("#insu_bank").hide();
	 $("#insu_cust").click(function(){
	 $("#insu_bank").show();
	  $("#insu_bank").attr("readonly",false);
	 });
	 $("#insu_cust1").click(function(){
	  $("#insu_bank").hide();
	  $("#insu_bank").attr("readonly",true);
	  $("#insu_bank").val("0");
	 });
	});
	</script>	
	<%
         long contact=0;
	 if(request.getParameter("insu_btn")!=null){
	 pst.close();
	 PreparedStatement pst1=con.prepareStatement("select contact from accounts where accno=?");
	 pst1.setLong(1,Long.parseLong(request.getParameter("insu_acno")));
	 ResultSet rs1=pst1.executeQuery();
	 if(rs1.next()){
          contact=rs1.getLong("contact");    
         }
         else{
          contact=Long.parseLong(request.getParameter("insu_contact"));
         }
          if(Long.parseLong(request.getParameter("insu_contact"))!=contact)
	  {
              out.print("<script>alert('Invalid contact number or Account Number')</script>");
	  }
          else{
         try{
	  String insu_name=request.getParameter("insu_name");
	  String insu_address=request.getParameter("insu_address");
	  String insu_dob=request.getParameter("insu_dob");
	  String insu_email=request.getParameter("insu_email");
	  long insu_contact=Long.parseLong(request.getParameter("insu_contact"));
	  int insu_duration=Integer.parseInt(request.getParameter("insu_duration"));
	  double insu_emi=Double.parseDouble(request.getParameter("insu_emi"));
	  String insu_emimonth=request.getParameter("insu_emimonth");
	  String insu_payables=request.getParameter("insu_payables");
	  int insu_time=Integer.parseInt(request.getParameter("insu_time"));
	  long insu_acno=Long.parseLong(request.getParameter("insu_acno"));
	
 	  String date=Calendar.getInstance().get(Calendar.YEAR)+"-"+(Calendar.getInstance().get(Calendar.MONTH)+1)+"-"+Calendar.getInstance().get(Calendar.DATE);	  
          String end_date=(Calendar.getInstance().get(Calendar.YEAR)+insu_duration)+"-"+Calendar.getInstance().get(Calendar.MONTH)+"-"+Calendar.getInstance().get(Calendar.DATE);
		  double totalprm=insu_emi*(12/insu_time)*insu_duration;
          String sql="insert into insurance(`accno`,`ins_id`,`name`,`address`,`dob`,`email`,`contact`,`duration`,`emi`,`next_emi`,`payble_premium`,`total_premium`,`end_date`,`start_date`,`total_paid`,`pre_time`) values('"+insu_acno+"','"+(ins_id+1)+"','"+insu_name+"','"+insu_address+"','"+insu_dob+"','"+insu_email+"','"+insu_contact+"','"+insu_duration+"','"+insu_emi+"','"+insu_emimonth+"','"+insu_payables+"','"+totalprm+"','"+end_date+"','"+date+"','0','"+insu_time+"')";
		  Statement stmt=con.createStatement();
		  stmt.executeUpdate(sql);
		  response.sendRedirect("insu_print.jsp?insid="+(ins_id+1));
         }
		
	  catch(NumberFormatException e){
	   out.print("<script>alert('Invalid EMI value. Must be in the form of money.')</script>");
	  }
	  catch(Exception e){
	   out.print(e);
	  }
	 }
         }
	%>
				</td>
              </tr>
            </table></td>
          </tr>
        </table>
    </body>
</html>
