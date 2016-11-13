<?php


class teams extends Phalcon\Mvc\Model
{
    public $id;
    public $name;
    public $img;

    public function initialize()
    {
    }
    public function beforeSave()
    {
    }
    public function afterFetch()
    {
        if ($this->img == null) $this->img = 'default.png';
    }

}