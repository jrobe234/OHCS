<%-- 
    Document   : login
    Created on : 2012-2-21, 6:06:03
    Author     : Ben <arkilis@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="login.action" method="POST">
            <p>Login Name:<input type="textfield" name="email" /></p>
            <p>Password:<input type="password" name="password" /></p>
            <p><input type="submit" value="OK" /></p>
        <form>
    </body>
</html>
