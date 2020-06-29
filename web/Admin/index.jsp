

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <style type="text/css">
            table td{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            if(request.getParameter("login_btn")!=null){
            try{
        String user=request.getParameter("username");
            String pass=request.getParameter("pass");
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_banking","root","");
         Statement stmt=con.createStatement();
         ResultSet rs=stmt.executeQuery("select *from admin where username='"+user+"'");      
         if(rs.next()){
          String user1=rs.getString("username");
          String pass1=rs.getString("password");
          if(user.equals(user1) && pass.equals(pass1)){
              //out.print("this is session");
            session.setAttribute("admin_login",user1);
            response.sendRedirect("newaccount.jsp");
          }
          else{
          out.print("<script>alert('Wrong password')</script>");
         // RequestDispatcher rd=request.getRequestDispatcher("../bank_admin.me/index.jsp");
         // rd.include(request, response);
                  }
         }
         else{
         out.print("<script>alert('Invalid username')</script>");
        // RequestDispatcher rd=request.getRequestDispatcher("../bank_admin.me/index.jsp");
        //  rd.include(request, response);
         }
            }catch(SQLException e)
            {
            out.print(e);
            }
            }
        %>
        <center>
            <form method="post">
    <div style="width:1000px;margin-top:-10px" border="0">
      <div>
		<%@include file="header.html"%>
		</div>
		<div><br><br>
		<a href="..">Main Website</a><br><br>
		<table style="width:400px;font-size:large" border="0" cellspacing="10" cellpadding="0">
<caption><h2>Are you Admin! LOGIN HERE</h2></caption>
  <tr>
    <td>UserName</td>
    <td><input type="text" onFocus="getFocus('username')" onBlur="reFocus('username')" required="required" name="username" id="username"/></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><input type="password" onFocus="getFocus('pass')" onBlur="reFocus('pass')" required="required" name="pass" id="pass"/></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
	<input type="submit" name="login_btn" value="Submit" onClick="required('username','pass')"/>
	 </td>
  </tr>
</table>
		</div>
    </div>  </form>
	</center> 
    </body>
</html>
