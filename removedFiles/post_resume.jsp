<%-- 
    Document   : post_resume
    Created on : 23 Nov, 2020, 6:35:49 PM
    Author     : aayushr
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String userid=request.getParameter("userid");
String company_applied=request.getParameter("company_applied");
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String email=request.getParameter("email");
String dob=request.getParameter("dob");
String phonenumber=request.getParameter("phonenumber");
String engineering_stream=request.getParameter("engineering_stream");
String engineering_cgpa=request.getParameter("engineering_cgpa");
String diploma_done=request.getParameter("diploma_done");
String diploma_percentage=request.getParameter("diploma_percentage");
String proficiency_count=request.getParameter("proficiency_count");
String list_proficiency=request.getParameter("list_proficiency");
String prior_experience=request.getParameter("prior_experience");
String list_experience=request.getParameter("list_experience");
String apply_job=request.getParameter("apply_job");



try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into dbresume(userid,company_applied,first_name,last_name,email,dob,phonenumber,engineering_stream,engineering_cgpa,diploma_done,diploma_percentage,proficiency_count,list_proficiency,prior_experience,list_experience,apply_job)values('"+userid+"','"+company_applied+"','"+first_name+"','"+last_name+"','"+email+"','"+dob+"','"+phonenumber+"','"+engineering_stream+"','"+engineering_cgpa+"','"+diploma_done+"','"+diploma_percentage+"','"+proficiency_count+"','"+list_proficiency+"','"+prior_experience+"','"+list_experience+"','"+apply_job+"')");
if (i==1){
out.println("<script type=\"text/javascript\">");
   out.println("alert('Resume Successfully Updated, Please click on validate resume');");
   out.println("location='index.jsp';");
   out.println("</script>");

}conn.close();
}
    
catch(Exception e)
{
System.out.print(e);
out.println("<script type=\"text/javascript\">");
   out.println("alert('Resume Not Updated '"+e+"' Please Try Again To Continue');");
   out.println("location='index.jsp';");
   out.println("</script>");
e.printStackTrace();
}
%>
