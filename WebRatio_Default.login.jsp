<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<% 	
	response.setHeader("Cache-Control", "no-store,no-cache, must-revalidate");
	response.setDateHeader("Expires", -1);
	response.setHeader("Pragma", "No-cache");
%>
<html>
  <head>
    <link href="Resources/favicon.png" rel="shortcut icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
    <base href="<%=request.getContextPath()%>/"/>
    <title>Login Required</title>
	<link href="wr-css/global.css" type="text/css" rel="stylesheet"/>
	<link href="wr-css/menu.css" type="text/css" rel="stylesheet"/>
	<link href="wr-css/units.css" type="text/css" rel="stylesheet"/>
	<!--[if lt IE 9]>
		<script src="wr-js/respond.min.js" type="text/javascript"></script>
	<![endif]-->
  </head>
  <body>
	<html:form action="loginAction.do" enctype="multipart/form-data">
		<html:hidden property="lastURL"/>
		<div id="top">
	    	<div class="user"></div>
	    	<div class="logo">
	    		<div class="container">
	    			<a href="index.jsp" title="Home"><img src="wr-images/logo_big.png" width="264" height="66" alt="WebRatio"></a>
	    		</div>
	    	</div>
	    	<div class="main-menu"></div>
	    </div>
	    <div class="container">
			<div id="breadcrumb">
				<a href="index.jsp" title="Home"><img src="wr-images/home_bc.png" width="12" height="11" alt="Home"></a>
				<span class="sep">&rsaquo;</span>
				<span>Please login</span>
			</div>
			
		</div>
	    
		<div id="body" class="container">	
			<div id="grid">
				
				<center>
					<div style="width: 280px;" class="frame">
						<div class="frame-title">Please login</div>
						<div class="frame-content">
							<div class="plain EntryUnit ">
								<table cellspacing="0">
									<tr>
										<th valign="middle" class="header">
											Username
										</th>
										<td valign="middle" nowrap="nowrap" class="value">
										  <input type="text" name="userName" autocomplete="off" class="field wr-submitButtons:login">
										</td>
									 </tr>
									<tr>
										<th valign="middle" class="header">
											Password
										</th>
										<td valign="middle" nowrap="nowrap" class="value">
							              <input type="password" name="password" autocomplete="off" class="field wr-submitButtons:login">
										</td>
									 </tr>
									 <tr>
										<td colspan="2">
											<input class="button" type="submit" value="Login" id="button:login">
							   			</td>
									 </tr>
						  		</table>
							</div>
						</div>
					</div>
				</center>

	    	</div>
	  	</div>
		<div id="copyright">
			<div class="container">
				<div style="color: #666; font-family: Tahoma; font-size: small; text-decoration: none;">
					<span>|</span>
					<span>generated by</span>
					<a target="_blank" title="WebRatio | High Productivity Web and Mobile App Dev Platform" href="http://www.webratio.com" style="color: #666;font-family: Tahoma;font-size: small;text-decoration: none;"><span style="color: #036; padding: 0px; margin: 0px;">Web</span><img style="width: 8px; height: 8px; border: 0px; padding: 0px; margin: 0px;" alt="Generated by WebRatio" src="WRResources/WRLogo8.png" ><span style="color: #C00; padding: 0px; margin: 0px;">Ratio</span></a><sup style="font-size: 80%;">&reg;</sup>
					<span>|</span>
				</div>
			</div>
		</div>
	</html:form>
  </body>
</html>