<%-- 
    Document   : result
    Created on : May 8, 2021, 9:37:41 PM
    Author     : aayushr
--%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Transport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%  
    
 try{
     
    String fname = (String)session.getAttribute("nn");
    String lname=(String)session.getAttribute("ll");
    String company=(String)session.getAttribute("cc");
    String email=(String) session.getAttribute("ee");
    String job=(String) session.getAttribute("aa");
     
    Date date= new Date();
    long time = date.getTime();
    Timestamp ts = new Timestamp(time);
    System.out.println("Current Time Stamp: "+ts); 
   
    String FROM = "resumeselection3@gmail.com";
    String FROMNAME = "Resume ATS";
    String SMTP_USERNAME = "resumeselection3@gmail.com";
    String SMTP_PASSWORD = "resham@123";
    String CONFIGSET = "ConfigSet";
    String HOST = "smtp.gmail.com";
    int PORT = 587;
    
    String SUBJECT = "[IMP] Congratulations, You are shortlisted for "+company+"";
        String BODY="Hi "+fname+" "+lname+", <br/>We are delighted to tell you.<br /><strong> You have been shortlisted for "+company+" For "+job+" </strong> <br/>We will be in touch for future process<br/>Congratulations.";
       
    	Properties props = System.getProperties();
    	props.put("mail.transport.protocol", "smtp");
    	props.put("mail.smtp.port", PORT); 
    	props.put("mail.smtp.starttls.enable", "true");
    	props.put("mail.smtp.auth", "true");
    	Session mailSession = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(FROM,FROMNAME));
        msg.setRecipients(Message.RecipientType.TO, email);
     
        msg.setSubject(SUBJECT);
        msg.setContent(BODY,"text/html");
        
        msg.setHeader("X-SES-CONFIGURATION-SET", CONFIGSET);
        Transport transport = mailSession.getTransport();
        try
        {
            System.out.println("Sending...");
            transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
        	
            // Send the email.
            transport.sendMessage(msg, msg.getAllRecipients());
             System.out.println("Sent");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Dear "+fname+" "+lname+", You have been selected for the next round. Your Applied Job is "+job+" | "+company+"' );");
            out.println("location='index.jsp';");
            out.println("</script>");
                 }
        catch (Exception ex) {
            System.out.println("The email was not sent.");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Email Not Sent  Please Validate Resume Again To Continue');");
            out.println("location='index.jsp';");
            out.println("</script>");
            System.out.println("Error message: " + ex.getMessage());
        }
        finally
        {
            transport.close();
        }
    }catch(Exception e){e.printStackTrace();}
            
%>
