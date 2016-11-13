<?php


class locations extends Phalcon\Mvc\Model
{
    public $id;
    public $teamid;
    public $longitude;
    public $latitude;
    public $time;
    public $update_user;

    public function initialize()
    {
    }
    public function beforeSave()
    {
    }
    public function afterFetch()
    {
        $team = teams::findFirst(array(
            "conditions" => "id = :teamval:",
            "bind" => array ("teamval" => $this->teamid)
        ));
        $this->teamname = $team->name;
        $this->img = $team->img;
    }

}