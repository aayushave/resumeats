<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> <!-- Site Metas -->
                <title>Resume ATS | Get Job Done</title>  
                <meta name="keywords" content=" Resume, ATS, Job, Developer, Engineering">
                <meta name="description" content="Resume ATS is a resume selection software useful for job posters for quick identification of eligible users. ">
	</head>
	<body><!-- values given at login page are taken here and checks if the valid details are not -->
		<%
                    
                    try{
            String e=request.getParameter("email");
            String password=request.getParameter("password");
            String sql="select userid,first_name,last_name,email,pass,dob,phonenumber from dblogin where email=?";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,e);
            ResultSet rs=ps.executeQuery();
            String msg="";
           
            if(rs.next())
            {   
                String userid=rs.getString("userid");
                String first_name=rs.getString("first_name");
                String last_name=rs.getString("last_name");
                String email=rs.getString("email");
                String pwd=rs.getString("pass");
                String dob=rs.getString("dob");
                String pn=rs.getString("phonenumber");
                
                   if(password.equals(pwd))
                   {
                        session.setAttribute("userid",userid);
                        session.setAttribute("first_name",first_name);
                        session.setAttribute("last_name",last_name);//THIS IS HOW WE DECLARE THE USER IN A SESSION
			session.setAttribute("email",email);
                        session.setAttribute("dob",dob);
                        session.setAttribute("phonenumber",pn);
                        response.sendRedirect("index.jsp"); //AND WE REDIRECTED TO LOGIN PAGE
                       
                   
                   }else
                {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Credentials');");
                out.println("location='index.html';");
                out.println("</script>");
                }  
            }else{out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Credentials');");
                out.println("location='index.html';");
                out.println("</script>");
                    }}        
        
            catch(Exception ex)
            {
                    out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Credentials');");
                out.println("location='index.html';");
                out.println("</script>");
            }
            finally
            {
                    
            }
            
		
		%>
	</body>
</html>
