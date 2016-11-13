<!DOCTYPE HTML>

<html>
<head>
    <title>Track My Hike</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/skel.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <!--[if lte IE 8]><script src="/css/ie/html5shiv.js"></script><![endif]-->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/jquery.dropotron.min.js"></script>
    <script src="/js/skel.min.js"></script>
    <script src="/js/skel-layers.min.js"></script>
    <script src="/js/init.js"></script>



    <!--[if lte IE 8]><link rel="stylesheet" href="/css/ie/v8.css" /><![endif]-->

</head>
<body>

<!-- Header Wrapper -->
<div class="wrapper style1">

    <!-- Header -->
    <div id="header">
        <div class="container">

            <!-- Logo -->
            <h1><a href="#" id="logo">Track My Hike</a> <sup>BETA!</sup></h1>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li class="active"><a href="/">Home</a></li>
                    <li class="active"><a href="/about/">About</a></li>
                    <li class="active"><a href="/contact/">Contact</a></li>
                    <li class="active"><a href="/map">Map</a></li>
                    <li> | </li>
                    {% if login == 1 %}

                        <li>
                            <a href="">{{ username }}</a>
                            <ul>
                                <li><a href="/tracks/view">My Tracks</a></li>
                                <li><a href="/devices">My Devices</a></li>
                                <li><a href="/account/settings">Account Settings</a></li>
                                <li><a href="/account/login">Logout</a></li>
                            </ul>
                        </li>
                    {% endif %}
                    {% if login == 0 %}
                        <li class="active"><a href="/account/signup">Sign Up</a></li>
                    {% endif %}
                </ul>
            </nav>

        </div>
    </div>
</div>

<!-- Main -->
<div id="main" class="wrapper style4">
{% block content %}

{% endblock %}

</div>
    <!-- Copyright -->
    <div id="copyright">
        <a href="http://templated.co">Design</a> | <a href="http://unsplash.com">Images</a> | © <a href="https://www.benfreke.com/">Ben Freke</a> 2015-2016
    </div>
</div>

</body>
</html>