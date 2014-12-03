<!DOCTYPE html>
	<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
	<%@ taglib prefix="webratio" uri="http://www.webratio.com/2006/TagLib/JSP20" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<% response.setHeader("X-UA-Compatible", "IE=edge"); %>
<webratio:Page page="page3"/>
<html lang="${LanguageISOCtxParam}">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
	    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<title>AddDeleteUsers</title>
		<c:set var="bootstrap-theme" value="default"/>
		<c:set var="wrAjaxDebugLevel" value="minimal"/>
			<c:if test="${(wrBoxed or wrAjaxCalling)}">
	<link href="<webratio:Resource path="WRResources/ajax/jquery-ui/themes/smoothness/jquery-ui.min.css"/>" type="text/css" rel="stylesheet" data-wr-resname="jquery-ui-style" data-wr-resver="1.9.2">
			</c:if>
			<c:if test="${(wrBoxed or wrAjaxCalling)}">
	<link href="<webratio:Resource path="WRResources/ajax/jquery-ui/themes/webratio/style.css"/>" type="text/css" rel="stylesheet" data-wr-resname="wr-ui-style" data-wr-resver="7.2.6">
			</c:if>
	<link href="<webratio:Resource path="builtin/960_Fluid_Nestable_12.css"/>" type="text/css" rel="stylesheet" data-wr-resname="wr-960gs-12">
			<c:if test="${not(empty webratio:expandLayoutResourceContent('BootstrapStyle/bootstrap-css', 'BootstrapStyle/dist/css/', pageContext))}">
	<link href="<webratio:Resource path="${webratio:expandLayoutResourceContent('BootstrapStyle/bootstrap-css', 'BootstrapStyle/dist/css/', pageContext)}"/>" type="text/css" rel="stylesheet" data-wr-resname="bootstrap-css">
			</c:if>
	<link href="<webratio:Resource path="builtin/grid_elements.css"/>" type="text/css" rel="stylesheet" data-wr-resname="wr-ui-gridsystem">
	<link href="<webratio:Resource path="BootstrapStyle/css/app.css"/>" type="text/css" rel="stylesheet" data-wr-resname="app-css">
<script>if (typeof wr !== "undefined") { wr.ui.html.resx.refreshLoaded(); }</script>
		<c:set var="wrAjaxDebugLevel" value="minimal"/>
	<script src="<webratio:Resource path="WRResources/ajax/jquery/jquery.min.js"/>" data-wr-resname="jquery" data-wr-resver="1.7.2"></script>
	<script src="<webratio:Resource path="WRResources/script.js"/>" data-wr-resname="wr-utils-supportscripts" data-wr-resver="7.2.6"></script>
			<c:if test="${(wrBoxed or wrAjaxCalling)}">
	<script src="<webratio:Resource path="WRResources/ajax/jquery-ui/jquery-ui.min.js"/>" data-wr-resname="jquery-ui" data-wr-resver="1.9.2"></script>
			</c:if>
			<c:if test="${(wrBoxed or wrAjaxCalling) and not(empty webratio:expandLayoutResourceContent('BUILTIN/wr-runtime', 'WRResources/ajax/webratio/', pageContext))}">
	<script src="<webratio:Resource path="${webratio:expandLayoutResourceContent('BUILTIN/wr-runtime', 'WRResources/ajax/webratio/', pageContext)}"/>" data-wr-resname="wr-runtime" data-wr-resver="7.2.6"></script>
