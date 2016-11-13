{% extends "/admin/base.volt" %}
{% block content %}

    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <h3 class="text-center">Add a new team</h3><br>
            <form class="text-center" method="post" action="/admin/addteam">
                <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input name="name" type="text" class="form-control" id="exampleInputEmail1" placeholder="Team Name">
                    <label for="exampleInputEmail1">Image</label>
                    <input  class="form-control" type="file" name="fileToUpload" id="fileToUpload">
              </div>
                <button type="submit" class="btn btn-success">Add</button>
            </form>
        </div>
    </div>

{% endblock %}