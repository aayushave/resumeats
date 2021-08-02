<%-- 
    Document   : index.jsp
    Created on : 07 May, 2021, 10:43:50 AM
    Author     : pratikg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
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
                                                <li ><a class="nav-link bg-danger text-white" href="logout">Logout</a></li>
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
                                String last_name = (String)session.getAttribute("last_name");
                                String email = (String)session.getAttribute("email");
                                String dob = (String)session.getAttribute("dob");
                                String phonenumber = (String)session.getAttribute("phonenumber");
                                String id= session.getId();
				if (first_name == null){ 
                                    response.sendRedirect("logout");}
				else{ 
                                    //IF THE VALUE IN SESSION IS NOT NULL THEN THE IS USER IS VALID
                                    out.print(" <h6 style=\"color:#ffffff\"> Welcome " +first_name+" </h6>");
                                }%>
					
                                 	
			</div>
		</nav>
	</header>
	<!-- End header -->
	
	
	
<div class="form">
      	  <!--Tab-content-->
        <div class="tab-content">
                <ul class="tab-group">
                <li class="tab active"><a href="#register">Apply</a></li>
                        <li class="tab "><a href="#validate">Check Eligibility</a></li>
                </ul>
        </div>
            <div class="tab-content">
		<div id="register">   
			<h1 style="color:white;padding-bottom:10px">Fill Details</h1>
			<form action="post_resume" method="post">
          
				<div class="field-wrap">
					<% out.print(" <input type='hidden' required name='userid' value='" +userid+ "' />");%>
				</div>
                                <div class="field-wrap">
					<% out.print(" <input type='text' required autocomplete='off' placeholder='First Name' name='first_name' value='" +first_name+ "' readonly='readonly'/>");%>
				</div>
				<div class="field-wrap">
					<% out.print(" <input type='text' required autocomplete='off' placeholder='Last Name' name='last_name' value='" +last_name+ "' readonly='readonly'/>");%>
				</div>
				<div class="field-wrap">
					<% out.print(" <input type='email' required autocomplete='off' placeholder='Email' name='email' value='" +email+ "' readonly='readonly' />");%>
				</div>
                                <div class="field-wrap">
					<% out.print(" <input type='date' required autocomplete='off'  name='dob' value='" +dob+ "' readonly='readonly' />");%>
				</div>
                                <div class="field-wrap">
					<% out.print(" <input type='text' required autocomplete='off' placeholder='Phone Number' name='phonenumber' pattern='^[7-9]{1}[0-9]{9}$' value='" +phonenumber+ "' readonly='readonly'/>");%>
				</div>
                                <div class="field-wrap">
                                    <label>
                                        Engineering Stream
                                    </label>
                                    <select name="engineering_stream" id="engineering_stream" required autocomplete="off">
                                    <option value="COMPUTER_ENGINEERING" selected>Computer Engineering</option>
                                    <option value="ENTC_ENGINEERING">E&TC Engineering</option>
                                    <option value="ELECTRICAL_ENGINEERING">Electrical Engineering</option>
                                    <option value="INFORMATION_TECHNOLOGY">Information Technology</option>
                                    <option value="INSTRUMENTATION_ENGINEERING">Instrumentation Engineering</option>
                                    <option value="MECHANICAL_ENGINEERING">Mechanical Engineering</option>
                                    </select>
				</div>
                                <div class="field-wrap">
                                    <input type="text" required autocomplete="off" placeholder="Engineering CGPA (format : X.XX)" name="engineering_cgpa" pattern="^[0-9].[0-9][0-9]$"/>
				</div>
                                <div class="field-wrap">
                                    <label>
                                        Diploma Student ?<span class="req">*</span>
                                    </label>
                                    <select name="diploma_done" id="diploma_done" required autocomplete="off">
                                    <option value="NO" selected >NO</option>
                                    <option value="YES">YES</option>
                                    </select>
				</div>
                                <label>
                                   <span class="req">*</span> Keep Diploma Percentage field 00.00 if not done diploma else (format : XX.XX)<span class="req">*</span>
                                </label>
                                <div class="field-wrap">
                                    <input type="text"  autocomplete="off" placeholder="Diploma Percentage" value="00.00" name="diploma_percentage" pattern="^[0-9][0-9].[0-9][0-9]$"/>
				</div>
                                <div class="field-wrap">
                                    <label>
                                       Proficiency in Tools|Programming Languages?<span class="req">*</span>
                                    </label>
                                    <select name="proficiency_count" id="proficiency_count" required autocomplete="off">
                                    <option value="0" selected >0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    </select>
				</div>
                                <div class="field-wrap">
                                    <textarea  autocomplete="off" placeholder="List Technologies|Tools|Programming Languages (max 150 char)" rows="4" maxlength="150" name="list_proficiency"></textarea>
				</div>
                                <div class="field-wrap">
                                    <label>
                                       Prior Experience?<span class="req">*</span>
                                    </label>
                                    <select name="prior_experience" id="prior_experience" required autocomplete="off">
                                    <option value="NO" selected >NO</option>
                                    <option value="YES">YES</option>
                                    </select>
				</div>
                                <div class="field-wrap">
                                    <textarea  autocomplete="off" placeholder="List Experience in brief (max 150 char)" rows="4" maxlength="150" name="list_experience"></textarea>
				</div>
                                <div class="field-wrap">
                                    <label>
                                        Applying for job?
                                    </label>
                                    <select name="apply_job" id="apply_job" required autocomplete="off">
                                    <option value="SOFTWARE_DEVELOPER" >SOFTWARE_DEVELOPER | IBM</option>
                                    <option value="BLOCKCHAIN_DEVELOPER" >BLOCKCHAIN_DEVELOPER | UBISOFT</option>
                                     <option value="SOFTWARE_DEVELOPER" >SOFTWARE_DEVELOPER | UBISOFT</option>
                                     <option value="SOFTWARE_TEST_DEVELOPER" >SOFTWARE_TEST_DEVELOPER | UBISOFT</option>
                                    <option value="JAVA_DEVELOPER" >JAVA_DEVELOPER | TCS</option>
                                    <option value="ASP_DEVELOPER" >ASP_DEVELOPER | TCS</option>
                                    <option value="UI/UX_DEVELOPER" >UI/UX_DEVELOPER | OGEE</option>
                                    <option value="FRONT_END_DEVELOPER" >FRONT_END_DEVELOPER | WIPRO</option>
                                    <option value="REACT_NATIVE_DEVELOPER" >REACT_NATIVE_DEVELOPER | INFOSYS</option>
                                    <option value="ROR_DEVELOPER" >ROR_DEVELOPER | INFOSYS</option>
                                    
                                    
                                    
                                    
                                    </select>
				</div>
                                <div class="field-wrap">
                                    <label>
                                        Confirm Applying for?
                                    </label>
                                    <select name="company_applied" id="apply_job" required autocomplete="off">
                                    <option value="IBM" >SOFTWARE_DEVELOPER | IBM</option>
                                    <option value="UBISOFT" >BLOCKCHAIN_DEVELOPER | UBISOFT</option>
                                     <option value="UBISOFT" >SOFTWARE_DEVELOPER | UBISOFT</option>
                                     <option value="UBISOFT" >SOFTWARE_TEST_DEVELOPER | UBISOFT</option>
                                    <option value="TCS" >JAVA_DEVELOPER | TCS</option>
                                    <option value="TCS" >ASP_DEVELOPER | TCS</option>
                                    <option value="OGEE" >UI/UX_DEVELOPER | OGEE</option>
                                    <option value="WIPRO" >FRONT_END_DEVELOPER | WIPRO</option>
                                    <option value="INFOSYS" >REACT_NATIVE_DEVELOPER | INFOSYS</option>
                                    <option value="INFOSYS" >ROR_DEVELOPER | INFOSYS</option>
                                    
                                    
                                    
                                    
                                    </select>
				</div>
                                        
				<button type="submit" class="button button-block"/>Apply Now</button>
          
			</form>
		</div>
                <div id="validate">   
			<h1 style="color:white;padding-bottom:10px">Check Eligibility</h1>
			<form action="get_result" method="post">
                                <div class="field-wrap">
                                    <div class="field-wrap">
					<% out.print(" <input type='text' required autocomplete='off' placeholder='User id' name='userid' value='" +userid+ "' readonly='readonly'/>");%>
                                    </div>
                                    <label>
                                        Applied job.
                                    </label>
                                    <div class="field-wrap">
                                    <select name="applied_job" id="applied_job" required autocomplete="off">
        <%
    try{
    String apply_job,company_field;
    String sql="select userid,company_applied,apply_job from dbresume where userid='"+userid+"'";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
    PreparedStatement ps=con.prepareStatement(sql);
           
    ResultSet rs=ps.executeQuery(sql);
    while(rs.next()){
        apply_job=rs.getString("apply_job");
        company_field= rs.getString("company_applied");
        session.setAttribute("apply_job",apply_job);
        session.setAttribute("companyy",company_field);   
%>                     
            <% out.print(" <option value='" +apply_job+ "' > " +apply_job+" | "+company_field+ "</option>");%>
<%          }
    }
    catch(Exception e){
        e.printStackTrace();
    }
