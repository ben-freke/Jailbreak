{% extends "/admin/base.volt" %}
{% block content %}

    <div class="row">
        <div class="col-md-2 col-md-offset-5 text-center">
            <a href="/admin/addteam"><button type="button" class="btn btn-success">Add New Team</button></a>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-10 col-md-offset-1 text-center">
            <table class="table table-bordered">
                <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Members</th>
                    <th>Last Reported Location</th>
                    <th>Last Update</th>
                    <th>Actions</th>
                </thead>
                <tbody>
                {% for team in teams %}
                <tr>
                    <td>{{ team['id'] }}</td>
                    <td>{{ team['name'] }}</td>
                    <td>

                        {% for member in team['members'] %}
                            {{ member }},
                        {% endfor %}

                    </td>
                    <td><a href="https://www.google.co.uk/maps/@{{ team['latitude'] }},{{ team['longitude'] }},8z">{{ team['currentLocation'] }}</a></td>
                    <td>{{ team['lastUpdate'] }}</td>
                    <td>
                        <div class="btn-group" role="group" aria-label="...">
                            <a href="/admin/updatelocation/{{ team['id'] }}" class="btn btn-success">Update Location</a>
                            <button type="button" class="btn btn-primary">Edit</button>
                            <button type="button" class="btn btn-danger">Delete</button>
                        </div>
                    </td>
                </tr>
                {% endfor %}
                </tbody>
            </table>
        </div>
    </div>


{% endblock %}