<?php

App::uses('AppModel', 'Model');

class User_matching extends AppModel{
  // public $hasOne = 'Message';
  public $belongsTo = 'Teacher';
  public $validate = array(
    'username' => array(
      'required' => array(
        'rule' => array('notBlank'),
        'message' => 'A username is required.'
      )
    ),
    'password' => array(
      'required' => array(
        'rule' => array('notBlank'),
        'message' => 'A password is required.'
      )
    ),
    'role' => array(
      'valid' => array(
        'rule' => array('inList', array('admin', 'author')),
        'message' => 'Please enter a valid role.',
        'allowEmpty' => false
      )
    )
  );
}
