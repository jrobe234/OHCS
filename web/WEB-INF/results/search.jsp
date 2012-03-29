<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

        <link href="<s:url value="/includes/css/general.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<s:url value="/includes/css/map.css"/>" rel="stylesheet" type="text/css"/>

        <script src="//maps.googleapis.com/maps/api/js?sensor=false&libraries=places,geometry "type="text/javascript"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>  
        <script type="text/javascript" src=" <s:url value="/includes/js/jquery-1.7.1.min.js" />" ></script>
        <script type="text/javascript" src=" <s:url value="/includes/js/map.js" />" ></script>
        <script type="text/javascript" src=" <s:url value="/includes/js/markerclusterer.js" />" ></script>
    </head>
    <body>
        <div class="container">
            <div class="map">
                <div class="search">
                    <input type="text" value="" id="searchTextField">
                    <div id="filters">
                    <label for="serviceType">Include on map: </label>
                    <div class="filter"><input type="checkbox" name="serviceType" value="1" checked="checked" id="doctor"/> <img src="<s:url value="/includes/images/map-marker1.png"/>"/>Doctor Offices</div>
                    <div class="filter"><input type="checkbox" name="serviceType" value="2" checked="checked" id="hospital"/> <img src="<s:url value="/includes/images/map-marker2.png"/>"/> Hospitals</div>
                    <div class="filter"><input type="checkbox" name="serviceType" value="3" checked="checked" id="pharmacy"/> <img src="<s:url value="/includes/images/map-marker3.png"/>"/> Pharmacies</div>
                    </div>
                </div>
                     <div class="leftcol">
                         <h2 class="title">Locations</h2>
                    <div id="list">
                        
                    </div>
                </div>
                <div class="rightcol">
                    <div id="map" >

                    </div>
                </div>
               
                <div class="clear"></div>
            </div>
        </div>
    </body>
</html>