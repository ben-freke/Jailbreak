<?php
use Phalcon\Http\Request;
use Phalcon\Session\Adapter\Files as Session;

class AdminController extends ControllerBase

{

    public function checkLogin()
    {
        if ($this->session->has("sessionID") && $this->session->has("sessionKey")) {
            $user = user::findFirst(array(
                "conditions" => "sessionID = :sessionIdVal: AND sessionKey = :sessionKeyVal:",
                "bind" => array ("sessionIdVal" => $this->session->get("sessionID"), "sessionKeyVal" => $this->session->get("sessionKey"))
            ));
            if ($user) return $user;
        }
        return false;

    }

    public function initialize()

    {
        $user = $this->checkLogin();
        if (!$user && rtrim($_SERVER['REQUEST_URI'], "/") != "/admin/login")
        {
            $this->redirect("/admin/login");
            return null;
        } else {
            $this->view->setVar("name", $user->firstname . " " . $user->lastname);
        }
    }

    public function loginAction()
    {
        $request = new Request();

        if ($request->isPost()) {
            $user = user::findFirst(array(
                "conditions" => "emailaddress = :emailVal: AND password = :passVal:",
                "bind" => array ("emailVal" => $request->get("email"), "passVal" => md5($request->get("password")))
            ));
            if ($user) {
                $key = md5(time());
                $this->session->set("sessionID", $user->sessionID);
                $this->session->set("sessionKey", $key);
                $user->sessionKey = $key;
                $user->save();

                $this->redirect("/admin/");
            }
            else {
                $this->view->setVar('errorMsg', 'Your username or password is incorrect.');
            }

        }
    }

    public function addTeamAction()
    {
        $request = new Request();
        if ($request->isPost()) {
            $team = new teams();
            $team->name = $request->get("name");
            if(!$team->save()) $this->redirect("/admin/addteam?success=1");
            else $this->redirect("/admin/addteam?success=0");
        }
    }

    public function updateLocationAction($teamID)
    {
        $team = teams::findFirst(array(
            "conditions" => "id = :teamval:",
            "bind" => array ("teamval" => $teamID)
        ));
        $this->view->setVar("teamid", $team->id);
        $this->view->setVar("teamname", $team->name);

        $request = new Request();
        if ($request->isPost()) {
            $data = $request->get("longLat");
            $data = str_replace(array("(", ")"), "", $data);
            $data = explode(",", $data);
            $location = new locations();
            $location->teamid = $team->id;
            $location->longitude = $data[1];
            $location->latitude = $data[0];
            $location->update_user = 0;

            if(!$location->save()) $this->redirect("/admin/updatelocation?success=1");
            else $this->redirect("/admin/teams/");
        }
    }

    public function teamsAction()
    {
        $teams = teams::find();
        $data = array();
        foreach ($teams as $team)
        {
            $data[$team->id]['id'] = $team->id;
            $data[$team->id]['name'] = $team->name;
            $data[$team->id]['members'] = array('Ben', 'Alex', 'Other');
            $location = locations::findFirst(array(
                "conditions" => "teamid = :teamval:",
                "order" => "time DESC",
                "bind" => array ("teamval" => $team->id)
            ));
            $data[$team->id]['longitude'] = $location->longitude;
            $data[$team->id]['latitude'] = $location->latitude;
            $data[$team->id]['currentLocation'] = $this->getLocation($location->latitude, $location->longitude);
            $data[$team->id]['lastUpdate'] = $this->getTimeElapsed($location->time);
        }
        $this->view->setVar('teams', $data);
    }

    public function indexAction()
    {

    }

    public function logoutAction()
    {
        $this->session->remove("sessionID");
        $this->session->remove("sessionKey");
        $this->redirect("/admin/login");

    }

}