<c:if test="${not wrAjax and not webratio:isWindow(pageContext)}">
	<script type="text/javascript">
		<c:choose>
			<c:when test="${wrBoxed}">
				(wr._configs = (wr._configs || {}))["${wrClientAppName}"] = (function() {
					var app = new wr.app.App("${wrClientAppName}");
					app.configure({
			</c:when>
			<c:otherwise>
				(function() { 
					wr.getApp().mergeConfig({
			</c:otherwise>
		</c:choose>
			log: {
				implementation: "wr.log.LogPlugin",
				appenders: [
					"wr.log.HtmlAppender"
				],
				categories: {
					<c:choose>
						<c:when test="${wrAjaxDebugLevel eq 'full'}">
							"": wr.log.Level.DEBUG
						</c:when>
						<c:otherwise>
							"": wr.log.Level.WARN,
							"wr.logic.AjaxRequestActor._response": wr.log.Level.DEBUG,
							"wr.ui.html.ElementViewer._code": wr.log.Level.DEBUG,
							"wr.widgets": wr.log.Level.DEBUG
						</c:otherwise>
					</c:choose>
				}
			},
		ui: {
			implementation: "wr.ui.UIPlugin",
			factories: {
				"display": "wr.ui.DisplayControlFactory",
				"window": "wr.ui.WindowControlFactory",
				"default": "wr.ui.ViewerBasedControlFactory"
			},
			display: { 
				factory: "display", 
				viewer: "wr.ui.web.BrowserViewer",
				views: {
					"${wrCurrentWindowName}": {
						factory: "window",
						viewer: "${wrBoxed ? 'wr.ui.web.BoxViewer' : 'wr.ui.web.WindowViewer'}",
						viewerConfig: { <c:if test="${wrBoxed}">boxSelector: "#wr-${wrClientAppName}"</c:if> },
						views: {
							"${wrCurrentWindowName}_page": {
								viewer: "wr.ui.html.ContainerElementViewer",
								viewerConfig: { containersFilter: ".wr-ajaxDiv" }
							}
						}
					}
				}
			}
		},
		nav: {
			implementation: "wr.nav.NavPlugin",
			routers: [ {
				name: "wr.nav.PropagationRouter",
				priority: -50
			}, {
				name: "wr.nav.HttpWebRouter",
				priority: -100
			} ]
		},
		logic: {
			implementation: "wr.logic.LogicPlugin"
		},
		oldajax: {
			implementation: "wr.LegacyAjaxPlugin",
				containersFilter: ".wr-ajaxDiv"
			}
		<c:choose>
			<c:when test="${wrBoxed}">
					}).chain(function() {
						app.init();
					}).chain(function() {
						app.start();
					});
				});
			</c:when>
			<c:otherwise>
					});
				})();
			</c:otherwise>
		</c:choose>
	</script>
</c:if>
			</c:if>
			<!--[if lt IE 9]>
	<script src="<webratio:Resource path="BootstrapStyle/js/html5shiv.min.js"/>" data-wr-resname="html5shiv"></script>
			<![endif]-->
			<!--[if lt IE 9]>
	<script src="<webratio:Resource path="BootstrapStyle/js/respond.min.js"/>" data-wr-resname="respond"></script>
			<![endif]-->
	<script src="<webratio:Resource path="BootstrapStyle/dist/js/bootstrap.min.js"/>" data-wr-resname="bootstrap-js"></script>
	<script src="<webratio:Resource path="BootstrapStyle/js/app.min.js"/>" data-wr-resname="app-js"></script>
<script>if (typeof wr !== "undefined") { wr.ui.html.resx.refreshLoaded(); }</script>
	</head>
<body class="bootstrap-default">
<a href="#main-content" class="sr-only">Skip to main content</a>
	<c:if test="${wrBoxed}">
		<div <c:if test="${not wrAjax}">id="wr-${wrClientAppName}" data-wr-appid="${wrClientAppName}"</c:if> class="wr-appui wr-appui-${wrClientAppName}">
	</c:if>
	<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
			<html:form action="form_page3.do${wrAjax ? '#!ajax=true' : ''}" styleId="page3FormBean" enctype="multipart/form-data">
			<html:hidden property="lastURL" styleId="lastURL_page3"/>
				<input type="hidden" name="ln22" value="<webratio:Link link="ln22"/>">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="page1.do">WebRatio</a>
			</div>
			<div class="navbar-collapse collapse">		      
	            <ul class="nav navbar-nav" role="menu">
								<li class="dropdown">
									<a href="<webratio:Link escapeXml="true" link="stu2.link"/>" class="dropdown-toggle" data-toggle="dropdown" data-target="#">Consumptions<span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
														<li>	
 <a class="" href="<webratio:Link link="page1.link"/>">
   Manage bills
