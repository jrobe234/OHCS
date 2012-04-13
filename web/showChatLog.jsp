<%-- 
    Document   : showChatLog
    Created on : 2012-3-30, 5:37:42
    Author     : Ben <arkilis@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat Log</title>
    </head>
    <body>
        <h1>Chat Log</h1>
        <s:iterator value="arr_Con" status="consultation">
        <p>Doctor: <s:property value="doctorid"></s:property></p>
        <p>Patient: <s:property value="patientid"></s:property></p>
        <p>Start Date & Time: <s:property value="startDateTime"></s:property></p>
        <p>End Date & Time: <s:property value="endDateTime"></s:property></p>
        <p>Content: <s:property value="content"></s:property></p>
        <p>===========================================================</p>     
        </s:iterator>
    </body>
</html>
