<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Transport"%>

<%
    // Get recipient's email-ID, message & subject-line from index.html page
    String subject= "[IMP] Password For Resume ATS";
    final String to = request.getParameter("email");
    final String first_name =request.getParameter("first_name");
    
    String sql="select first_name,email,pass from dblogin where email='"+to+"' AND first_name='"+first_name+ "'";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            
           
            if(rs.next())
            {
                String email=rs.getString("email");
                String pwd=rs.getString("pass");
                String f_name=rs.getString("first_name");
                session.setAttribute("f_name",f_name);//THIS IS HOW WE DECLARE THE USER IN A SESSION
		session.setAttribute("email",email);
                
    
        String messg="Dear " +f_name + " your password for 'Resume ATS' is : </h3><strong> "+pwd+" </strong>";
               
      
 
    // Creating Properties object
    Properties props = new Properties();
    String host = "smtp.gmail.com";
    
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.port", "587");

    // Authorized the Session object.
    Session mailSession = Session.getDefaultInstance(props);

        // Create a message with the specified information. 
        MimeMessage msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress("resumeselection3@gmail.com","Resume ATS"));
        msg.setRecipients(Message.RecipientType.TO,email);
        msg.setRecipients(Message.RecipientType.BCC, "resumeselection3@gmail.com");
        msg.setSubject(subject);
        msg.setContent(messg,"text/html");
        
       // Create a transport.
        Transport transport = mailSession.getTransport();
             
        // Send the message.
        try{
            System.out.println("Sending.");
            // Connect to Amazon SES using the SMTP username and password you specified above.
            transport.connect("smtp.gmail.com", "resumeselection3@gmail.com", "parse@123");
            // Send the email.
            transport.sendMessage(msg, msg.getAllRecipients());
            System.out.println("Mail Sent.");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('If you have registered, You will receive mail soon');");
            out.println("location='index.html';");
            out.println("</script>");
        }
        catch (Exception ex) {
           //ex.printStackTrace();
            System.out.println("The email was not sent.");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Email Not Sent  Please Try Again To Continue');");
            out.println("location='index.html';");
            out.println("</script>");
            System.out.println("Error message: " + ex.getMessage());
        }
        finally
        {
            // Close and terminate the connection.
            transport.close();
        }
        ps.clearParameters();
        ps.close();
        rs.close();
        con.close();
    }
            
%>