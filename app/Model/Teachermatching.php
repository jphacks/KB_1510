<?php

App::uses('AppModel', 'Model');

class Teachermatching extends AppModel{
  // public $hasOne = 'Message';
  public $belongsTo = array('User','Teacher');
}
