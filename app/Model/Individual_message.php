<?php

App::uses('AppModel', 'Model');
App::uses('BlowfishPasswordHasher', 'Controller/component/Auth');

class Individual_message extends AppModel{
  public $belongsTo = 'Message';
  public $validate = array(
    'body' => array(
      'required' => array(
        'rule' => array('notBlank'),
        'message' => 'A body is required'
        )
      )
  );

  // public function beforesave($options = array()){
  //   if(isset($this->data[$this->alias]['password'])){
  //     $passwordHasher = new BlowfishPasswordHasher();
  //     $this->data[$this->alias]['password'] = $passwordHasher->hash(
  //       $this->data[$this->alias]['password']
  //     );
  //   }
  //   return true;
  // }

  // public function isOwnedBy($teacher, $user){
  //   return $this->field('id', array('id' => $teacher)) !== false;
  // }
}