%>                                        
				</select>
				</div>
                                <label>
                                        Confirm Applied job. 
                                    </label>
                                    <div class="field-wrap">
                                    <select name="companyy" id="applied_job" required autocomplete="off">
        <%
    try{
    String apply_job,company_field;
    String sql="select userid,company_applied,apply_job from dbresume where userid='"+userid+"'";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
    PreparedStatement ps=con.prepareStatement(sql);
           
    ResultSet rs=ps.executeQuery(sql);
    while(rs.next()){
        apply_job=rs.getString("apply_job");
        company_field= rs.getString("company_applied");
        session.setAttribute("apply_job",apply_job);
        session.setAttribute("companyy",company_field);   
%>                     
            <% out.print(" <option value='" +company_field+ "' > " +apply_job+" | "+company_field+ "</option>");%>
<%          }
    }
    catch(Exception e){
        e.printStackTrace();
    }
%>                                        
				</select>
				</div>
				<div class="field-wrap">
                                    <textarea  autocomplete="off" rows="4" disabled >By submitting, you agree to terms and conditions, correctness of information, and use of information.</textarea>
                                </div>
				<button class="button button-block"/>Get Result</button>
			</form>
		</div>
            </div>
	  <!-- End-Tab-Content -->
      
</div> 
<!-- /form -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./js/script.js"></script>
</body>
</html>

