<?php

App::uses('AppModel', 'Model');
App::uses('BlowfishPasswordHasher', 'Controller/Component/Auth');

class User extends AppModel{
  public $hasMany = array("Teachermatching","Comment","Post");
  public $belongsTo = "Recture";
  public $hasOne = array(
        'Student' => array(
            'className' => 'Student',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'fields' => '',
            'order' => '',
            'dependent' => false
        ),
        'Teacher' => array(
            'className' => 'Teacher',
            'foreignKey' => 'user_id',
            'conditions' => '',
            'fields' => '',
            'order' => '',
            'dependent' => false
        )
    );

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
    'role' => array(
      'valid' => array(
        'rule' => array('inList', array('admin', 'author')),
        'message' => 'Please enter a valid role.',
        'allowEmpty' => false
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
