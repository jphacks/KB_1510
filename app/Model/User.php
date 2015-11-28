<?php

App::uses('AppModel', 'Model');
App::uses('BlowfishPasswordHasher', 'Controller/Component/Auth');

class User extends AppModel{
  

  public $name = 'User';
  
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
      ),
      array(
        'rule' => array('minLength', 2),
        'message' => '8文字以上で入力して下さい'
        )
    ),
    'email' => array(
       'rule'   => 'isUnique',
      'message' => 'そのメールアドレスは既に使用されています。',
    ),
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


  public function beforeSave($options = array()){
    if(isset($this->data[$this->alias]['password'])){
      $passwordHasher = new BlowfishPasswordHasher();
      $this->data[$this->alias]['password'] = $passwordHasher->hash(
        $this->data[$this->alias]['password']
      );
    }
    return true;
  }
}
