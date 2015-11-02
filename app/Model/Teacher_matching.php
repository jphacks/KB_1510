<?php

App::uses('AppModel', 'Model');

class Teacher_matching extends AppModel{
  // public $hasOne = 'Message';
  public $belongsTo = 'User';

}
