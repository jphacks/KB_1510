<?php

App::uses('AppModel', 'Model');
App::uses('BlowfishPasswordHasher', 'Controller/component/Auth');

class Teacher extends AppModel{
  public $validate = array(
    'username' => array(
      'required' => array(
        'rule' => array('notBlank'),
        'message' => 'A username is required'
        )
      ),
    'password' => array(
      'required' => array(
        'rule' => array('notBlank'),
        'message' => 'A password is required.'
      )
    )
  );

  public function beforesave($options = array()){
    if(isset($this->data[$this->alias]['password'])){
      $passwordHasher = new BlowfishPasswordHasher();
      $this->data[$this->alias]['password'] = $passwordHasher->hash(
        $this->data[$this->alias]['password']
      );
    }
    return true;
  }

  public function isOwnedBy($teacher, $user){
    return $this->field('id', array('id' => $teacher)) !== false;
  }
}
