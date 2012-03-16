<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 
    <head>
        <title>Hello World!</title>
    </head>
 
    <body>
 
        <h2>Thank you for your message on <s:property value="nowDate" /></h2>
 
        <p>
            Your Message was:<br/><br/>
            <s:property value="message" />
        </p>
 
    </body>
 
</html>