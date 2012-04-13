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
            <table>
            <tr>
                <td>Login Name:</td>
                <td><input type="textfield" name="email" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="OK" /></td>
            </tr>
            </table>
        <form>
    </body>
</html>
