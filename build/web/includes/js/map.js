function getMax(center, bounds, distance){
    var spherical = google.maps.geometry.spherical;
    var ne = new google.maps.LatLng(Math.max(bounds.getNorthEast().lat(), spherical.computeOffset(center, distance, 0).lat()), Math.max(bounds.getNorthEast().lng(), spherical.computeOffset(center, distance, 90).lng()));
    var sw = new google.maps.LatLng(Math.min(bounds.getSouthWest().lat(), spherical.computeOffset(center, distance, 180).lat()), Math.min(bounds.getSouthWest().lng(), spherical.computeOffset(center, distance, -90).lng()));
    var maxBounds = new google.maps.LatLngBounds(sw, ne);
    return maxBounds;
}

var sort_by = function(field, reverse, primer){

   var key = function (x) {return primer ? primer(x[field]) : x[field]};

   return function (a,b) {
       var A = key(a), B = key(b);
       return (A < B ? -1 : (A > B ? 1 : 0)) * [1,-1][+!!reverse];              
   }
}

function parseDouble(value){
  if(typeof value == "string") {
    value = value.match(/^-?\d*/)[0];
  }

  return !isNaN(parseInt(value)) ? value * 1 : NaN;
}

function initialize() {
    var defaultBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(-10.4121, 113.0918),
    new google.maps.LatLng(-43.3840, 153.023036)
);
        
    var mapOptions = {
        center: new google.maps.LatLng(-27.470280,153.023036),
        zoom: 14,
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
            map.setZoom(14);
        }
    });
    
    google.maps.event.addListener(map, 'idle', function() {
        var center = map.getCenter();
        var bounds = map.getBounds();
        var maxBounds = getMax(center, bounds, 1000);
        //alert("north=" + maxBounds.getNorthEast().lat() + ";east=" + maxBounds.getNorthEast().lng() + ";south=" + maxBounds.getSouthWest().lat() + ";west=" + maxBounds.getSouthWest().lng() + "");
        $.post(
        "markers",
        {
            "north": maxBounds.getNorthEast().lat(),
            "east": maxBounds.getNorthEast().lng(),
            "south": maxBounds.getSouthWest().lat(),
            "west": maxBounds.getSouthWest().lng(),
            "centerLat": map.getCenter().lat(),
            "centerLng": map.getCenter().lng()
        },
        function(data){
            var markers = data.markers.sort(sort_by('dist', false, parseDouble));      
            var list = "";
            for (var i = 0; i < markers.length; i++) {
                var dist = markers[i].dist.toString();
                var index = dist.indexOf(".")
                var distance;
                if (index) {
                    distance = dist.substr(0, index);
                } else {
                    distance = dist;
                }
                var num = i + 1;
                list = list +  "<div class=\"listItem\"><h2>"+num+":" + markers[i].name + "</h2><p>Approx. " + distance + " metres away</p></div>";
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(markers[i].latitude, markers[i].longitude),
                    map: map
                })
            }
            if (i == 0){
                list = "There are no services near your location";
            }
            document.getElementById('list').innerHTML = list;
        },
        "json"
        )
    });
    
}
google.maps.event.addDomListener(window, 'load', initialize);