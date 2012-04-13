<%-- 
    Document   : doctor
    Created on : 2012-2-26, 8:02:00
    Author     : Ben <arkilis@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html xmlns="http://www.wosowoso.com/jl/">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Profile</title>
        <link rel="stylesheet" href="css/style.css" media="all"/>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script laguage="text/javascript">
            function initialize() {

                var myOptions = {
                    zoom: 8,
                    center: new google.maps.LatLng(-27.463347, 153.02496),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                var map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);

                var lat= <s:property value='user.latitude' />;
                var lng= <s:property value='user.longitude' />;
                var options = {
                    position: new google.maps.LatLng(lat, lng)
                };

                var marker = new google.maps.Marker(options);

                marker.setMap(map);
            }

        </script>
    </head>
    <body onload="initialize();">
        <div id="content" style="height: 1200px">
            <div id="header">
                <h1 id="title">OHCS - Payment</h1>
            </div>
            <div id="profile_left">Navigation control panel</div>
            <div id="profile_right">
                <div id="general">
                    <div id="general_left">

                    </div>
                </div>
                <div id="general_right">
                    <table>
                        <tr>
                            <td>$30</td>
                            <!-- change the user id later -->
                            <td><input type="button" value="Pay Now!" onclick="javascript:window.location.href='Invoice.action?userid=2&credit=30'"></td>
                            <td>
                        </tr>
                        <tr>
                            <td>$50</td>
                            <!-- change the user id later -->
                            <td><input type="button" value="Pay Now!" onclick="javascript:window.location.href='Invoice.action?userid=2&credit=50'"></td>
                            <td>
                        </tr>
                        <tr>
                            <td>$100</td>
                            <!-- change the user id later -->
                            <td><input type="button" value="Pay Now!" onclick="javascript:window.location.href='Invoice.action?userid=2&credit=100'"></td>
                            <td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div id="footer">Copyright: OHSC. Inc. 2011-2012</div>
    </body>
</html>
