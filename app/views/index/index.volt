<!DOCTYPE html>
<html>
<head>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <style>
        body{
            margin:0;
        }
        #map {
            width: 100%;
        }
    </style>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCndoHwWQRV5yUxDXg82ixveU27a4zx9Vk"></script>

</head>
<body>
<div id="map"></div>
<div class="alert alert-info" role="alert">
    <h3 class="text-center"><b>55,302km</b> travelled</h3>
</div>
<div class="row">
    <div class="col-md-2 col-md-offset-3"><button type="button" class="btn btn-primary" style="width: 100%"><h1 class="text-center"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></h1><h3 class="text-center">Teams</h3></button><p></p></div>
    <div class="col-md-2"><button type="button" class="btn btn-success" style="width: 100%"><h1 class="text-center"><span class="glyphicon glyphicon-gift" aria-hidden="true"></span></h1><h3 class="text-center">Fundraising</h3></button><p></p></div>
    <div class="col-md-2"><button type="button" class="btn btn-danger" style="width: 100%"><h1 class="text-center"><span class="glyphicon glyphicon-grain" aria-hidden="true"></span></h1><h3 class="text-center">Information</h3></button><p></p></div>

</div>
<script>
    var height = $( window ).height();

    document.getElementById("map").style.height =
            {% if bigscreen == 1 %}
                height + "px";
            {% else %}
                (height/3)*2 + "px";
            {% endif %}


</script>

<script>

    window.onload = function(){
        initMap();
        addMarkers();
    };

    var map = null;
    var polylines = new Array();
    var clicks = new Array();

    function initMap()
    {

        var ukcenter = {lat: 54.00366, lng: -2.547855};

        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 6,
            center: ukcenter
        });


        // Use JQuery to retrieve a JSON set of teams and their latest locations

    }

    function closePaths()
    {
        polylines.forEach(function(element) {
            element.setMap(null);
        });

    }

    function drawPath(markerID)
    {
        if(clicks[markerID] == true)
        {
            polylines[markerID].setMap(null);
            clicks[markerID] = false;
        } else {
            var coordinates = new Array();
            $.getJSON('/teams/gettrack/' + markerID, function(data) {
                $.each(data, function (index, track) {
                    coordinates.push({lat: track.lat, lng: track.lng});
                });
                polylines[markerID] = new google.maps.Polyline({
                    path: coordinates,
                    geodesic: true,
                    strokeColor: '#2e6bcc',
                    strokeOpacity: 1.0,
                    strokeWeight: 3
                });
                polylines[markerID].setMap(map);
                clicks[markerID] = true;
            });
        }
    }

    function addMarkers()
    {

        var info = new Array();
        var marker = new Array();
        var lancaster = {lat: 54.0104, lng: -2.7877};
        var oms = new OverlappingMarkerSpiderfier(map);
        var lancaster_marker = new google.maps.Marker({
            position: lancaster,
            map: map,
            icon: '/images/lancaster_logo.png'
        });
        oms.addListener('click', function(marker, event) {
            closePaths();
            drawPath(marker.id);
        });
        oms.addListener('spiderfy', function(markers) {
        });
        $.getJSON('/teams/getlocations/', function(data) {
            $.each(data, function (index, team) {
                //Create the marker for each team
                marker[team.id] = new google.maps.Marker({
                    id: team.id,
                    position: {lat: team.lat, lng: team.lng},
                    map: map,
                    icon: '/images/' + team.img
                });
                oms.addMarker(marker[team.id]);
                clicks[team.id] = false;
                marker[team.id].addListener('click', function() {

                });
                marker[team.id].addListener('mouseover', function() {
                    $.get( "/teams/getinfo/" + team.id, function( data ) {
                        info[team.id] = new google.maps.InfoWindow({
                            content: data,
                            maxWidth: 300
                        });
                        info[team.id].open(map, marker[team.id]);
                    });
                });
                marker[team.id].addListener('mouseout', function() {
                    info[team.id].close(map, marker[team.id]);
                });
            });
        });
    }
</script>
<script defer src="/js/oms.min.js"></script>


</body>
</html>