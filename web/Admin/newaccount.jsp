<%-- 
    Document   : Welcome
    Author     : jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     	   <title>Create new Account</title>
    </head>
    <body>
        <form action="../newaccount" method="post">      
	<table width="1000px" border="0" cellspacing="0" cellpadding="0" align="center" style="background-color: #E1EEFE">
          <tr>
            <td>
                <%@include file="header.html" %>	
			</td>
          </tr>
		  <tr><Td>
                         <%@ include file="ses.jsp" %> 
		  </Td></tr>
          <tr>
            <td align="center"><table width="1000px" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="width:30%" valign="top">
				 <%@include file="sidebanner.html" %>
				</td>
                               
						        <td width="650px">
                 <!-- new account form starting-->
                                    <br>
		<table width="80%" cellpadding="4" cellspacing="10" border="0" class="total_cls" style="border:1px groove black; border-radius:15px;">
									
					<caption><h2>Opening New Account</h2></caption>
					<tr>
					<td>First name*</td>
					<td><input type="text" name="fname" id="fname" required="required"></td>
					</tr>
					<tr>
					<td>Last name*</td>
					<td><input type="text" name="lname" id="lname" required="required"></td>
					</tr>
					<tr>
					<tr>
					<td>Father'<sup>s</sup> Name*</td>
					<td><input type="text" name="fathername" id="fathername" required="required"></td>
					</tr>
					<tr>
					<td>Email Id*</td>
					<td><input type="email" name="emailid" id="emailid" required="required"></td>
					</tr>
                                        <tr>
                                            <td>Mobile Number: </td>
                                            <td><input type="number" name="dep_contact" required="required"/></td>
                </tr>
					<tr>
					<td>DOB</td>
                    <td><select name="day">
					<option>Day</option>
                    <script>
                    var i;
                    for(i=1; i<=31; i++)
                    {
                    document.write("<option>"+i+"</option>");
                    }
                    </script>
                    </select>
					<select name="month">
					<option>Month</option>
                    <script>
                    var i;
                    for(i=1; i<=12; i++)
                    {
                    document.write("<option>"+i+"</option>");
                    }
                    </script>
                    </select>
					<select name="year">
					<option>Year</option>
                    <script>
                    var i;
                    for(i=1979; i<=1995; i++)
                    {
                    document.write("<option>"+i+"</option>");
                    }
                    </script>
                    </select>
					</td>
					</tr>
					<tr>
					<td>Gender</td>
					<td><input type="radio" name="gender" id="gender" required="required" checked="checked" value="male">Male
					<input type="radio" value="female" name="gender" id="gender">Female
					</tr>
					<tr>
					<td></td>
					<td align="center"><input type="submit" value="NEXT" name="sub_btn"></td>
					</tr>
					</table>
		
                                    
                                    
                                </td>
              </tr>
            </table><br><Br>
				</td>
              </tr>
        </table></td>
          </tr>
        </table>
    </body>
</html>
