<?php
/**
 * Created by PhpStorm.
 * User: Ben Freke
 * Date: 10/03/2016
 * Time: 20:07
 */

class TeamsController extends ControllerBase
{

    public function initialize()
    {

    }

    public function indexAction()
    {
    }

    public function getLocationsAction()
    {
        $teams = teams::find();
        $data = array();
        foreach ($teams as $team)
        {
            $location = locations::findFirst(array(
                "conditions" => "teamid = :teamval:",
                "order" => "time DESC",
                "bind" => array ("teamval" => $team->id)
            ));
            $data[$team->id]['id'] = (int) $team->id;
            $data[$team->id]['name'] = $team->name;
            $data[$team->id]['img'] = $team->img;
            $data[$team->id]['lat'] = (double) $location->latitude;
            $data[$team->id]['lng'] = (double) $location->longitude;
        }
        echo json_encode($data);
        return json_encode($data);
    }

    public function getLocationAction($teamID)
    {
        return json_encode(locations::findFirst(array(
            "conditions" => "teamid = :teamval:",
            "order" => "time DESC",
            "bind" => array ("teamval" => $teamID)
        )));
    }

    public function getTrackAction($teamID)
    {
        $locations = locations::find(array(
            "conditions" => "teamid = :teamval:",
            "order" => "time DESC",
            "bind" => array ("teamval" => $teamID)
        ));
        $data = array();
        $i = 0;
        foreach ($locations as $location) {
            $data[$i]['lat'] = (double) $location->latitude;
            $data[$i]['lng'] = (double) $location->longitude;
            $i++;
        }
        echo json_encode($data);
    }

    public function getInfoAction($teamID){
        $team = teams::findFirst(array(
            "conditions" => "id = :idVal:",
            "bind" => array ("idVal" => $teamID)
        ));
        $this->view->setVar('teamname', $team->name);
        $this->view->setVar('distance', '5,321');
        $this->view->setVar('home', 'Lancaster');
        $this->view->setVar('lastlocation', 'The English Channel');
        $this->view->setVar('img_large', 'freke_ben_large.png');

    }

}