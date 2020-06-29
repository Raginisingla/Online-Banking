<%-- 
    Document   : ses
    Author     : jasmine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table style="width:100%;background-color:#7AB7E4">
            <tr><td>
                 <%
       // if(session.getAttribute("admin_login").equals(null)){
        // }
        //else{ 
        String sesvalue=session.getAttribute("admin_login").toString();       
       
        
            //    }
       // session.invalidate();
        %>    
        <strong style="font-size: large">Welcome</strong>  <%=sesvalue%>
            </td>
            <td align="right">
                <a href="logout.jsp" style="font-size: 18px;color:#003366;padding-right: 15px">Logout</a>                
            </td></tr>
        </table>
    </body>
</html>
