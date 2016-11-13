{% extends 'base.volt' %}
{% block content %}

    <div id="content" class="container">
        <section>
            <header class="major">
                <h2>The Map</h2>
                <span class="byline"><b>{{ username }}'s Hike: </b>
                    {% if track.status == 1 %}
                        <b style="color: red">Live!</b>
                    {% else  %}
                        {{ track.time }}
                    {% endif %}
                </span>
            </header>
            {% if track.status == 1 %}
                <p><b>Speed: </b> 3.4 Km/h | <b>Elevation: </b> 198.8 m | <b>Last Update: </b> 11 mins | <b>Next Refresh: </b> <c id="time_till_update"></c></p>
            {% endif %}
            <div id="map" style="width: 100%; "></div>
            <script>
                var map;
                $( document ).ready(function() {
                    setHeight();
                    countdown();
                });

                function countdown()
                {
                    var count = {{ intervalTime }}, timer = setInterval(function() {
                        $("#time_till_update").html(count--);

                        {% if track.status == 1 %}
                            if(count == 1) refreshPage();
                        {% endif %}
                    }, 1000);
                }

                function refreshPage()
                {
                    location.reload();
                }

                function setHeight(){
                    var body = document.body,
                            html = document.documentElement;

                    var height = Math.max( body.scrollHeight, body.offsetHeight,
                            html.clientHeight, html.scrollHeight, html.offsetHeight );
                    var map = document.getElementById("map");
                    map.setAttribute("style", "height: " + height/1.3 + "px;");
                }
                function initMap() {
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: {lat: {{ currLat }}, lng: {{ currLong }}},
                        zoom: {{ map_zoom }},
                        mapTypeId: google.maps.MapTypeId.TERRAIN
                    });


                    var marker = new google.maps.Marker({
                        position: {lat: {{ currLat }}, lng: {{ currLong }}},
                        map: map,
                        title: 'Hello World!'
                    });

                    var routeArray = [
                        {% for location in locArray %}
                        {lat: {{ location.lat }}, lng: {{ location.long}}},
                        {% endfor %}
                    ];

                    var flightPath = new google.maps.Polyline({
                        path: routeArray,
                        geodesic: true,
                        strokeColor: '#FF0000',
                        strokeOpacity: 1.0,
                        strokeWeight: 5
                    });

                    flightPath.setMap(map);
                    marker.setMap(map);

                }
            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC-p1XhM-GHZubu9Vu7SU7P9Cmwx2YTAWQ&callback=initMap"
                    async defer></script>
            </section>


    </div>
    </div>

{% endblock %}