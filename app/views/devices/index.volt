{% extends 'base.volt' %}
{% block content %}

    <div id="content" class="container">
        <section>
            <header class="major">
                <h2>My Devices <a href="/devices/add/"><button type="button" class="btn btn-success">Add New</button></a></h2>

            </header>

            {% for device in devices %}

                <div class="col-md-3">
                    <div class="text-center">
                        <img src="/images/{{ device.os }}.png" alt="{{ device.os }}" height="250">
                        <h3>{{ device.name }}</h3>
                        <br>
                        {% if device.status == '1' %} <div class="alert alert-success" role="alert">Active</div>{% endif %}
                        {% if device.status == '0' %} <div class="alert alert-danger" role="alert">Unactive</div>{% endif %}
                        <a href="/devices/delete/{{ device.id }}">
                            <div class="btn-group btn-group-lg" role="group" aria-label="...">
                                <button type="button" class="btn btn-danger">Delete</button>
                            </div>
                        </a>
                    </div>
                </div>

            {% endfor %}



        </section>
    </div>

{% endblock %}