<!DOCTYPE html>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
	<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
	<%@ taglib prefix="webratio" uri="http://www.webratio.com/2006/TagLib/JSP20" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<% response.setHeader("X-UA-Compatible", "IE=edge"); %>
<webratio:Page page="page1"/>
<html lang="${LanguageISOCtxParam}">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
	    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<title>Manage bills</title>
		<c:set var="bootstrap-theme" value="default"/>
		<c:set var="wrAjaxDebugLevel" value="minimal"/>
	<link href="<webratio:Resource path="WRResources/ajax/jquery-ui/themes/smoothness/jquery-ui.min.css"/>" type="text/css" rel="stylesheet" data-wr-resname="jquery-ui-style" data-wr-resver="1.9.2">
	<link href="<webratio:Resource path="ChartStyle/css/components.css"/>" type="text/css" rel="stylesheet" data-wr-resname="ChartStyle-components-style">
			<c:if test="${(wrBoxed or wrAjaxCalling)}">
	<link href="<webratio:Resource path="WRResources/ajax/jquery-ui/themes/webratio/style.css"/>" type="text/css" rel="stylesheet" data-wr-resname="wr-ui-style" data-wr-resver="7.2.6">
			</c:if>
	<link href="<webratio:Resource path="builtin/960_Fluid_Nestable_12.css"/>" type="text/css" rel="stylesheet" data-wr-resname="wr-960gs-12">
	<link href="<webratio:Resource path="WRResources/timepicker/jquery-ui-timepicker-addon.css"/>" type="text/css" rel="stylesheet" data-wr-resname="richardson-timepicker-style" data-wr-resver="1.4.5">
	<link href="<webratio:Resource path="builtin/grid_elements.css"/>" type="text/css" rel="stylesheet" data-wr-resname="wr-ui-gridsystem">
			<c:if test="${not(empty webratio:expandLayoutResourceContent('BootstrapStyle/bootstrap-css', 'BootstrapStyle/dist/css/', pageContext))}">
	<link href="<webratio:Resource path="${webratio:expandLayoutResourceContent('BootstrapStyle/bootstrap-css', 'BootstrapStyle/dist/css/', pageContext)}"/>" type="text/css" rel="stylesheet" data-wr-resname="bootstrap-css">
			</c:if>
	<link href="<webratio:Resource path="BootstrapStyle/css/app.css"/>" type="text/css" rel="stylesheet" data-wr-resname="app-css">
<script>if (typeof wr !== "undefined") { wr.ui.html.resx.refreshLoaded(); }</script>
		<c:set var="wrAjaxDebugLevel" value="minimal"/>
	<script src="<webratio:Resource path="WRResources/ajax/jquery/jquery.min.js"/>" data-wr-resname="jquery" data-wr-resver="1.7.2"></script>
	<script src="<webratio:Resource path="WRResources/script.js"/>" data-wr-resname="wr-utils-supportscripts" data-wr-resver="7.2.6"></script>
	<script src="<webratio:Resource path="WRResources/ajax/jquery-ui/jquery-ui.min.js"/>" data-wr-resname="jquery-ui" data-wr-resver="1.9.2"></script>
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
			<c:if test="${not(empty webratio:expandLayoutResourceContent('BUILTIN/jquery-ui-datepicker-lang', 'WRResources/ajax/jquery-ui/i18n/', pageContext))}">
	<script src="<webratio:Resource path="${webratio:expandLayoutResourceContent('BUILTIN/jquery-ui-datepicker-lang', 'WRResources/ajax/jquery-ui/i18n/', pageContext)}"/>" data-wr-resname="jquery-ui-datepicker-lang" data-wr-resver="1.9.2"></script>
			</c:if>
	<script src="<webratio:Resource path="BootstrapStyle/js/app.min.js"/>" data-wr-resname="app-js"></script>
	<script src="<webratio:Resource path="WRResources/timepicker/jquery-ui-timepicker-addon.js"/>" data-wr-resname="richardson-timepicker" data-wr-resver="1.4.5"></script>
	<script src="<webratio:Resource path="WRResources/ajax/webratio/calendar-utils.js"/>" data-wr-resname="wr-calendar-utils" data-wr-resver="7.2.6"></script>
			<c:if test="${not(empty webratio:expandLayoutResourceContent('BUILTIN/richardson-timepicker-lang', 'WRResources/timepicker/i18n/', pageContext))}">
	<script src="<webratio:Resource path="${webratio:expandLayoutResourceContent('BUILTIN/richardson-timepicker-lang', 'WRResources/timepicker/i18n/', pageContext)}"/>" data-wr-resname="richardson-timepicker-lang" data-wr-resver="1.4.5"></script>
			</c:if>
<script>if (typeof wr !== "undefined") { wr.ui.html.resx.refreshLoaded(); }</script>
	</head>
