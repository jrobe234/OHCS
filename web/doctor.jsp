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
                <h1 id="title">OHCS</h1>
            </div>
            <div id="profile_left">Navigation control panel</div>
            <div id="profile_right">
                <div id="general">
                    <div id="general_left">
                        <div class="cell"><font class="general_left_font">Name: </font><s:property value="user.fname"></s:property> <s:property value="user.lname"></s:property></div>
                        <div class="cell"><font class="general_left_font">Title: </font></div>
                        <div class="cell"><font class="general_left_font">Gender: </font><s:property value="user.gender"></s:property></div>       
                        <div class="cell"><font class="general_left_font">Date of Birth: </font><s:property value="user.dob"></s:property></div>
                        <div class="cell"><font class="general_left_font">Phone: </font><s:property value="user.phone"></s:property></div>
                        <div class="cell"><font class="general_left_font">Email: </font><s:property value="user.email"></s:property></div>
                        <div class="cell"><font class="general_left_font">Address: </font><s:property value="user.address"></s:property></div>
                    </div>
                    <div id="general_right">
                        <img src="<s:property value="user.photoPath"></s:property>"  style="height:240px; width: 240px"alt="photo" />
                    </div>
                </div>
                <div id="description">
                    <p>Description:</p>
                    <div id="long_des">
                        <s:property value="user.longDescription"></s:property>
                    </div>
                </div>
                <div id="skillareas">
                    <p>skill info</p>
                    <div id="map_canvas" style="width:400px; height: 300px;"></div>
                    </div>
                    <div id="history">
                        <p>history info</p>
                    </div>
                    <div id="awards">
                        <p>awards info</p>
                    </div>
                </div>
            </div>
            <div id="footer">Copyright: OHSC. Inc. 2011-2012</div>
    </body>
</html>
