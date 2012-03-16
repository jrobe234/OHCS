<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

        <link href=" <s:url value="/includes/css/general.css"/>" rel="stylesheet" type="text/css"/>

        <script type="text/javascript" src=" <s:url value="/includes/js/jquery-1.7.1.min.js" />" ></script>
        <script type="text/javascript" src=" <s:url value="/includes/js/map.js" />" ></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>  
    </head>
    <body>
        <div class="map">
            <div class="search">
                <input type="text" value="" id="searchbox" style=" width:800px;height:30px; font-size:15px;">
            </div>
            <div class="leftcol" id="map" style="width:800px; height: 600px; margin-top: 10px;">

            </div>
            <div class="rightcol">
            </div>
        </div>
    </body>
</html>