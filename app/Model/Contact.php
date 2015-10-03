<?php

class Contact extends AppModel{
  public $useTable = false;
  public $_schema = array(
    'subject' => array('type' => 'select'),
    'name' => array('type' => 'string', 'length' => 255),
    'kana' => array('type' => 'string', 'length' => 255),
    'email' => array('type' => 'string', 'length' => 255),
    'confirm' => array('type' => 'string', 'length' => 255),
    'body' => array('type' => 'text'),
    'agreement' => array('type' => 'integer'),
  );

  /**
  * バリデーション用関数
  * メールアドレス確認用が同一かどうかチェックする
   */
  function confirmEmail(){
    if($this->data['Contact']['email'] != $this->data['Contact']['confirm']){
      return false;
    }else{
      return true;                }
  }

   public $validate = array(
     #　名前
     'name' => array(
        'notBlank' => array(
           'rule' => array('notBlank'),
           'message' => '未入力です。',
           'required' => true,
         ),
         'maxLength' => array(
                 'rule' => array('maxLength', 255),
                 'message' => '255文字以内で入力してください。',
                 'required' => true,
        ),
     ),

     # カタカナでの名前
     'kana' => array(
       'notBlank' => array(
         'rule' => array('notBlank'),
         'message' => '未入力です。',
         'required' => true,
       ),
       'maxLength' => array(
         'rule' => array('maxLength', 255),
         'message' => '255文字以内で入力してください。',
         'required' => true,
       ),
     ),
     #　メール
     'email' => array(
        'notBlank' => array(
          'rule' => array('notBlank'),
          'message' => '未入力です。',
          'required' => true,
        ),
        'email' => array( 'rule' => array('email'),
          'message' => 'メールアドレス以外が入力されてい>ます。',
          'required' => true,
        ),
        'maxLength' => array(
           'rule' => array('maxLength', 255),
             'message' => '255文字以内で入力してくだい。',
             'required' => true,
        ),
     ),
     # 確認用メールアドレス
     'confirm' => array(
       'notBlank' => array(
         'rule' => array('notBlank'),
         'message' => '未入力です。',
         'required' => true,
       ),
     ),
     'email' => array(
          'rule' => array('email'),
          'message' => 'メールアドレス以外が入力されてい>ます。',
          'required' => true,
         ),

      'maxLength' => array(
          'rule' => array('maxLength', 255),
          'message' => '255文字以内で入力してくだい。',
          'required' => true,
      ),
      'equal' => array(
         'rule' => 'confirmEmail',
         'last' => true,
         'message' => '上記メールアドレスと違うのでご確認
してください',
      ),

      #　内容
      'body' => array(
          'notBlank' => array(
                      'rule' => array('notBlank'),
                      'message' => '未入力です。',  'required' => true,
          ),
          'maxLength' => array(
             'rule' => array('maxLength', 3000),
            'message' => '3000文字以内で入力してくだい。',
             'required' => true,
          ),
      ),
      # 規約への同意
      'agreement' => array(
        'agree' => array(
          'rule' => array('comparison', '!=', 0),
          'required' => true,
          'message' => '「個人情報の取り扱いについて」に同意してください。',
          'on' => 'create'
        )
     )
  );
}
