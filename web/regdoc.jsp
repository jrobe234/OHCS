<html xmlns="http://www.wosowoso.com/jl/">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Profile</title>
        <link rel="stylesheet" href="css/style.css" media="all"/>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            
            var autocomplete;
            var map;
            var maker;
            var geocoder;
            
            function initialize() {


                var myOptions = {
                    zoom: 14,
                    center: new google.maps.LatLng(-27.498591,153.00602700000002),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };


                map = new google.maps.Map(document.getElementById('google_map'), myOptions);
                
                //map.setCenter(new google.maps.LatLng(-27,135));
            }
            
            function addMarker(){
                
                window.console.log(document.getElementById("autocomplete").value);
                var newPosition= document.getElementById("autocomplete").value;
                geocoder = new google.maps.Geocoder();
                var requestNew = {
                    address: newPosition
                };
                
                geocoder.geocode(requestNew, function(results, status) 
                {

                    if (status == google.maps.GeocoderStatus.OK) {


                        marker = new google.maps.Marker({
                            map: map,
                            position: results[0].geometry.location
                        });
                        map.panTo(marker.getPosition());
                        
                        // get the latitude and longitude
                         document.getElementById("latitude").value= results[0].geometry.location.lat();
                         document.getElementById("longitude").value= results[0].geometry.location.lng();
                         
                    } else {
                        window.console.log('failed to geocode address: '  + status);
                    }
                });
                
                
                
                
            }

        </script>

    </head>
    <body onload="initialize();">
        <div id="content_x">
            <div id="header">
                <h1 id="title">OHCS</h1>
            </div>
            <div id="register_body">
                <form action="AddDoctor.action" method="POST">
                    <input type="hidden" name="userType" value="1" />

                    <div class="row_left">First Name: </div><div class="row_right"><input type="text" name="fname" /> *</div>
                    <div class="row_left">Last Name: </div><div class="row_right"><input type="text" name="lname" /> *</div>
                    <div class="row_left">Title: </div><div class="row_right"><input type="text" name="title" /> *</div>
                    <div class="row_left">Password: </div><div class="row_right"><input type="password" name="password" />*</div>
                    <div class="row_left">ReType Password: </div><div class="row_right"><input type="text" name="repassword" />*</div>
                    <div class="row_left">Email:</div><div class="row_right"><input type="text" name="email"/> *</div>
                    <div class="row_left">Gender: </div><div class="row_right" ><input type="radio" name="gender" style="width: 30px;" checked/>Male <input type="radio" name="gender" style="width: 30px;" />Female</div>
                    <div class="row_left">Date of Birth: </div><div class="row_right"><input type="text" name="dob" /> *</div>
                    <div class="row_left">Phone: </div><div class="row_right"><input type="text" name="phone"/> </div>
                    <div class="row_left">Address:</div><div class="row_right"><input type="text" name="address" /> *</div>
                    <div class="row_left">Choose your photo: </div><div class="row_right"><input type="text" name="photoPath" /> *</div>
                    <div class="row_left" style="height: 230px;">Description: </div><div class="row_right" style="height: 230px;"><textarea type="textarea" rows="10" cols="30" name="longDescription"></textarea></div>
                    <div class="row_left">location: </div><div class="row_right"><input type="text" name="location" id="autocomplete" /><input type="button" value="search" style="width: 100px;" onclick="javascript:addMarker();" /></div>
                    <div class="row_left" style="height:350px"></div><div class="row_right" style="height:350px"><div id="google_map" style="height:300px;width: 400px; margin-top: 5px;"></div></div>
                    <div class="row_left">Latitude: </div><div class="row_right"><input type="text" name="latitude" readonly="readonly" id="latitude" /></div>
                    <div class="row_left">Longitude:</div><div class="row_right"><input type="text" name="longitude" readonly="readonly" id="longitude" /></div>
                    <div class="row_left"></div><div class="row_right"><input type="submit" value="Register Me!" style="width: 100px;"/></div>
                </form>
            </div>	
        </div>
        <div id="footer">Copyright: OHSC. Inc. 2011-2012</div>
    </body>
</html>
