<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.webratio.struts.WRGlobals" %>
<%@ page import="com.webratio.rtx.RTXManager" %>
<%@ page import="com.webratio.struts.exceptions.ErrorInterpreter" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="webratio" uri="http://www.webratio.com/2006/TagLib/JSP20" %>
<%
  RTXManager rtx = (RTXManager) application.getAttribute(WRGlobals.RTX_KEY); 
  ErrorInterpreter interpreter = new ErrorInterpreter(request);
%>
<html>
  <head>
    <link href="Resources/favicon.png" rel="shortcut icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
    <base href="<%=request.getContextPath()%>/"/>
    <title>Error</title>
    <c:if test="${not webratio:isWindow(pageContext)}">
	<link href="wr-css/global.css" type="text/css" rel="stylesheet"/>
	<link href="wr-css/menu.css" type="text/css" rel="stylesheet"/>
	<link href="wr-css/units.css" type="text/css" rel="stylesheet"/>
	<!--[if lt IE 9]>
		<script src="wr-js/respond.min.js" type="text/javascript"></script>
	<![endif]-->
	</c:if>
  </head>
  <body>
  	<c:if test="${not webratio:isWindow(pageContext)}">
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
				<span>Error</span>
			</div>
			
		</div>
	    
		<div id="body" class="container">	
			<div id="grid">
				
				<center>
					<div style="max-width: 600px;text-align: left;display: inline-block;" class="frame">
						<div class="frame-title">An error occurred</div>
						<div class="frame-content">
	</c:if>			
							<h3><%=interpreter.getMessage(ErrorInterpreter.XML_FORMAT)%></h3>
							<% if (interpreter.hasOccurred()) { %>
								<h4>Occurred on:</h4>
								<ul>
									<li><%=interpreter.getOccurred()%></li>
								</ul>
							<% } %>
							<% if (interpreter.hasDetails()) { %>
								<h4>Details:</h4>
								<ul>
								<% for (java.util.Iterator it = interpreter.getDetails(ErrorInterpreter.XML_FORMAT).iterator(); it.hasNext(); ) { %>
									<li><%=it.next()%></li>
								<% } %>
								</ul>
							<% } %>
							<% if (interpreter.hasFixes()) { %>
								<h4>Suggestions:</h4>
								<ul>
								<% for (java.util.Iterator it = interpreter.getFixes(ErrorInterpreter.XML_FORMAT).iterator(); it.hasNext(); ) { %>
									<li><%=it.next()%></li>
								<% } %>
								</ul>
							<% } %>
							<%if(rtx.getConfiguration().isDevelopmentMode()){%>
							<!--
							<%=interpreter.getExceptionStackTrace(ErrorInterpreter.XML_FORMAT)%>
							-->
							<%}%>
	<c:if test="${not webratio:isWindow(pageContext)}">
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
	</c:if>
  </body>
</html>
