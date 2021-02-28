<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/loading.css">	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/common.css">
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">	
		$(document).ready(function(){	
			
			if('${user}' == ""){				
				window.location.href='login.jsp';
			}
			$(".menuBar").click(function() {
				$(this).addClass("list") 
				.next().show() //
				.parent().siblings().children("a").removeClass("list")				
				.next().hide(); //
				return false;
			});
		});
	</script>
	<style type="text/css">
	
		body{
			background-image: url("img/hospitalback.jpeg");
			background-repeat: no-repeat;
  			background-size: 1370px 700px;	
		}
		
		#footer{
				    background-color:blanchedalmond;
				    height: 0.7in;
				    width: 100%;
				    margin-top: 1px;
				    border-top: 2px dashed blue;
				    border-bottom-right-radius: 1em;
				    
				}
				#footer p{
				    padding-top: 0px;
				   	padding: 1px;
				    text-align: center;
				    font-size: 12px;
				    color: darkslategrey;
				    line-height:20px;
				    margin-bottom:0px;				   
				}
				#footer a{
				    text-decoration: none ;
				    color:darkslategrey ;
				
				}
				#footer a:hover{
				    color: #DE1738;
				}
		
	</style>
  </head>
  
  <body>
    <div id="header">
		<div class="left">
			<label class="logo1"> Daily Care Hospital</label> &nbsp;
			<label class="logo2">Management System(SSH)</label>
		</div>
		<div class="hright">
			<div class="top">
				<p>${user.userName }</p>
				<a href="changePsw.jsp">Change Password</a>
			</div>
			<div class="bottom">
				<a href="userAction_signOut">Sign out</a>
			</div>
		</div>
	</div>
	<div id="box">	
		<div id="menu">
			<ul>
				<li class="home">
					<a href="javascript:clickMenu('<%=basePath%>welcome.jsp');">Home Page</a>
				</li>
				<li class="user"><a class="menuBar" href="javascript:void(0)">Admin Manage</a>
					<ul class="none">
						<li class="right"><a href="javascript:clickMenu('<%=basePath%>userAction_list');">Admin List</a></li>
						<%-- <li class="right"><a href="javascript:clickMenu('<%=basePath%>userAction_changePsw');">Change Psw</a></li> --%>
						<li class="right"><a href="changePsw.jsp">Change Psw</a></li>
					</ul>
				</li>
				<li class="student"><a class="menuBar" href="javascript:void(0)">Branch Manage</a>
					<ul class="none">
						<li class="right"><a href="javascript:clickMenu('<%=basePath%>studentAction_list');">Branch List</a></li>						
					</ul>
				</li>
				<li class="book"><a class="menuBar" href="javascript:void(0)">Doctor Manage</a>
					<ul class="none">
						<li class="right"><a href="javascript:clickMenu('<%=basePath%>bookCategoryAction_list');">DoctorCategory List</a></li>
						<li class="right"><a href="javascript:clickMenu('<%=basePath%>bookAction_list');">Doctors</a></li>
						<li class="right"><a href="javascript:clickMenu('<%=basePath%>bookAction_search');">Doctor Search</a></li>
						
						<%-- <li class="right"><a href="javascript:clickMenu('<%=basePath%>#');">Borrow</a></li>
						<li class="right"><a href="javascript:clickMenu('<%=basePath%>#');">Return</a></li> --%>
						
					</ul>
				</li>				
			</ul>
		</div>
		<div id="content">
			<iframe id="iframe" width="100%" style="border: 0px;" height="100%;"
				frameborder="0" scrolling="auto" src="<%=basePath%>welcome.jsp"></iframe>
			<div id="loadingDialog">
			  <div class="double-bounce1"></div>
			  <div class="double-bounce2"></div>
			</div>
		</div>
	</div>
	<div id="footer">
		<!-- <div style="text-align: center;">
			Copyright @ 2019 CQUT-LYH
		</div> -->
		
		<p>
	            <a href="https://www.cqut.edu.cn/">CHONGQING UNIVERSITY OF TECHNOLOGY</a>
	             
	         </p>
	         <p>Developer: <a href="www.facebook.com/anower33">MD Anower Hossain( an hao ming)</a>
	         </p>
                      <p> Student ID : 62017010084
	         </p>
             
		
	</div>
	<script type="text/javascript">
		function clickMenu(url) {
			$("#loadingDialog").css("display", "block");
			$('#iframe').attr('src', url);
		}
		$(document).ready(function(e){    
    	 	var iframe =document.getElementById("iframe");      
	        if (iframe.attachEvent) {    
	        	//
	            iframe.attachEvent("onload", function() {      
	            	$("#loadingDialog").css("display", "none");
	            });      
	        } else {      
	            iframe.onload = function() {      
	            	$("#loadingDialog").css("display", "none");
	            };      
	        }    
	    });
	</script>
  </body>
</html>
