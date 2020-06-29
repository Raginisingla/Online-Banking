<%-- 
    Document   : index
    Created on : 25 Sep, 2017, 4:06:14 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to online banking system</title>
            <%@include file="top.jsp" %>

    </head>
   <body>
   <marquee style="margin-top: -600px;color:white" bgcolor="black"  onMouseOver="this.stop()" onMouseOut="this.start()">Get the benefit of tax saving with HDFC Life Click to Protect Plus Protection Plan Buy Online. Two-Wheeler Loan. Enjoy unbelievably low down-payment of Rs. 999/-. Apply Now. *T&C apply. Get the benefit of tax saving with HDFC Life Click to Protect Plus Protection Plan Buy Online.Two-Wheeler Loan. Enjoy unbelievably low down-payment of Rs. 999/-. Apply Now. *T&C apply.  </marquee></td>	  </td>
 <tr>
      <td valign="top">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="total_cls ">
        <tr>
          <td width="18%" valign="top">
		  <h3 style="margin-left:25px;color:#420021">Check Eligibility</h3>
            <p><a href="elig_credit_card.jsp">Credit Card</a></p>
            <p><a href="elig_personal_loan.jsp">Personal Loan</a></p>
            <p><a href="elig_car_loan.jsp">Car Loan</a> </p>
            <p><a href="elig_home_loan.jsp">Home Loan</a></p>
			 <p><a href="elig_chaddress.jsp">Change Address</a></p>
			</td>
          <td valign="top" width="18%">
		  <h3 style="margin-left:25px;color:#420021">Get a call back </h3>
            <p><a href="call_credit.jsp">Credit Card</a></p>
            <p><a href="call_personal_loan.jsp">Personal Loan</a></p>
            <p><a href="call_car_loan.jsp">Car Loan</a> </p>
            <p><a href="call_home_loan.jsp">Home Loan</a></p>
            <p><a href="call_property.jsp">Property Loan</a></p>
            <p><a href="call_insurance.jsp">Life Insurance</a></p>
            <p><a href="call_salaryac.jsp">Salary Account</a></p>
            </td>
          <td valign="top" width="18%">
		  <h3 style="margin-left:25px;color:#420021">Apply Online </h3>
            <p><a href="call_personal_loan.jsp">Personal Loans</a></p>
            <p><a href="call_credit.jsp">Credit Card </a></p>
            <p><a href="call_saving.jsp">Saving Account </a> </p>
            <p><a href="call_insurance.jsp">Life Insurance</a></p>
            <p><a href="call_salaryac.jsp">Salary Account</a></p>
            <p><a href="call_debit.jsp">Debit Card</a></p></td>
          <td valign="top" width="18%">
		  <h3 style="margin-left:25px;color:#420021">Services</h3>
                  <p><a href="#">interest calculator</a>
          <td valign="top" width="28%">
		  <h3 style="margin-left:25px;color:#420021">Accounts & Deposits</h3>
		  <%if(session.getAttribute("user_login")!=null){
		  %>
		  <h3 style="margin-left:25px;color:#0033FF"><a href="userDebitCard.jsp">Cards</a></h3>
		  <h3 style="margin-left:25px;color:#0033FF"><a href="pay_insuranceemi.jsp">Investments</a></h3>
		  <h3 style="margin-left:25px;color:#0033FF"><a href="pay_insuranceemi.jsp">Insurance</a></h3>
		  <%}else{
		  %>
		  <h3 style="margin-left:25px;color:#0033FF"><a href="user_login.jsp?action=Please login first!">Cards</a></h3>
		  <h3 style="margin-left:25px;color:#0033FF"><a href="user_login.jsp?action=Please login first!">Investments</a></h3>
		  <h3 style="margin-left:25px;color:#0033FF"><a href="user_login.jsp?action=Please login first!">Insurance</a></h3>
		  <% }%>
		</td>
        </tr>
      </table></td>
    
        </tr>
        <%@ include file="footer.html"  %>
    </body>
</html>
