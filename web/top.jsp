<%--
    Document   : top
    Created on : 25 Sep, 2017, 4:10:16 PM
    Author     : hp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="D:\bootstrap\bootstrap.min.css" rel="stylesheet"/>
              

        
            <style type="text/css">
               
#login{
border:solid 0px;border-radius:13px;
}
            </style>
         
    </head>
    <body>
        <div id="login">
            <span>
                <a href="#">  <i class="fa fa-sign-in" aria-hidden="true"></i>
            login</a>
            </span>
            <span style="margin-left:75px">
                <a href="#">Carrer</a>
            </span>
            
        </div>
                    <img src="logo_img.jpg" width="150" height="100"/>
                    <div  style="margin-top:-60px;margin-left: 200px">    <img src="home_loan_strip.gif"></div>
                        

        <div style="border:solid black 6px;width:300px;height:310px;margin-left:1000px;border-radius:12px; margin-top: -90px">
            <p>catch us:</p><img src="social-sprite.jpg" height="50" width="290">
<%if(session.getAttribute("user_login")!=null){
                    try
                    {
                          Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql:///Online_banking","root","");
        String query= "Select fname,lname,accno from accounts where cust_username=?";
      
    
          PreparedStatement pst = con.prepareStatement(query);
    
                    
                     pst.setInt(1, Integer.parseInt(session.getAttribute("user_login").toString()));
                     ResultSet ses_rs=pst.executeQuery();
                     if(ses_rs.next()){
                     }
                     }
		
                        
                       catch(Exception e)
                        {
                        e.printStackTrace();
                        }
                    }
                        %>
            <p>to access your account......</p>
             <h3 style="color:blue">login to Online banking</h3>
             <table>
         <tr><th>username:</th>
                      <td>    <input type="text" name="t1" placeholder="enter your user"><br> </td>
         </tr>
                  <tr><th>password:</th>
                      <td>  <input type="email" name="t2" placeholder="enter your password"><br></td>
                  </tr>
                  <tr>
                      <td>  <input type="submit" value="login"></td>
                  </tr>
             </table>
                   <a href="#">forget password</a>
        </div>
        <div>
            <ul style="margin-top: -205px;list-style:none;">
                
                <li style="display:inline-block;margin-left: 50px"> Home</li>
                <li style="display:inline-block;margin-left: 50px">About us</li>
                <li style="display:inline-block;margin-left: 50px">Offers</li>
                <li style="display:inline-block;margin-left: 50px">Customer Care</li>
                <li style="display:inline-block;margin-left: 50px">Interest Calculator</li>
                
                <%@ include file="primarymenu_1.html" %>
           </ul>
        </div>
                  
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
            Connection con = DriverManager.getConnection("jdbc:mysql:///online_banking","root","");
            PreparedStatement header_s=con.prepareStatement("select cust_username,cust_password from accounts where cust_username=?");
            header_s.setString(1, username);
            ResultSet header_rs=header_s.executeQuery();
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