</a>
 </li>
									</ul>
								</li>
								<li class="active dropdown">
									<a href="<webratio:Link escapeXml="true" link="page3.link"/>" class="dropdown-toggle" data-toggle="dropdown" data-target="#">Users<span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
													<li>	
 <a class="" href="<webratio:Link link="page3.link"/>">
   AddDeleteUsers
</a>
 </li>
													<li>	
 <a class="" href="<webratio:Link link="page2.link"/>">
   Find Neighbor Users
</a>
 </li>
									</ul>
								</li>
								<li class="dropdown">
									<a href="<webratio:Link escapeXml="true" link="page4.link"/>" class="dropdown-toggle" data-toggle="dropdown" data-target="#">Consumptions New Chart<span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
														<li>	
 <a class="" href="<webratio:Link link="page4.link"/>">
   Household Consumption
</a>
 </li>
									</ul>
								</li>
	            </ul>
	            <div class="nav navbar-right user-location">
	            </div>
			</div>
		</div>
	</nav>
<div class="container container-fixed-top-padding">
	<ol class="breadcrumb" aria-label="breadcrumbs">
		 <li>	
 <a class="small" href="<webratio:Link link="page3.link"/>">
   Users
</a>
 </li>
		<li class="active">AddDeleteUsers</li>
	</ol>
	<div class="page-header clearfix">
			<h1>AddDeleteUsers</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div id="main-content" role="main">
<div class="container_12">
			<div class="grid_12 alpha omega agrd_24">
<div class="panel panel-default ">
	<div class="panel-heading">
		<h2 class="panel-title">
			AddUser
		</h2>
	</div>
	<div class="panel-body">
<div class="EntryUnit ">
	<html:hidden property="enu7Key" styleId="enu7Key"></html:hidden>
	<div class="form-horizontal ">
	    <c:set var="btFieldError"><html:errors property="enu7"/></c:set>
		<c:if test="${not (empty btFieldError)}">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<html:errors property="enu7"/>
			</div>
		</c:if>
				<c:set var="btFieldError"><html:errors property="fld18"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="fld18" class="control-label col-md-2">username</label>
					<div class="controls col-md-10">
					<html:text   styleId="fld18" styleClass="wr-submitButtons:ln22  form-control " property="fld18" readonly="false"/>
					<c:set var="btFieldError"><html:errors property="fld18"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
				<c:set var="btFieldError"><html:errors property="fld19"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="fld19" class="control-label col-md-2">address</label>
					<div class="controls col-md-10">
					<html:text   styleId="fld19" styleClass="wr-submitButtons:ln22  form-control " property="fld19" readonly="false"/>
					<c:set var="btFieldError"><html:errors property="fld19"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
				<c:set var="btFieldError"><html:errors property="fld20"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="fld20" class="control-label col-md-2">password</label>
					<div class="controls col-md-10">
					<input type="password" autocomplete="off" id="fld20" class="wr-submitButtons:ln22 form-control " name="fld20"/>
					<c:set var="btFieldError"><html:errors property="fld20"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
				<c:set var="btFieldError"><html:errors property="fld21"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="fld21" class="control-label col-md-2">email</label>
					<div class="controls col-md-10">
					<html:text   styleId="fld21" styleClass="wr-submitButtons:ln22  form-control " property="fld21" readonly="false"/>
					<c:set var="btFieldError"><html:errors property="fld21"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
				<c:set var="btFieldError"><html:errors property="fld22"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="fld22" class="control-label col-md-2">city</label>
					<div class="controls col-md-10">
					<html:text   styleId="fld22" styleClass="wr-submitButtons:ln22  form-control " property="fld22" readonly="false"/>
					<c:set var="btFieldError"><html:errors property="fld22"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
				<c:set var="btFieldError"><html:errors property="fld23"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="fld23" class="control-label col-md-2">country</label>
					<div class="controls col-md-10">
					<html:text   styleId="fld23" styleClass="wr-submitButtons:ln22  form-control " property="fld23" readonly="false"/>
					<c:set var="btFieldError"><html:errors property="fld23"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
	</div>
	<div class="row"><div class="col-md-offset-2 col-md-10">
		<div class="form-group form-btn">
					 <button title="Add user" onclick="$('#page3FormBean')[0].target='_self'" class="btn  btn-default " id="button:ln22" name="button:ln22" type="submit" value="Add user">
			Add user</button>
		</div>
	</div></div>
