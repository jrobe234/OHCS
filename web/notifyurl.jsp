<%-- 
    Document   : notifyurl
    Created on : 2012-3-19, 10:51:19
    Author     : Ben <arkilis@gmail.com>
--%>

<%@page import="com.myapp.struts.NotifyUrlMgr"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
    String ret = NotifyUrlMgr.insert(request);
    if (ret == null) {
        out.print("200 OK");
    } else {
        out.print("fail");
    }
%>

