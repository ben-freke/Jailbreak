<?php


class user extends Phalcon\Mvc\Model
{
    public $id;
    public $firstname;
    public $lastname;
    public $type;
    public $email_address;
    public $password;
    public $sessionID;
    public $sessionKey;

    public function initialize()
    {
    }
    public function beforeSave()
    {
    }
    public function afterFetch()
    {
        
    }

}