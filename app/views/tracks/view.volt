{% extends 'base.volt' %}
{% block content %}

    <div id="content" class="container">
        <section>
            <header class="major">
                <h2>The Map</h2>
                        <span class="byline"><b>{{ username }}'s Tracks</b>
                            <a href="/tracks/add/"><map><button type="button" class="btn btn-success">Add New</button></map></a>

                        </span>
            </header>

            <table class=table>
                <thead>
                <tr>
                    <th><b>ID</b></th>
                    <th><b>Track Name</b></th>
                    <th><b>Start Date</b></th>
                    <th><b>Location</b></th>
                    <th><b>Length</b></th>
                    <th><b>Status</b></th>

                    <th></th>

                </tr>
                </thead>
                <tbody>
                {% for track in tracks %}
                    <tr>
                        <td>{{ track.id }}</td>
                        <td>{{ track.name }}</td>
                        <td>{{ track.time }}</td>
                        <td>{{ track.location }}</td>
                        <td>{{ track.distance }} km</td>
                        {% if track.status == 0 %}
                            <td>Not Yet Started</td>
                        {% endif %}
                        {% if track.status == 1 %}
                            <td><b style="color: red">LIVE!</b></td>
                        {% endif %}
                        {% if track.status == 2 %}
                            <td>Completed</td>
                        {% endif %}

                        <td>
                            <a href="/map/track/{{ userid }}/{{ track.id }}"><map><button type="button" class="btn btn-default">View Map</button></map></a>
                            <a href="/tracks/delete/{{ track.id }}"><map><button type="button" class="btn btn-default">Delete</button></map></a>
                            {% if track.status == 1 %}
                                <a href="/tracks/stop/{{ track.id }}"><map><button type="button" class="btn btn-danger">Stop</button></map></a>
                            {% endif %}
                            {% if track.status == 1 %}
                                <a href="/tracks/stop/{{ track.id }}"><map><button type="button" class="btn btn-primary">Share</button></map></a>
                            {% elseif track.status == 2 %}
                                    <a href="/tracks/stop/{{ track.id }}"><map><button type="button" class="btn btn-primary">Share</button></map></a>
                            {% endif %}
                        </td>

                    </tr>
                {% endfor %}


                </tbody>
            </table>


        </section>
    </div>



{% endblock %}