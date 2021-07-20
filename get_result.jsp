<%-- 
    Document   : get_result
    Created on : 07 May, 2021, 6:35:49 PM
    Author     : pratikg
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String userid = request.getParameter("userid");
    String applied_job=request.getParameter("applied_job");
    String first_name;
    String last_name;
    
    String cgpa_criteria="";
    String diploma_accepted="";
    String diploma_criteria="";
    String proficiency_criteria="";
    String experience_criteria="";

    if(applied_job.equals("SOFTWARE_DEVELOPER")){
        cgpa_criteria = "8.00";
        diploma_accepted = "YES";
        diploma_criteria = "85.00";
        proficiency_criteria = "1";
        experience_criteria = "NO";
    }
    else if(applied_job.equals("BLOCKCHAIN_DEVELOPER")){
        cgpa_criteria = "8.00";
        diploma_accepted = "YES";
        diploma_criteria = "80.00";
        proficiency_criteria = "1";
        experience_criteria = "NO";
    }
    else if(applied_job.equals("SOFTWARE_TEST_DEVELOPER")){
        cgpa_criteria = "8.00";
        diploma_accepted = "NO";
        diploma_criteria = "00.00";
        proficiency_criteria = "1";
        experience_criteria = "NO";
    }
    else if(applied_job.equals("JAVA_DEVELOPER")){
        cgpa_criteria = "8.50";
        diploma_accepted = "NO";
        diploma_criteria = "00.00";
        proficiency_criteria = "1";
        experience_criteria = "YES";
    }
    

try
{
Class.forName("com.mysql.jdbc.Driver");
String sql="select * from dbresume where userid="+userid+" AND apply_job='"+applied_job+"' AND engineering_cgpa>="+cgpa_criteria+" AND (diploma_done='"+diploma_accepted+"' OR diploma_done='NO') AND (diploma_percentage>="+diploma_criteria+" OR diploma_percentage=0)  AND proficiency_count>="+proficiency_criteria+" AND (prior_experience='"+experience_criteria+"' OR prior_experience='YES') ";
       Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery(sql);
            if(rs.next()){;
                userid=rs.getString("userid");
                applied_job=rs.getString("apply_job");
                first_name=rs.getString("first_name");
                last_name=rs.getString("last_name");
                
                String dserialid,duserid,dcompany_applied,dfirst_name,dlast_name,demail,ddob,dphonenumber,dengineering_stream,dengineering_cgpa,ddiploma_done,ddiploma_percentage;
                String dproficiencty_count,dlist_proficiency,dprior_experience,dlist_experience,dapply_job;   
                
                dserialid=rs.getString("serialid");
                duserid=rs.getString("userid");
                dcompany_applied=rs.getString("company_applied");
                dfirst_name=rs.getString("first_name");
                dlast_name=rs.getString("last_name");
                demail=rs.getString("email");
                ddob=rs.getString("dob");
                dphonenumber=rs.getString("phonenumber");
                dengineering_stream=rs.getString("engineering_stream");
                dengineering_cgpa=rs.getString("engineering_cgpa");
                ddiploma_done=rs.getString("diploma_done");
                ddiploma_percentage=rs.getString("diploma_percentage");     
                dproficiencty_count=rs.getString("proficiency_count");     
                dlist_proficiency=rs.getString("list_proficiency");     
                dprior_experience=rs.getString("prior_experience");
                dlist_experience=rs.getString("list_experience");     
                dapply_job=rs.getString("apply_job");     
                Statement st=con.createStatement();
                int i=st.executeUpdate("insert into dbshortlist(`serialid`, `userid`, `company_applied`, `first_name`, `last_name`, `email`, `dob`, `phonenumber`, `engineering_stream`, `engineering_cgpa`, `diploma_done`, `diploma_percentage`, `proficiency_count`, `list_proficiency`, `prior_experience`, `list_experience`, `apply_job`) values('"+dserialid+"','"+duserid+"','"+dcompany_applied+"','"+dfirst_name+"','"+dlast_name+"','"+demail+"','"+ddob+"','"+dphonenumber+"','"+dengineering_stream+"','"+dengineering_cgpa+"','"+ddiploma_done+"','"+ddiploma_percentage+"','"+dproficiencty_count+"','"+dlist_proficiency+"','"+dprior_experience+"','"+dlist_experience+"','"+dapply_job+"')");
                if (i==1){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Dear "+first_name+" "+last_name+", You have been selected for the next round. Your Applied Job is "+applied_job+"' );");
                }
                out.println("location='index.jsp';");
                out.println("</script>");

            }else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Sorry you are not eligible for the position of "+applied_job+". You do not fit criteria that has been set by employer. Better next time' );");
                out.println("location='index.jsp';");
                out.println("</script>");
            }
}
catch(Exception e){
    System.out.print(e);
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Sorry some mishap happened | Try Agains' );");
    out.println("location='index.jsp';");
    out.println("</script>");
    e.printStackTrace();
}
%>
