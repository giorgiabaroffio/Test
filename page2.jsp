<!DOCTYPE html>
	<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
	<%@ taglib prefix="webratio" uri="http://www.webratio.com/2006/TagLib/JSP20" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<% response.setHeader("X-UA-Compatible", "IE=edge"); %>
<webratio:Page page="page2"/>
<html lang="${LanguageISOCtxParam}">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
	    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<title>Find Neighbor Users</title>
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
	<script src="http://maps.googleapis.com/maps/api/js?sensor=false" data-wr-resname="google-api-sensor-false"></script>
<script>if (typeof wr !== "undefined") { wr.ui.html.resx.refreshLoaded(); }</script>
	</head>
<body class="bootstrap-default">
<a href="#main-content" class="sr-only">Skip to main content</a>
	<c:if test="${wrBoxed}">
		<div <c:if test="${not wrAjax}">id="wr-${wrClientAppName}" data-wr-appid="${wrClientAppName}"</c:if> class="wr-appui wr-appui-${wrClientAppName}">
	</c:if>
	<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
			<html:form action="form_page2.do${wrAjax ? '#!ajax=true' : ''}" styleId="page2FormBean" enctype="multipart/form-data">
			<html:hidden property="lastURL" styleId="lastURL_page2"/>
				<input type="hidden" name="ln34" value="<webratio:Link link="ln34"/>">
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
		<li class="active">Find Neighbor Users</li>
	</ol>
	<div class="page-header clearfix">
			<h1>Find Neighbor Users</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div id="main-content" role="main">
<div class="container_12">
			<div class="grid_12 alpha omega agrd_24">
<div class="panel panel-default ">
	<div class="panel-heading">
		<h2 class="panel-title">
			SelectUser
		</h2>
	</div>
	<div class="panel-body">
<div class="EntryUnit ">
	<html:hidden property="enu4Key" styleId="enu4Key"></html:hidden>
	<div class="form-horizontal ">
	    <c:set var="btFieldError"><html:errors property="enu4"/></c:set>
		<c:if test="${not (empty btFieldError)}">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<html:errors property="enu4"/>
			</div>
		</c:if>
				<c:set var="btFieldError"><html:errors property="fld1"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="fld1" class="control-label col-md-2">min</label>
					<div class="controls col-md-10">
					<html:text   styleId="fld1" styleClass="wr-submitButtons:ln34  form-control " property="fld1" readonly="false"/>
					<c:set var="btFieldError"><html:errors property="fld1"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
				<c:set var="btFieldError"><html:errors property="fld4"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="fld4" class="control-label col-md-2">max</label>
					<div class="controls col-md-10">
					<html:text   styleId="fld4" styleClass="wr-submitButtons:ln34  form-control " property="fld4" readonly="false"/>
					<c:set var="btFieldError"><html:errors property="fld4"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
				<c:set var="btFieldError"><html:errors property="sfld3"/></c:set>
				<div class="form-group<c:if test="${not (empty btFieldError)}"> has-error</c:if> ">
					  <label for="sfld3" class="control-label col-md-2">id</label>
					<div class="controls col-md-10">
					<html:select styleId="sfld3" styleClass="wr-submitButtons:ln34 form-control " property="sfld3" disabled="false">
				  		<html:option value=""><bean:message key="selectionfield.noselection"/></html:option>
				    <html:options property="sfld3List" labelProperty="sfld3LabelList_locale"/>
				</html:select>
					<c:set var="btFieldError"><html:errors property="sfld3"/></c:set><c:if test="${not(empty(btFieldError))}"><span class="field-error help-block ">${btFieldError}</span></c:if>
					</div>
				</div>
	</div>
	<div class="row"><div class="col-md-offset-2 col-md-10">
		<div class="form-group form-btn">
					 <button title="Filter" onclick="$('#page2FormBean')[0].target='_self'" class="btn  btn-default " id="button:ln34" name="button:ln34" type="submit" value="Filter">
			Filter</button>
		</div>
	</div></div>
</div>	
	</div>
</div>
			</div>
				<div class="clear"></div>
			<div class="grid_12 alpha omega agrd_24">
<c:if test="${not(empty mdu2) and (mdu2.dataSize gt 0)}">
<div class="panel panel-default ">
	<div class="panel-heading">
		<h2 class="panel-title">
			Users
		</h2>
	</div>
	<div class="panel-body">
		<div class="">
			<c:forEach var="current" varStatus="status" items="${mdu2.data}">
			<c:set var="index" value="${status.index}"/>
					<div class="row">
						<label class="header col-md-2">userName</label>
						<div class="value col-md-10"><c:out value="${current.userName}"/></div>
					</div>
					<div class="row">
						<label class="header col-md-2">email</label>
						<div class="value col-md-10"><c:out value="${current.email}"/></div>
					</div>
				<c:if test="${not status.last}"><hr/></c:if>
			</c:forEach>
		</div>
	</div>
</div>     
</c:if>
			</div>
				<div class="clear"></div>
			<div class="grid_12 alpha omega agrd_24">
<div class="panel panel-default ">
	<div class="panel-heading">
		<h2 class="panel-title">
			GoogleMap
		</h2>
	</div>
	<div class="panel-body">
<div id="map_canvas" style="width:${gmu1.mapWidth}px; height:${gmu1.mapHeight}px"></div>
<script type="text/javascript">
	var mapOptions = {
      zoom: ${gmu1.mapZoomLevel},
      center: new google.maps.LatLng(${gmu1.mapCoordinates}),
      mapTypeId: google.maps.MapTypeId.${gmu1.mapType}
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
		function addMarker(contentTitle, contentString, location, openWindow) {
			var markers = []; 
			if(contentString=="myself"){
			var marker = new google.maps.Marker({
											  position: location,
										      map: map,
										      title: '<bean:message key="GoogleMapUnit.user.marker.title"/>',
										      draggable: false,
										      icon:'Images/GoogleMapUnit/home.png',
										      animation: google.maps.Animation.DROP
										    });
			}
			else{
			var marker = new google.maps.Marker({
											  position: location,
										      map: map,
										      title: '<bean:message key="GoogleMapUnit.user.marker.title"/>',
										      draggable: false,
										      icon:'Images/GoogleMapUnit/home2.png',
										      animation: google.maps.Animation.DROP
										    });
			}
	        if(contentString){
		       var infowindow = new google.maps.InfoWindow({content: contentString});
	           google.maps.event.addListener(marker, 'click', function() {infowindow.open(map,marker);});
	           if(openWindow){
	              infowindow.open(map,marker);
	           }
	        }
	        markers.push(marker);
	    }
		<c:if test="${not(empty gmu1.markers)}">
			function addMarkers(){
				var bounds = new google.maps.LatLngBounds ();
		  		<c:forEach var="marker" varStatus="status" items="${gmu1.markers}">
					bounds.extend (new google.maps.LatLng(${marker.coordinates}));
	        		setTimeout(function() {addMarker('${marker.title}', '${marker.info}',  new google.maps.LatLng(${marker.coordinates}), ${marker.infoWindowVisible})}, 300);
					var line = new google.maps.Polyline({
    					path: [new google.maps.LatLng(${marker.coordinates}), new google.maps.LatLng(${gmu1.mapCoordinates})],
    					strokeColor: "#FF0000",
    					strokeOpacity: 1.0,
    					strokeWeight: 5,
    					geodesic: true,
    					map: map
					});
				</c:forEach>
				map.fitBounds (bounds);
			}
			setTimeout(function() {addMarkers();}, 200);
		</c:if>		
</script>	
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
</body>
</html>