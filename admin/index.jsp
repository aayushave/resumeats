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
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/responsive.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp">
					<img src="../images/logo-admin.png" alt="" /> 
				</a>
				<div class="navbar" id="navbars-host">
                                    <ul class="navbar-nav ml-auto">
						<li ><a class="nav-link bg-light" href="index.jsp">Home</a></li>
						<li ><a class="nav-link bg-light" href="privacy.jsp">Privacy Policy</a></li>
                                                <li ><a class="nav-link bg-danger text-white" href="../logout">Logout</a></li>
					</ul>
					
				</div>
                            <%
                                //HERE WE GETTING THE ATTRIBUTE DECLARED IN VALIDATE.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
				response.setHeader("Cache-Control","no-cache");
                                response.setHeader("Cache-Control","no-store");
                                response.setHeader("Pragma","no-cache");
                                response.setDateHeader ("Expires", 0);
                                
                                session = request.getSession(true);
                                String userid = (String)session.getAttribute("userid");
                                String first_name = (String)session.getAttribute("first_name");
                                String last_name = (String)session.getAttribute("last_name");
                                String email = (String)session.getAttribute("email");
                                String dob = (String)session.getAttribute("dob");
                                String phonenumber = (String)session.getAttribute("phonenumber");
                                String company=(String)session.getAttribute("company");
                                String id= session.getId();
				if (first_name == null){ 
                                    response.sendRedirect("../logout");}
				else{ 
                                    //IF THE VALUE IN SESSION IS NOT NULL THEN THE IS USER IS VALID
                                    out.print(" <h6 style=\"color:#ffffff\"> Welcome " +company+" | " +first_name+" </h6>");
                                    
                                }%>
					
                                 	
			</div>
		</nav>
	</header>
	<!-- End header -->
	
	
	
<div class="forma">
      	  <!--Tab-content-->
        <div class="tab-content">
                <ul class="tab-group">
                <li class="tab active"><a href="#register">All Students</a></li>
                <li class="tab"><a href="#validate">Shortlisted Students</a></li>
                </ul>
        </div>
            <div class="tab-content">
		<div id="register">   
			<h1 style="color:white;padding-bottom:10px">All Students</h1>
			<form>
          <div class="table-responsive">
              <table>
          <thead>
            <tr>
              <th scope="col">JOB_ID</th>
              <th scope="col">USER_ID</th>
              <th scope="col">JOB_APPLIED</th>
              <th scope="col">FIRST_NAME</th>
              <th scope="col">LAST_NAME</th>
              <th scope="col">EMAIL</th>
              <th scope="col">PHONE_NUMBER</th>
              <th scope="col">ENGG_STREAM</th>
              <th scope="col">ENGG_CGPA</th>
              <th scope="col">DIPLOMA_STUDENT</th>
               <th scope="col">DIPLOMA_PERCENTAGE</th>
                <th scope="col">WORK_EXPERIENCE</th>
            </tr>
          </thead>
          <tbody>
            <%
    try{
    String sql="select * from dbresume where company_applied='"+company+"'";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
    PreparedStatement ps=con.prepareStatement(sql);
           
    ResultSet rs=ps.executeQuery(sql);
    while(rs.next()){
        String dserialid,duserid,dfirst_name,dlast_name,demail,dphonenumber,dengineering_stream,dengineering_cgpa;
        dserialid=rs.getString("serialid");
        duserid=rs.getString("userid");
        dfirst_name=rs.getString("first_name");
        dlast_name=rs.getString("last_name");
        demail=rs.getString("email");
        dphonenumber=rs.getString("phonenumber");
        dengineering_stream=rs.getString("engineering_stream");
        dengineering_cgpa=rs.getString("engineering_cgpa");
%><tr>
              
              <td><%=rs.getString("serialid")%></td>
              <td><%=rs.getString("userid")%></td>
              <td><%=rs.getString("apply_job")%></td>
              <td><%=rs.getString("first_name")%></td>
              <td><%=rs.getString("last_name")%></td>
              <td><%=rs.getString("email") %></td>
              <td><%=rs.getString("phonenumber") %></td>
              <td><%=rs.getString("engineering_stream") %></td>
              <td><%=rs.getString("engineering_cgpa") %></td>
              <td><%=rs.getString("diploma_done") %></td>
              <td><%=rs.getString("diploma_percentage") %></td>
              <td><%=rs.getString("prior_experience") %></td>
            </tr>
   <% } 
    ps.clearParameters();
    ps.close();
    rs.close();
    con.close();
    }
    catch(Exception e){
        e.printStackTrace();
    }
   %>    
          </tbody>
        </table>
          </div>
        </form>
    </div>
          
    <div id="validate">   
<h1 style="color:white;padding-bottom:10px">Shortlisted Students</h1>
			<form>
          <div class="table-responsive">
              <table>
          <thead>
            <tr>
              <th scope="col">JOB_ID</th>
              <th scope="col">USER_ID</th>
              <th scope="col">JOB_APPLIED</th>
              <th scope="col">FIRST_NAME</th>
              <th scope="col">LAST_NAME</th>
              <th scope="col">EMAIL</th>
              <th scope="col">PHONE_NUMBER</th>
              <th scope="col">ENGG_STREAM</th>
              <th scope="col">ENGG_CGPA</th>
              <th scope="col">DIPLOMA_STUDENT</th>
               <th scope="col">DIPLOMA_PERCENTAGE</th>
                <th scope="col">WORK_EXPERIENCE</th>
            </tr>
          </thead>
          <tbody>
            <%
    try{
    String sql="select * from dbshortlist where company_applied='"+company+"'";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
    PreparedStatement pss=conn.prepareStatement(sql);
           
    ResultSet rss=pss.executeQuery(sql);
    while(rss.next()){
        String dserialid,duserid,dfirst_name,dlast_name,demail,dphonenumber,dengineering_stream,dengineering_cgpa;
        dserialid=rss.getString("serialid");
        duserid=rss.getString("userid");
        dfirst_name=rss.getString("first_name");
        dlast_name=rss.getString("last_name");
        demail=rss.getString("email");
        dphonenumber=rss.getString("phonenumber");
        dengineering_stream=rss.getString("engineering_stream");
        dengineering_cgpa=rss.getString("engineering_cgpa");
%><tr>
              
              <td><%=rss.getString("serialid")%></td>
              <td><%=rss.getString("userid")%></td>
              <td><%=rss.getString("apply_job")%></td>
              <td><%=rss.getString("first_name")%></td>
              <td><%=rss.getString("last_name")%></td>
              <td><%=rss.getString("email") %></td>
              <td><%=rss.getString("phonenumber") %></td>
              <td><%=rss.getString("engineering_stream") %></td>
              <td><%=rss.getString("engineering_cgpa") %></td>
              <td><%=rss.getString("diploma_done") %></td>
              <td><%=rss.getString("diploma_percentage") %></td>
              <td><%=rss.getString("prior_experience") %></td>
            </tr>
   <% }
    pss.clearParameters();
    pss.close();
    rss.close();
    conn.close();
    }
    catch(Exception e){
        e.printStackTrace();
    }%>    
          </tbody>
        </table>
          </div>
        </form>
    </div>

</div>
	  <!-- End-Tab-Content -->
          
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="../js/script.js"></script>
</body>
</html>

