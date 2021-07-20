<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
	<body>
		<%
                    
                    session.removeAttribute("uid");
                    session.removeAttribute("id");
                    session.invalidate();
                    response.sendRedirect("index.html");
                    
                
               %> 
		
	</body>
</html>
