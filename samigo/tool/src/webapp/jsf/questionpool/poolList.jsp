<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://www.sakaiproject.org/samigo" prefix="samigo" %>
<!DOCTYPE html
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<!-- $Id$
<%--
***********************************************************************************
*
* Copyright (c) 2005 The Regents of the University of Michigan, Trustees of Indiana University,
*                  Board of Trustees of the Leland Stanford, Jr., University, and The MIT Corporation
*
* Licensed under the Educational Community License Version 1.0 (the "License");
* By obtaining, using and/or copying this Original Work, you agree that you have read,
* understand, and will comply with the terms and conditions of the Educational Community License.
* You may obtain a copy of the License at:
*
*      http://cvs.sakaiproject.org/licenses/license_1_0.html
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
* INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
* AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
* DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
**********************************************************************************/
--%>
-->
  <f:view>
  <f:loadBundle
     basename="org.sakaiproject.tool.assessment.bundle.QuestionPoolMessages"
     var="msg"/>
  <f:loadBundle
     basename="org.sakaiproject.tool.assessment.bundle.GeneralMessages"
     var="genMsg"/>
   
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head><%= request.getAttribute("html.head") %>
      <title><h:outputText value="#{msg.q_mgr}"/></title>
<script language="javascript" style="text/JavaScript">
<!--
<%@ include file="/js/samigotree.js" %>

//-->
</script>
      </head>
<body onload="collapseAllRows();flagRows();;<%= request.getAttribute("html.body.onload") %>;disabledButton()">
 <div class="portletBody">
<!-- content... -->
<h:form id="questionpool">


<p class="navIntraTool">

   <h:commandLink title="#{genMsg.t_assessment}" rendered="#{questionpool.importToAuthoring == 'true'}" action="author" immediate="true">
   <h:outputText value="#{genMsg.assessment}"/>
       <f:actionListener
         type="org.sakaiproject.tool.assessment.ui.listener.author.AuthorActionListener" />
       <f:actionListener
         type="org.sakaiproject.tool.assessment.ui.listener.questionpool.CancelImportToAssessmentListener" />
   </h:commandLink>

   <h:commandLink title="#{genMsg.t_assessment}" rendered="#{questionpool.importToAuthoring == 'false'}" action="author"  immediate="true">
   <h:outputText value="#{genMsg.assessment}"/>
       <f:actionListener
         type="org.sakaiproject.tool.assessment.ui.listener.author.AuthorActionListener" />
   </h:commandLink>

<h:outputText value=" #{genMsg.separator} " />

   <h:commandLink title="#{genMsg.t_template}" rendered="#{questionpool.importToAuthoring == 'false'}" action="template" immediate="true">
        <h:outputText value="#{genMsg.template}"/>
      <f:actionListener type="org.sakaiproject.tool.assessment.ui.listener.author.TemplateListener" />
   </h:commandLink>

   <h:commandLink title="#{genMsg.t_questionPool}" rendered="#{questionpool.importToAuthoring == 'true'}" action="template" immediate="true">
        <h:outputText value="#{genMsg.template}"/>
       <f:actionListener
         type="org.sakaiproject.tool.assessment.ui.listener.questionpool.CancelImportToAssessmentListener" />
   </h:commandLink>

<h:outputText value=" #{genMsg.separator} " />
        <h:outputText value="#{msg.qps}"/>
</p>


 <h3><h:outputText value="#{genMsg.questionPool}"/></h3>

<h:outputText rendered="#{questionpool.importToAuthoring == 'true'}" value="#{msg.msg_imp_poolmanager}"/>

<div class="tier1">
<h:outputText escape="false" rendered="#{questionpool.importToAuthoring == 'false' && authorization.createQuestionPool}" value="<p class=\"navViewAction\">"/>
<h:commandLink title="#{msg.t_addPool}" rendered="#{questionpool.importToAuthoring == 'false' && authorization.createQuestionPool}" id="add" immediate="true" action="#{questionpool.addPool}">
 <h:outputText value="#{msg.add_new_pool}"/>
  <f:param name="qpid" value="0"/>
</h:commandLink> 
<h:outputText rendered="#{questionpool.importToAuthoring == 'false' && authorization.createQuestionPool}" escape="false" value="</p>"/>
</div>

 <div class="tier2">
<%@ include file="/jsf/questionpool/poolTreeTable.jsp" %>

 </div>


<p class="act">
 
<h:commandButton accesskey="#{msg.a_update}" rendered="#{questionpool.importToAuthoring == 'false' && authorization.deleteOwnQuestionPool}" type="submit" immediate="true" id="Submit" value="#{msg.update}" action="#{questionpool.startRemovePool}" styleClass="active" >
  </h:commandButton>

  <h:commandButton accesskey="#{msg.a_cancel}" rendered="#{questionpool.importToAuthoring == 'true'}"  type="submit" immediate="true" id="cancel" value="#{msg.cancel}" action="#{questionpool.cancelImport}"  >
  </h:commandButton>
</p>

</h:form>
</div>
      </body>
    </html>
  </f:view>
