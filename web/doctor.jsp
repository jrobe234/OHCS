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
                    zoom: 11,
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
        <div id="content" style="height: 2000px">
           <div id="header">
                <div id="title"><h1 id="title">OHCS - Doctor</h1></div>
                <div id="logout">Welcome:<font id="fullname">${sessionScope.SessionUser.email}</font>| <a href="logout.action">Logout</a></div>
            </div>
            <div id="profile_left">
                <div>Navigation control panel</div>
                <div class="nav_left_item" ><a href="chat.jsp" >Consultation</a></div>
                <div class="nav_left_item"><a href="chat.jsp" >Time Table</a></div>
            </div>
            <div id="profile_right">
                <div id="general">
                    <div id="general_left">
                        <div class="cell"><font class="general_left_font">Name: </font><s:property value="user.fname"></s:property> <s:property value="user.lname"></s:property></div>
                        <div class="cell"><font class="general_left_font">Title: </font><s:property value="user.title"></s:property></div>
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
                    <p>My Location</p>
                    <div id="map_canvas" style="width:400px; height: 300px;"></div>
                </div>
                <div id="history">
                    <p>history info</p>
                </div>
                <div id="awards">
                    <p>Time Table</p>
                    <div>
                        <table width="650" border="1">
                            <tr>
                                <td align="center" style="width:85px;" >&nbsp;</td>
                                <td align="center" style="width:85px;" >Monday</td>
                                <td align="center" style="width:85px;" >Tuesday</td>
                                <td align="center" style="width:85px;" >Wednesday</td>
                                <td align="center" style="width:85px;" >Thursday</td>
                                <td align="center" style="width:85px;" >Friday</td>
                                <td align="center" style="width:85px;" >Saturday</td>
                                <td align="center" style="width:85px;" >Sunday</td>
                            </tr>
                            <tr>
                                <td>0:00-1:00</td>
                                <s:if test='timetable.mon.indexOf("#1!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="1" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#1!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#1!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="3" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#1!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="4" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#1!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#1!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#1!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>1:00-2:00</td>
                                <s:if test='timetable.mon.indexOf("#2!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#2!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#2!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#2!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#2!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#2!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#2!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>2:00-3:00</td>
                                <s:if test='timetable.mon.indexOf("#3!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#3!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#3!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#3!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#3!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#3!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                               <s:if test='timetable.sun.indexOf("#3!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>3:00-4:00</td>
                                <s:if test='timetable.mon.indexOf("#4!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#4!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#4!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#4!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#4!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#4!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#4!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>4:00-5:00</td>
                                <s:if test='timetable.mon.indexOf("#5!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#5!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#5!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#5!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#5!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#5!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#5!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>5:00-6:00</td>
                                <s:if test='timetable.mon.indexOf("#6!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#6!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#6!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#6!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#6!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#6!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#6!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>6:00-7:00</td>
                                <s:if test='timetable.mon.indexOf("#7!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#7!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#7!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#7!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#7!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#7!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#7!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>7:00-8:00</td>
                                <s:if test='timetable.mon.indexOf("#8!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#8!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#8!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#8!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#8!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#8!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#8!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>8:00-9:00</td>
                                <s:if test='timetable.mon.indexOf("#9!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#9!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#9!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#9!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#9!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#9!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#9!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>9:00-10:00</td>
                                <s:if test='timetable.mon.indexOf("#10!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#10!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#10!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#10!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#10!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#10!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#10!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>10:00-11:00</td>
                                <s:if test='timetable.mon.indexOf("#11!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#11!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#11!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#11!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#11!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#11!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#11!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>11:00-12:00</td>
                                <s:if test='timetable.mon.indexOf("#12!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#12!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#12!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#12!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#12!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#12!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#12!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>12:00-13:00</td>
                                <s:if test='timetable.mon.indexOf("#13!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#13!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#13!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#13!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#13!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#13!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#13!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>13:00-14:00</td>
                                <s:if test='timetable.mon.indexOf("#14!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#14!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#14!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#14!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#14!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#14!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#14!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>14:00-15:00</td>
                                <s:if test='timetable.mon.indexOf("#15!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#15!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#15!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#15!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#15!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#15!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#15!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>15:00-16:00</td>
                                <s:if test='timetable.mon.indexOf("#16!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#16!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#16!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#16!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#16!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#16!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#16!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>16:00-17:00</td>
                                <s:if test='timetable.mon.indexOf("#17!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#17!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#17!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#17!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#17!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#17!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#17!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>17:00-18:00</td>
                                <s:if test='timetable.mon.indexOf("#18!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#18!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#18!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#18!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#18!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#18!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#18!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>18:00-19:00</td>
                                <s:if test='timetable.mon.indexOf("#19!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#19!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#19!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#19!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#19!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#19!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#19!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>19:00-20:00</td>
                                <s:if test='timetable.mon.indexOf("#20!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tuw.indexOf("#20!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#20!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#20!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#20!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#20!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#20!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>20:00-21:00</td>
                                <s:if test='timetable.mon.indexOf("#21!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#21!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#21!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#21!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#21!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#21!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#21!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>21:00-22:00</td>
                                <s:if test='timetable.mon.indexOf("#22!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#22!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#22!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#22!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#22!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#22!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#22!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>22:00-23:00</td>
                                <s:if test='timetable.mon.indexOf("#23!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#23!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#23!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#23!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#23!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#23!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#23!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                            <tr>
                                <td>23:00-0:00</td>
                                <s:if test='timetable.mon.indexOf("#24!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.tue.indexOf("#24!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.wed.indexOf("#24!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.thu.indexOf("#24!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.fri.indexOf("#24!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sat.indexOf("#24!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                                <s:if test='timetable.sun.indexOf("#24!")>=0'>
                                    <td align="center" style="background-color: #108AC6">
                                        <input type="checkbox" name="appointment" value="2" /><font style="color:white;">Avaiable</font>
                                    </td>
                                </s:if>
                                <s:else>
                                    <td align="center"></td>
                                </s:else>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <input type="button" value="Confirm" onclick="javascript: window.location.href='doctor.jsp'" />
                    </div>
                </div>
            </div>
        </div>
        <s:debug />
        <div id="footer">Copyright: OHSC. Inc. 2011-2012</div>
    </body>
</html>
