<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
	<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
	<%@ taglib prefix="webratio" uri="http://www.webratio.com/2006/TagLib/JSP20" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/xml; charset=UTF-8"%>
<webratio:Page page="page1"/>
<PageRefresh>
		<![CDATA[
			<html:form action="form_page1.do${wrAjax ? '#!ajax=true' : ''}" styleId="page1FormBean" enctype="multipart/form-data">
		]]>
		<HiddenFields page="page1">
			<![CDATA[
			<html:hidden property="lastURL" styleId="lastURL_page1"/>
				<input type="hidden" name="ln2" value="<webratio:Link link="ln2"/>">
				<input type="hidden" name="ln13" value="<webratio:Link link="ln13"/>">
				<input type="hidden" name="ln9" value="<webratio:Link link="ln9"/>">
		]]>
		</HiddenFields>
		<LinkData>
			<![CDATA[<webratio:LinkData page="page1"/>]]>
		</LinkData>
		<c:if test="${webratio:isLayoutRefreshed('page1_grid_0', pageContext)}">
			<ControlData control="page1_grid_0" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
<div class="container_12">
			<div class="grid_12 alpha omega agrd_24">
				<div class="wr-ajaxDiv" id="page1_cell_0"></div>
			</div>
				<div class="clear"></div>
			<div class="grid_12 alpha omega agrd_24">
				<div class="wr-ajaxDiv" id="page1_cell_12"></div>
			</div>
				<div class="clear"></div>
			<div class="grid_9 alpha agrd_18">
				<div class="wr-ajaxDiv" id="page1_cell_24"></div>
			</div>
			<div class="grid_3 omega agrd_6">
				<div class="wr-ajaxDiv" id="page1_cell_33"></div>
			</div>
				<div class="clear"></div>
			<div class="grid_12 alpha omega agrd_24">
				<div class="wr-ajaxDiv" id="page1_cell_36"></div>
			</div>
				<div class="clear"></div>
</div>
</webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<c:if test="${webratio:isLayoutRefreshed('page1_cell_0,page1_grid_0', pageContext)}">
			<ControlData control="page1_cell_0" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
	<div class="wr-ajaxDiv" id="enu1_0"></div>
</webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<c:if test="${webratio:isLayoutRefreshed('enu1_0,page1_cell_0,page1_grid_0', pageContext)}">
			<ControlData control="enu1_0" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
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
</div></webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<c:if test="${webratio:isLayoutRefreshed('page1_cell_12,page1_grid_0', pageContext)}">
			<ControlData control="page1_cell_12" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
	<div class="wr-ajaxDiv" id="pwu1_0"></div>
</webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<c:if test="${webratio:isLayoutRefreshed('pwu1_0,page1_cell_12,page1_grid_0', pageContext)}">
			<ControlData control="pwu1_0" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
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
</webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<c:if test="${webratio:isLayoutRefreshed('page1_cell_24,page1_grid_0', pageContext)}">
			<ControlData control="page1_cell_24" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
	<div class="wr-ajaxDiv" id="pwu2_0"></div>
</webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<c:if test="${webratio:isLayoutRefreshed('pwu2_0,page1_cell_24,page1_grid_0', pageContext)}">
			<ControlData control="pwu2_0" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
<div class="grid_12 alpha omega agrd_24">
	<div class="panel panel-default ">
		<div class="panel-heading"><h2 class="panel-title">Household Consumption</h2></div>
		<div class="panel-body">
			<div id="chart_div" style="width: 100%; height: 100%;"></div>
			<div id="timeline" style="width: 100%; height: 100p%"></div>
		</div>
	</div>
</div>
</webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<c:if test="${webratio:isLayoutRefreshed('page1_cell_33,page1_grid_0', pageContext)}">
			<ControlData control="page1_cell_33" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
	<div class="wr-ajaxDiv" id="enu3_0"></div>
</webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<c:if test="${webratio:isLayoutRefreshed('enu3_0,page1_cell_33,page1_grid_0', pageContext)}">
			<ControlData control="enu3_0" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
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
</div></webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<c:if test="${webratio:isLayoutRefreshed('page1_cell_36,page1_grid_0', pageContext)}">
			<ControlData control="page1_cell_36" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
	<div class="wr-ajaxDiv" id="enu5_0"></div>
</webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<c:if test="${webratio:isLayoutRefreshed('enu5_0,page1_cell_36,page1_grid_0', pageContext)}">
			<ControlData control="enu5_0" type="text/html">
				<![CDATA[<webratio:CollectScripts var="inlineScripts" enabled="${wrBoxed}" eventHandlerWrapper="wr.keepScoped">
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
</div></webratio:CollectScripts>
					<c:if test="${wrBoxed and not(empty inlineScripts)}">
							<script type="text/javascript">
								wr.runScoped("${wrClientAppName}", function(ajaxRequest, WRAjaxRequest, $H, WRAjax, WRAjaxRequestUtils, WRAjaxRequestQueue, WREvent, WREventUtils, Form) {
									${inlineScripts}
								});
							</script>
					</c:if>]]>
			</ControlData>
		</c:if>
		<![CDATA[
		</html:form>
	]]>
</PageRefresh>