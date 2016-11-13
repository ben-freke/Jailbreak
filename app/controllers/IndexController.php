<?php
use Phalcon\Http\Request;

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $request = new Request();
        $teamsController = new TeamsController();
        $this->view->setVar('teams', $teamsController->getLocationsAction());
        $this->view->setVar('bigscreen', (int) $request->getQuery("bigscreen"));
    }

}

