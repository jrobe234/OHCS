<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>Basic Struts 2 Project Setup</title>
        <s:head/>
    </head>
 
    <body>
 
        <h1><s:text name="welcome" /></h1>
 
        <p>
            <s:url id="localeEN" namespace="/" action="" >
                <s:param name="request_locale" >en</s:param>
            </s:url>
            <s:url id="localeDE" namespace="/" action="" >
                <s:param name="request_locale" >de</s:param>
            </s:url>
            <s:a href="%{localeEN}" >English</s:a>
            <s:a href="%{localeDE}" >German</s:a>
        </p>
 
        <s:if test="hasActionErrors()">
        <div id="fieldErrors">
            <s:actionerror/>
        </div>
        </s:if>
 
        <s:form action="hello" namespace="/" method="post" name="myForm" theme="xhtml">
            <s:textfield name="message" size="40" maxlength="40" required="true" key="your.message-label"/>
            <s:submit key="submit" />
        </s:form>
 
    </body>
 
</html>