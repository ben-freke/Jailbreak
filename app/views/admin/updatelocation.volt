{% extends "/admin/base.volt" %}
{% block content %}


<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
<script type="text/javascript">
    google.maps.event.addDomListener(window, 'load', function () {
        var places = new google.maps.places.Autocomplete(document.getElementById('txtPlaces'));
        google.maps.event.addListener(places, 'place_changed', function () {
            var place = places.getPlace();
            var address = place.formatted_address;
            var longLat = place.geometry.location;
            var longLatField = document.getElementById("longLat");
            longLatField.value = String(longLat);
        });
    });
</script>



    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <h3 class="text-center">Update Location</h3><br>
            <form class="text-center" method="post" action="/admin/updatelocation/{{ teamid }}">
                <div class="form-group">
                    <label for="exampleInputEmail1">Update Location for <i>{{ teamname }}</i></label>
                    <input type="text" class="form-control" id="txtPlaces" placeholder="Enter a location" />
                    <input type="hidden" name="longLat" class="form-control" id="longLat" />
                </div>
                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>


{% endblock %}