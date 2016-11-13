<?php
use Phalcon\Http\Response;

class ControllerBase extends \Phalcon\Mvc\Controller

{
    const MAPS_API_KEY = "AIzaSyCndoHwWQRV5yUxDXg82ixveU27a4zx9Vk";
    const SITE_URL = "http://localhost:8888";
    public function initialize()
    {
    }

    public function redirect($url)
    {
        $response = new Response();
        $response->redirect(self::SITE_URL . $url);
        $response->send();

    }

    public function checkLogin()
    {
        $this->userid = 1;
        $this->view->setVar('login', 1);
        $this->view->setVar('username', "Joe Bloggs");
        $this->view->setVar('userid', 1);
        $this->view->setVar('maps_api_key', self::MAPS_API_KEY);
        $this->view->setVar('map_zoom', 14);
        $this->view->setVar('intervalTime', 60);

    }

    public function getLocation($lat, $long)
    {
        $json = file_get_contents('https://maps.googleapis.com/maps/api/geocode/json?latlng='.$lat.','.$long.'&key=' . self::MAPS_API_KEY);
        $obj = json_decode($json);
        $address = "";
        foreach ($obj->results[0]->address_components as $component)
        {
            if (in_array("postal_town", $component->types)) $address = $address . $component->long_name . ", ";
            elseif (in_array("country", $component->types)) $address = $address . $component->long_name;
        }

        return $address;
    }

    public function getTimeElapsed($datetime, $full = false) {
        $now = new DateTime;
        $ago = new DateTime($datetime);
        $diff = $now->diff($ago);

        $diff->w = floor($diff->d / 7);
        $diff->d -= $diff->w * 7;

        $string = array(
            'y' => 'year',
            'm' => 'month',
            'w' => 'week',
            'd' => 'day',
            'h' => 'hour',
            'i' => 'minute',
            's' => 'second',
        );
        foreach ($string as $k => &$v) {
            if ($diff->$k) {
                $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
            } else {
                unset($string[$k]);
            }
        }

        if (!$full) $string = array_slice($string, 0, 1);
        return $string ? implode(', ', $string) . ' ago' : 'just now';
    }

}

