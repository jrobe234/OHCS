<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

        <link href=" <s:url value="/includes/css/general.css"/>" rel="stylesheet" type="text/css"/>
        <link href=" <s:url value="/includes/css/map.css"/>" rel="stylesheet" type="text/css"/>

        <script src="//maps.googleapis.com/maps/api/js?sensor=false&libraries=places" type="text/javascript"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>  
        <script type="text/javascript" src=" <s:url value="/includes/js/jquery-1.7.1.min.js" />" ></script>
        <script type="text/javascript" src=" <s:url value="/includes/js/map.js" />" ></script>
    </head>
    <body>
        <div class="container">
            <div class="map">
                <div class="search">
                    <input type="text" value="" id="searchTextField">
                </div>
                <div class="rightcol">
                    <div id="map" >

                    </div>
                </div>
                <div class="leftcol">
                    <div id="list">
                        
                    </div>
                </div>
                <div class="clear"></div>
                
            </div>
        </div>
    </body>
</html>