</div>	
	</div>
</div>
			</div>
				<div class="clear"></div>
			<div class="grid_12 alpha omega agrd_24">
<c:if test="${not(empty pwu3) and (pwu3.dataSize gt 0)}">
<div class="panel panel-default ">
	<div class="panel-heading">
		<h2 class="panel-title">
			Users
		</h2>
	</div>
	<div class="panel-body">
		<div class="plain ">
			<div class="plain PowerIndexUnit">
				<div class="table-responsive">
				<table class="table table-bordered table-hover  table-striped ">
					<thead>
						<tr>
					        <th scope="col" class="">
						            userName
					        </th>
					        <th scope="col" class="">
						            email
					        </th>
					        <th scope="col" class="">
						            address
					        </th>
					        <th scope="col" class="">
						            city
					        </th>
					        <th scope="col" class="">
						            country
					        </th>
					        <th scope="col" class="">
						            latitude
					        </th>
					        <th scope="col" class="">
						            longitude
					        </th>
<th scope="col" class=" smallcol"></th> 
						</tr>
					</thead>
				<tbody>
				<c:forEach var="current" varStatus="status" items="${pwu3.data}">
					<c:set var="index" value="${status.index}"/>	
						<tr <c:if test="${pwu3.currentIndex eq index}">class="info"</c:if>>	
								<td class=" string">
										<c:out value="${current.userName}"/>
								</td>
								<td class=" string">
										<c:out value="${current.email}"/>
								</td>
								<td class=" string">
										<c:out value="${current.address}"/>
								</td>
								<td class=" string">
										<c:out value="${current.city}"/>
								</td>
								<td class=" string">
										<c:out value="${current.country}"/>
								</td>
								<td class=" decimal">
										<fmt:formatNumber value="${current.latitude}" pattern="${decimalPattern}"/>
								</td>
								<td class=" decimal">
										<fmt:formatNumber value="${current.longitude}" pattern="${decimalPattern}"/>
								</td>
									<td class=" smallcol">
										 <a title="delete" id="ln23" class=" " href="<webratio:Link link="ln23" position="index"/>" >
			delete</a>
									</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
</div>
</c:if>
			</div>
				<div class="clear"></div>
</div>
			</div>
		</div>
	</div>
	<hr class="footer-bar"/>
	<footer class="copy-footer" role="contentinfo">
		<p class="text-center">Generated by <a href="http://www.webratio.com" target="_blank" title="High Productivity Web and Mobile App Dev Platform">WebRatio<sup>&reg;</sup></a></p>
	</footer>
</div>
		</html:form>
		<script type="text/javascript">
			if (typeof wr !== "undefined" && wr.getApp().isConfigurable()) {
				wr.getApp().mergeConfig({
					"ui+": {
						autoFocusFirstWindow: true
					}
				});
			}
		</script>
</webratio:CollectScripts>
<c:if test="${wrBoxed}">
		</div>
		<c:if test="${not wrAjax}">
			<script type="text/javascript">
				jQuery(function($) {
					wr.ui.html.addRemoveListener($("#wr-${wrClientAppName}")[0], $.proxy(wr.runScoped, this, "${wrClientAppName}", wr.LegacyAjaxPlugin.exit));
				});
				wr._configs["${wrClientAppName}"]();
			</script>
		</c:if>
		<c:if test="${not(empty inlineScripts)}">
			<script type="text/javascript">
				wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
					${inlineScripts}
				});
			</script>
		</c:if>
</c:if>
</body>
</html>