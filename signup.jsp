<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String email=request.getParameter("email");
String password=request.getParameter("password");
String dob=request.getParameter("dob");
String phonenumber=request.getParameter("phonenumber");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into dblogin(first_name,last_name,email,pass,dob,phonenumber)values('"+first_name+"','"+last_name+"','"+email+"','"+password+"','"+dob+"','"+phonenumber+"')");
if (i==1){
out.println("<script type=\"text/javascript\">");
   out.println("alert('Account created  Please Log In To Continue');");
   out.println("location='index.html';");
   out.println("</script>");

}conn.close();
}
    
catch(Exception e)
{
System.out.print(e);
out.println("<script type=\"text/javascript\">");
   out.println("alert('Account not created "+e+" Please Try Again To Continue');");
   out.println("location='index.html';");
   out.println("</script>");
e.printStackTrace();
}
%>