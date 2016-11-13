<?php

class ErrorController extends ControllerBase

{

    public function indexAction($error)
    {
        echo $error;
        switch ($error)
        {
            case 401:
                echo "<h1>Unauthorised</h1>";
                break;
        }
    }

}

