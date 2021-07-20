<%-- 
    Document   : privacy
    Created on : 20 Nov, 2020, 2:16:02 PM
    Author     : aayushr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
     <!-- Site Metas -->
    <title>Resume ATS | Get Job Done</title>  
    <meta name="keywords" content=" Resume, ATS, Job, Developer, Engineering">
    <meta name="description" content="Resume ATS is a resume selection software useful for job posters for quick identification of eligible users. ">
	
	
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

</head>
<body>
<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp">
					<img src="images/logo-hosting.png" alt="" /> 
				</a>
				<div class="navbar" id="navbars-host">
                                   <ul class="navbar-nav ml-auto">
						<li ><a class="nav-link bg-light" href="index.jsp">Home</a></li>
						<li ><a class="nav-link bg-light" href="privacy.jsp">Privacy Policy</a></li>
                                                <li ><a class="nav-link bg-danger text-white" href="logout.jsp">Logout</a></li>
					</ul>
					
				</div>
                            <%
                                //HERE WE GETTING THE ATTRIBUTE DECLARED IN VALIDATE.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
				response.setHeader("Cache-Control","no-cache");
                                response.setHeader("Cache-Control","no-store");
                                response.setHeader("Pragma","no-cache");
                                response.setDateHeader ("Expires", 0);
                                
                                session = request.getSession(false);
                                String userid = (String)session.getAttribute("userid");
                                String first_name = (String)session.getAttribute("first_name");
                                String id= session.getId();
				if (first_name == null){ 
                                    response.sendRedirect("logout.jsp");}
				else{ 
                                    //IF THE VALUE IN SESSION IS NOT NULL THEN THE IS USER IS VALID
                                    out.print(" <h6 style=\"color:#ffffff\"> Welcome " +first_name+" </h6>");
                                }%>
			</div>
		</nav>
	</header>
	<!-- End header -->
	
	<div class="section lb" style="padding-top:30px">
        <div class="container">
            <div class="section-title row text-center">
                <div class="col-md-8 offset-md-2">
                    <h3>About Us</h3>
                    <p class="lead">I( developer), have developed a web-based application for shortening the interview selection process to a bit of extent. This Project does not totally fulfills each and every requirement however it will surely be helpful for users in the future.</p>
                </div>
            </div><!-- end title -->
            <div class="section-title row text-center">
                <div class="col-md-8 offset-md-2">
                    <h3>Privacy Policy</h3>
                    <p class="lead">Resume ATS (“we” or “us” or “our”) respects the privacy of our users (“user” or “you”). This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website, including any other media form, media channel, mobile website, or mobile application related or connected thereto (collectively, the “Site”). Please read this privacy policy carefully. If you do not agree with the terms of this privacy policy, please do not access the site.
                    We reserve the right to make changes to this Privacy Policy at any time and for any reason. We will alert you about any changes by updating the “Last Updated” date of this Privacy Policy. Any changes or modifications will be effective immediately upon posting the updated Privacy Policy on the Site, and you waive the right to receive specific notice of each such change or modification.
                    You are encouraged to periodically review this Privacy Policy to stay informed of updates. You will be deemed to have been made aware of, will be subject to, and will be deemed to have accepted the changes in any revised Privacy Policy by your continued use of the Site after the date such revised Privacy Policy is posted.
                    </p>
                </div>
            </div><!-- end title -->
            <div class="section-title row text-center">
                <div class="col-md-8 offset-md-2">
                    <h3>Collection of your Information</h3>
                    <p class="lead">We may collect information about you in a variety of ways. The information we may collect on the Site includes:</p>
                </div>
            </div>
            <div class="section-title row text-center">
                <div class="col-md-8 offset-md-2">
                    <h3>Personal Data</h3>
                    <p class="lead">Personal identifiable information, such as your name, address, email address, and telephone number, and demographic information, such as your age, gender, hometown, and interests, that you voluntarily give to us when you choose to participate in various activities related to the Site. You are under no obligation to provide us with personal information of any kind, however your refusal to do so may prevent you from using certain features of the Site.</p>
                </div>
            </div>
             <div class="section-title row text-center">
                <div class="col-md-8 offset-md-2">
                    <h3>Cookies</h3>
                    <p class="lead">We may use cookies, and other tracking technologies on the Site to help customize the Site and improve your experience. When you access the Site your personal information is not collected through the use of tracking technology. Most browsers are set to accept cookies by default. You can remove or reject cookies, but be aware that such action could affect the availability and functionality of the Site.</p>
            </div>
        </div><!-- end row -->
    </div><!-- end section -->
	

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'>
  </script><script  src="./js/script.js"></script>
</body>
</html>