<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <!-- Bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="background-image: url('/images/login_background.jpeg');  background-size: cover; background-repeat: no-repeat;">
<div class="row" style="min-height: 100%; min-height: 100vh; display: flex; align-items: center;">
    <div class="col-md-4 col-md-offset-4">
        {% if errorMsg is defined %}
            <div class="alert alert-danger" role="alert"><b>Error:</b> {{ errorMsg }}</div>
        {% endif %}
        <div class="text-center">
            <form action="/admin/login/" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1" style="color:white; font-family: 'Raleway', sans-serif; font-size: 15pt"><b>Email address</b></label>
                    <input name="email" type="email" class="form-control" placeholder="Email" style="font-family: 'Raleway', sans-serif;">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1" style="color:white; font-family: 'Raleway', sans-serif; font-size: 15pt"><b>Password</b></label>
                    <input name="password" type="password" class="form-control" placeholder="Password"  style="font-family: 'Raleway', sans-serif;">
                </div>

                <button type="submit" class="btn btn-default" style="font-family: 'Raleway', sans-serif;">Login</button>
            </form>
        </div>
    </div>
</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script></body>
</html>