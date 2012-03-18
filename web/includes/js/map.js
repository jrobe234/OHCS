function getMax(center, bounds){
    var ne = new google.maps.LatLng(bounds.getNorthEast().lat(), bounds.getNorthEast().lng());
    var sw = new google.maps.LatLng(bounds.getSouthWest().lat(), bounds.getSouthWest().lng());
    var maxBounds = new google.maps.LatLngBounds(sw, ne);
    return maxBounds;
}

function initialize() {
    var defaultBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(-10.4121, 113.0918),
    new google.maps.LatLng(-43.3840, 153.023036)
);
        
    var mapOptions = {
        center: new google.maps.LatLng(-27.470280,153.023036),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    var options = {
        bounds: defaultBounds
    }
    /**
   downloadUrl("markers", function(data) {
      var markers = data.documentElement.getElementsByTagName("marker");
      for (var i = 0; i < markers.length; i++) {
        var latlng = new google.maps.LatLng(parseFloat(markers[i].getAttribute("latitude")),
                                    parseFloat(markers[i].getAttribute("longitude")));
        var marker = new google.maps.Marker({position: latlng, map: map});
       }
     });*/
    
       
    var input = document.getElementById('searchTextField');
    var autocomplete = new google.maps.places.Autocomplete(input, options);

    autocomplete.bindTo('bounds', map);

    google.maps.event.addListener(autocomplete, 'place_changed', function() {
        var place = autocomplete.getPlace();
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(15);
        }
    });
    
    google.maps.event.addListener(map, 'idle', function() {
        var center = map.getCenter();
        var bounds = map.getBounds();
        var maxBounds = getMax(center, bounds);
        //alert("north=" + maxBounds.getNorthEast().lat() + ";east=" + maxBounds.getNorthEast().lng() + ";south=" + maxBounds.getSouthWest().lat() + ";west=" + maxBounds.getSouthWest().lng() + "");
        $.post(
        "markers",
        {
            "north": maxBounds.getNorthEast().lat(),
            "east": maxBounds.getNorthEast().lng(),
            "south": maxBounds.getSouthWest().lat(),
            "west": maxBounds.getSouthWest().lng()
        },
        function(data){
            var markers = data.markers;
            var list = "";
            for (var i = 0; i < markers.length; i++) {
                list = list +  "<div class=\"listItem\">" + markers[i].name + "</div>";
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(markers[i].latitude, markers[i].longitude),
                    map: map
                })
            }
            document.getElementById('list').innerHTML = list;
        },
        "json"
        )
    });
    
}
google.maps.event.addDomListener(window, 'load', initialize);