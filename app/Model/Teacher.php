<?php

App::uses('AppModel', 'Model');
App::uses('BlowfishPasswordHasher', 'Controller/Component/Auth');

class Teacher extends AppModel{
  // public $hasMany = "Comment";
  public $hasMany = array("Teachermatching","Comment","Post");
  //public $hasOne = "User";

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
        ),
      array(
        'rule' => array(
          'minLength' => 8,
           'message' => '8文字以上で入力して下さい。'
          )
      )
    )
  );

    public $actsAs = [
        'Upload.Upload' => [
            'photo' => [
                'fields' => [
                    'dir' => 'photo_dir'
                ]
            ]
        ]
    ];
    

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
