<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changePsw.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<style type="text/css">
		.container {width:500px;}
	</style>
  </head>
  
  <body>
    <%
  		entity.User user = (entity.User)session.getAttribute("user");
  		String userName = user.getUserName();
  	 %>
    <nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="#">Admin Manage	</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Change Psw</li>
	  </ol>
	</nav>
    <div class="container">
    <h2>The Admin change password page.</h2> <br>
    <form  method="post" action="userAction_changePsw">  
    	<div class="form-group">
		    <label for="userName">User Name</label>
		    <input type="text" class="form-control" id="userName" name="userName" value="<%=userName %>" readonly="readonly" >		   
	    </div>
	    <div class="form-group">
		    <label for="oldPassword">Old Password</label>
		    <input type="password" class="form-control" id="oldPassword"  name="oldPassword">		   
	    </div>
	    <div class="form-group">
		    <label for="newPassword">New Password</label>
		    <input type="password" class="form-control" id="newPassword"  name="newPassword">		   
	    </div>
	    <div class="form-group">
		    <label for="newPasswordRepeate">Repeat New Password</label>
		    <input type="password" class="form-control" id="newPasswordRepeate"  name="newPasswordRepeate">		   
	    </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
    </form>
     ${msg }
    </div>
  </body>
</html>
