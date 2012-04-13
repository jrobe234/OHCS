<%-- 
    Document   : testSession
    Created on : 2012-3-18, 20:24:05
    Author     : Ben <arkilis@gmail.com>
--%>
<%@page language="java" import="java.util.*"  contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Test Page</title>
    </head>
    <body>
        <!--<h1><%=session.getAttribute("SessionUser")%></h1>-->
    <!--<c:out value="${SessionUser.fullName}" />-->
        SessionUser<br />
        ${sessionScope.SessionUser.appointwith[0].appointmentid}
        
        <p>=============================================================</p>
        <!--<s:iterator value="#session.SessionUser.appointwith">  
            <s:property value="appointmentid" />
        </s:iterator>-->
        <%=session.getAttribute("consultationid")%>
    </body>
</html>
