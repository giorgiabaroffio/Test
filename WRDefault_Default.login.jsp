<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<% 	
	response.setHeader("Cache-Control", "no-store,no-cache, must-revalidate");
	response.setDateHeader("Expires", -1);
	response.setHeader("Pragma", "No-cache");
%>
<html>
<head>
	<base href="<%=request.getContextPath()%>/"/>
    <link href="Resources/favicon.png" rel="shortcut icon"/>
	<title>Login Required</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<script src="WRResources/ajax/jquery/jquery.min.js" type="text/javascript" rel="javascript"></script>	
	<script src="WRResources/script.js" type="text/javascript" rel="javascript"></script>
</head>
<body>
	<html:form action="loginAction.do" enctype="multipart/form-data">
		<html:hidden property="lastURL"/>
		<table width="100%">
			<tr>
				<td><h1>Please Login</h1></td>
			</tr>
		</table>
		<table width="100%">
			<tr>
				<td valign="top">
					<div class="plain EntryUnit">
						<table>
							<tr>
								<th valign="middle" class="header">
									Username
								</th>
								<td valign="middle" nowrap="nowrap" class="value">
									<input type="text" name="userName" autocomplete="off" class="field wr-submitButtons:login"/>
								</td>
							</tr>
							<tr>
								<th valign="middle" class="header">
									Password
								</th>
								<td valign="middle" nowrap="nowrap" class="value">
									<input type="password" name="password" autocomplete="off" class="field wr-submitButtons:login"/>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<table>
										<tr>
											<td>
												<input class="button" type="submit" value="Login" id="button:login">
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</html:form>
</body>
</html>
