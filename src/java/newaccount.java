
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author hp
 */


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 *
 * @author BIRENDER
 */
public class newaccount extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          int acid=0;
          int dep_username=100;
            try{
              String fname=request.getParameter("fname");
              String lname=request.getParameter("lname");
              String fathername=request.getParameter("fathername");
              String email=request.getParameter("emailid");
              String gender=request.getParameter("gender");
               if(fname.equals("") || lname.equals("") || fathername.equals("") || email.equals("") || gender.equals("")){
               out.print("<b style='color:red'>Please fill all the fields.</b>");
               RequestDispatcher rd=request.getRequestDispatcher("/Admin/newaccount.jsp");
               rd.include(request, response);
               //response.sendRedirect("bank_admin.me/newaccount.jsp");
               }
               else{
               String dob=request.getParameter("day")+"/"+request.getParameter("month")+"/"+request.getParameter("year");
               Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_banking1/","root","");
               Statement s=con.createStatement();
               //fetching record for customer id
               ResultSet acrs=s.executeQuery("select cust_id,cust_username from accounts");
               while(acrs.next()){
               acid=acrs.getInt("cust_id");
               dep_username=acrs.getInt("cust_username");
               }
               s.close();
               //inserting records
               Statement s1=con.createStatement();
               acid=acid+1;
               dep_username=dep_username+1;
               String sql="insert into accounts(`cust_id`,`fname`,`lname`,`fathername`,`email`,`contact`,`dob`,`gender`,`cust_username`,`cust_password`) values('"+acid+"','"+request.getParameter("fname")+"','"+request.getParameter("lname")+"','"+request.getParameter("fathername")+"','"+request.getParameter("emailid")+"','"+request.getParameter("dep_contact")+"','"+dob+"','"+request.getParameter("gender")+"','"+dep_username+"','"+dep_username+"')";
               s1.executeUpdate(sql);
               //out.print("Inserted");
               response.sendRedirect("Admin/openning_acc2.jsp?cust_id="+acid);
               s1.close();
               con.close();
               } }
           catch(SQLException e){
           out.print(e);
           }
           catch(ClassNotFoundException e){
           out.print(e);
           }
           catch(Exception e){
//out.print(e);
    out.print("Email already exists.");
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