<body class="bootstrap-default">
<a href="#main-content" class="sr-only">Skip to main content</a>
	<c:if test="${wrBoxed}">
		<div <c:if test="${not wrAjax}">id="wr-${wrClientAppName}" data-wr-appid="${wrClientAppName}"</c:if> class="wr-appui wr-appui-${wrClientAppName}">
	</c:if>
	<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
			<html:form action="form_page1.do${wrAjax ? '#!ajax=true' : ''}" styleId="page1FormBean" enctype="multipart/form-data">
			<html:hidden property="lastURL" styleId="lastURL_page1"/>
				<input type="hidden" name="ln2" value="<webratio:Link link="ln2"/>">
				<input type="hidden" name="ln13" value="<webratio:Link link="ln13"/>">
				<input type="hidden" name="ln9" value="<webratio:Link link="ln9"/>">
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
								<li class="active dropdown">
									<a href="<webratio:Link escapeXml="true" link="stu2.link"/>" class="dropdown-toggle" data-toggle="dropdown" data-target="#">Consumptions<span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
													<li>	
 <a class="" href="<webratio:Link link="page1.link"/>">
   Manage bills
</a>
 </li>
									</ul>
								</li>
								<li class="dropdown">
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
 <a class="small" href="<webratio:Link link="stu2.link"/>">
   Consumptions
</a>
 </li>
		<li class="active">Manage bills</li>
	</ol>
	<div class="page-header clearfix">
			<h1>Manage bills</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div id="main-content" role="main">
<div class="container_12">
			<div class="grid_12 alpha omega agrd_24">
<div class="panel panel-default ">
	<div class="panel-heading">
		<h2 class="panel-title">
			AddConsumption
		</h2>
	</div>
	<div class="panel-body">
<div class="EntryUnit ">
	<html:hidden property="enu1Key" styleId="enu1Key"></html:hidden>
	<div class="form-horizontal ">
	    <c:set var="btFieldError"><html:errors property="enu1"/></c:set>
		<c:if test="${not (empty btFieldError)}">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<html:errors property="enu1"/>
			</div>
		</c:if>
				<c:set var="btFieldError"><html:errors property="fld2_locale"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="fld2_locale" class="control-label col-md-2">quantity</label>
					<div class="controls col-md-10">
					<html:text   styleId="fld2_locale" styleClass="wr-submitButtons:ln2  form-control " property="fld2_locale" readonly="false"/>
					<c:set var="btFieldError"><html:errors property="fld2_locale"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
				<c:set var="btFieldError"><html:errors property="fld3_locale"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="fld3_locale" class="control-label col-md-2">timestamp</label>
					<div class="controls col-md-10">
					<div class="input-calendar input-group">
				<html:text  styleId="fld3_locale" styleClass="wr-submitButtons:ln2 form-control " property="fld3_locale" readonly="false"/>
				<span class="input-group-btn">
				<c:choose><c:when test="false">
					<button disabled class="btn btn-default" id="fld3_locale_calendar" type="button"><span class="glyphicon glyphicon-calendar"></span></button>
				</c:when><c:otherwise>
					<button class="btn btn-default" id="fld3_locale_calendar" type="button"><span class="glyphicon glyphicon-calendar"></span>
							<script type="text/javascript">
								jQuery(function($) { 								
									var pattern = $.wr.calendar.timestampConfigFromJava("${timestampPattern}");
									$('#fld3_locale').datetimepicker({
										showOn: "none",
										showWeek: true,
										showButtonPanel: true,
										dateFormat: pattern.dateFormat,
										firstDay: <%= java.util.Calendar.getInstance((java.util.Locale) session.getAttribute(org.apache.struts.Globals.LOCALE_KEY)).getFirstDayOfWeek() - 1 %>,
										timeFormat: pattern.timeFormat,
										ampm: pattern.ampm,
										separator: pattern.separator
									});
									$('#fld3_locale_calendar').on('click', function(e) {
										e.preventDefault();
										$('#fld3_locale').datetimepicker('show');									
									});
								});
							</script>
					</button>
				</c:otherwise></c:choose>
				</span>
			</div>
					<c:set var="btFieldError"><html:errors property="fld3_locale"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
				<c:set var="btFieldError"><html:errors property="sfld2"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="sfld2" class="control-label col-md-2">user</label>
					<div class="controls col-md-10">
					<html:select styleId="sfld2" styleClass="wr-submitButtons:ln2 form-control " property="sfld2" disabled="false">
				  		<html:option value=""><bean:message key="selectionfield.noselection"/></html:option>
				    <html:options property="sfld2List" labelProperty="sfld2LabelList_locale"/>
				</html:select>
					<c:set var="btFieldError"><html:errors property="sfld2"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
	</div>
	<div class="row"><div class="col-md-offset-2 col-md-10">
		<div class="form-group form-btn">
					 <button title="Add Consumption" onclick="$('#page1FormBean')[0].target='_self'" class="btn  btn-default " id="button:ln2" name="button:ln2" type="submit" value="Add Consumption">
			Add Consumption</button>
		</div>
	</div></div>
</div>	
	</div>
