<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@page import="java.sql.*,javax.servlet.*,db.Connect" %>
<head>
<title></title>
<style type="text/css">
.login_table{
border:solid 0px;border-radius:15px;
box-shadow:10px 10px 10px 10px #ccc;
}
</style>
</head>
<body style="margin-top:-10px">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:70%"><%@ include file="primarymenu.html"%></td>
    <td rowspan="2" valign="middle" align="center">
	<table width="80%" cellspacing="10" cellpadding="0" class="login_table">            
	 <tr><td>&nbsp; </td></tr>		
            <tr>
              <td valign="top">
                 
			  <div>
			  Catch Us:<br/><br />
			  <img src="image/social-sprite.gif" width="250" height="28" style="padding-left:5px" usemap="#mypic"/>
			  <map name="mypic">
<area shape="rect" coords="0,0,50,28" href="http://www.twitter.com/" target="_blank"/>
<area shape="rect" coords="50,0,100,28" href="http://www.linkedin.com/" target="_blank"/>
<area shape="rect" coords="100,0,150,28" href="https://www.facebook.com/profile.php?id=100008569937305" target="_blank" />
<area shape="rect" coords="150,0,200,28" href="http://google.com/" target="_blank" />
<area shape="rect" coords="200,2,250,28" href="http://feedburner.google.com" target="_blank" />
			  </map>			  
			  			  </div><br /><br />
			  To Access your account....<h3 style="color:lightskyblue; height: 5px;">Login to Online Banking</h3></td>
            </tr>
			<%if(session.getAttribute("user_login")!=null){
                    try{
                          Class.forName("com.mysql.jdbc.Driver");
                Connection ses_con=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
                    PreparedStatement ses_stmt=ses_con.prepareStatement("select fname,lname,accno from accounts where cust_username=?");
                     ses_stmt.setInt(1, Integer.parseInt(session.getAttribute("user_login").toString()));
                     ResultSet ses_rs=ses_stmt.executeQuery();
                     if(ses_rs.next()){
			%>
                     <tr> <td align="center">
					 
					      <h3>Welcome: <span><%=ses_rs.getString("fname")+" "+ses_rs.getString("lname")%></span></h3>    
					      <table width="90%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                    <td> <form name="header_form1" method="post">
			  <td><input type="submit" value="Login" name="lgn_btn" style="color:white;background-color:#33CC99;font-size:18px;border:#FFFFFF;height:25px;width:70px;border-radius:12px;cursor:pointer"/>
                        </td></form>
			  <td>
			  <form name="header_form3" method="post"  action="logout">
	<input type="submit" value="Logout" name="lgt_btn" style="color:white;background-color:#33CC99;font-size:18px;border:#FFFFFF;height:25px;width:70px;border-radius:12px;cursor:pointer"/> 
			</form>
			  </td>  </tr>  </table>
			   	</td></tr>
                 <%
       }
	   }
 catch(Exception e){}
                      }else{
                      %>					  
            <form name="header_form2" method="post">
		<tr>
			     <td height="30"><input type="text" name="header_user" placeholder="Enter Your Username" required="required"/></td>
            </tr>
            <tr>
                <td height="30"><input type="password" name="header_pass" placeholder="Enter Your Password" required="required"/></a></td>
            </tr>
            <tr>
                <td height="30"><input type="submit" value="Login" name="header_btn" style="color:white;background-color:#FF0000;border:#FFFFFF;height:25px;width:70px;border-radius:12px"/> &nbsp;
                    &nbsp;<a href="forgetpass.jsp" style="color:red; text-decoration:underline;">Forgot Password?</a></td>
            </tr> </form><% } %>
          </table>
	</td>
  </tr>
  <tr>
      <td style="height:250px" valign="top"><%@include file="slide.html"%></td>
  </tr>
</table>
<%
if(request.getParameter("lgn_btn")!=null){
 response.sendRedirect("welcome.jsp");
}
if(request.getParameter("header_btn")!=null){
 try{   
            String username=request.getParameter("header_user");
            String password=request.getParameter("header_pass");
			String username1=null,password1=null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection header_con=DriverManager.getConnection(Connect.dburl,Connect.dbusername,Connect.dbpassword);
            PreparedStatement header_stmt=header_con.prepareStatement("select cust_username,cust_password from accounts where cust_username=?");
            header_stmt.setString(1, username);
            ResultSet header_rs=header_stmt.executeQuery();
            if(header_rs.next()){
			  username1=header_rs.getString("cust_username");	 
			  password1=header_rs.getString("cust_password");
            }
            if(username.equals(username1) && password.equals(password1)){
			 session.setAttribute("user_login",username1);
			 if(username1.equals(password1))
			  response.sendRedirect("userchange_pass.jsp");
			 else
			  response.sendRedirect("welcome.jsp");
			}
			else{
			 out.print("<script>alert('Invalid Username or Password!')</script>");
			}
        }
        catch(ClassNotFoundException e){ out.print(e); }
        catch(SQLException e){ out.print(e); }
	}
%>
</body>
</html>