</div>
			</div>
				<div class="clear"></div>
			<div class="grid_12 alpha omega agrd_24">
<c:if test="${not(empty pwu1) and (pwu1.dataSize gt 0)}">
<div class="panel panel-default ">
	<div class="panel-heading">
		<h2 class="panel-title">
			Consumption
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
						            timestamp
					        </th>
					        <th scope="col" class="">
						            quantity
					        </th>
					        <th scope="col" class="">
						            user
					        </th>
<th scope="col" class=" smallcol"></th> 
						</tr>
					</thead>
				<tbody>
				<c:forEach var="current" varStatus="status" items="${pwu1.data}">
					<c:set var="index" value="${status.index}"/>	
						<tr <c:if test="${pwu1.currentIndex eq index}">class="info"</c:if>>	
								<td class=" timestamp">
										<fmt:formatDate value="${current.timestamp}" pattern="${timestampPattern}"/>
								</td>
								<td class=" decimal">
										<fmt:formatNumber value="${current.quantity}" pattern="${decimalPattern}"/>
								</td>
								<td class=" string">
										<c:out value="${current.user}"/>
								</td>
									<td class=" smallcol">
										 <a title="delete" id="ln3" class=" " href="<webratio:Link link="ln3" position="index"/>" >
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
			<div class="grid_9 alpha agrd_18">
<div class="grid_12 alpha omega agrd_24">
	<div class="panel panel-default ">
		<div class="panel-heading"><h2 class="panel-title">Household Consumption</h2></div>
		<div class="panel-body">
			<div id="chart_div" style="width: 100%; height: 100%;"></div>
			<div id="timeline" style="width: 100%; height: 100p%"></div>
		</div>
	</div>
</div>
			</div>
			<div class="grid_3 omega agrd_6">
<div class="panel panel-default ">
	<div class="panel-heading">
		<h2 class="panel-title">
			Filter
		</h2>
	</div>
	<div class="panel-body">
<div class="EntryUnit ">
	<div class="form-horizontal ">
	    <c:set var="btFieldError"><html:errors property="enu3"/></c:set>
		<c:if test="${not (empty btFieldError)}">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<html:errors property="enu3"/>
			</div>
		</c:if>
				<c:set var="btFieldError"><html:errors property="sfld1"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="sfld1" class="control-label col-md-2"></label>
					<div class="controls col-md-10">
					<c:forEach var="current" varStatus="status" items="${page1FormBean.map.sfld1List}">
	      			<c:set var="index" value="${status.index}"/>
	      			<label class="radio-inline" for="sf_sfld1_${index}">
		  				<input type="radio" name="sfld1" id="sf_sfld1_${index}" class="wr-submitButtons:ln13" value="<c:out value="${current}"/>" <c:if test="${current eq page1FormBean.map.sfld1}">checked="checked"</c:if> />
						   <c:out value="${page1FormBean.map.sfld1LabelList[index]}"/> 
					</label>
	      		</c:forEach>
					<c:set var="btFieldError"><html:errors property="sfld1"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
	</div>
	<div class="row"><div class="col-md-offset-2 col-md-10">
		<div class="form-group form-btn">
					 <button title="Show chart" onclick="$('#page1FormBean')[0].target='_self'" class="btn  btn-default " id="button:ln13" name="button:ln13" type="submit" value="Show chart">
			Show chart</button>
		</div>
	</div></div>
</div>	
	</div>
</div>
			</div>
				<div class="clear"></div>
			<div class="grid_12 alpha omega agrd_24">
<div class="panel panel-default ">
	<div class="panel-heading">
		<h2 class="panel-title">
			LoginFake
		</h2>
	</div>
	<div class="panel-body">
<div class="EntryUnit ">
	<div class="form-horizontal ">
	    <c:set var="btFieldError"><html:errors property="enu5"/></c:set>
		<c:if test="${not (empty btFieldError)}">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<html:errors property="enu5"/>
			</div>
		</c:if>
				<c:set var="btFieldError"><html:errors property="sfld5"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="sfld5" class="control-label col-md-2">user</label>
					<div class="controls col-md-10">
					<html:select styleId="sfld5" styleClass="wr-submitButtons:ln9 form-control " property="sfld5" disabled="false">
				  		<html:option value=""><bean:message key="selectionfield.noselection"/></html:option>
				    <html:options property="sfld5List" labelProperty="sfld5LabelList"/>
				</html:select>
					<c:set var="btFieldError"><html:errors property="sfld5"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
	</div>
	<div class="row"><div class="col-md-offset-2 col-md-10">
		<div class="form-group form-btn">
					 <button title="Flow9" onclick="$('#page1FormBean')[0].target='_self'" class="btn  btn-default " id="button:ln9" name="button:ln9" type="submit" value="Flow9">
			Flow9</button>
		</div>
	</div></div>
</div>	
	</div>
</div>
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
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['timeline']}]}"></script>
	<script type="text/javascript" src="ChartStyle/javascript/generateChart.js"></script>
</body>
</html>