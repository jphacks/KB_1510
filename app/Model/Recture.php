 <?php

App::uses('AppModel', 'Model');
App::uses('BlowfishPasswordHasher', 'Controller/component/Auth');

class Recture extends AppModel{
  public $belongsTo = "Teacher";
  public $hasMany = "User";
  public $validate = array(
    'body' => array(
      'required' => array(
        'rule' => array('notBlank'),
        'message' => 'A password is required.'
        )
      ),
      'title' => array(
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


  // $session_state = 0; //ログインしているのが講師の場合が０（SessionComponentsで調整）
  //$session_id = 9; //上と合わせると、講師のidが9という条件の選択 （この２つの値をSessionComponentsで調整）

  // echo $this->Form->create('Comment',array('action'=>'add'));
  
  //     if($session_state = 0){ //コメントする人が講師か生徒かによって、場合分け（講師と生徒のidは同じものがあるので、どちらのtableかを決定するため）
  //       $toinsert_id = 'Comment.teacher_id';
  //       $frominsert_id = 'Comment.user_id';
  //       $toval_id = $teacher['Teacher']['id'];
  //       $toval_name = $teacher['Teacher']['username'];
  //     }else{
  //       $toinsert = 'Comment.user_id';
  //       $frominsert_id = 'Comment.teacher_id';
  //       $toval_id = $teacher['User']['id'];
  //       $toval_name = $teacher['User']['username'];
  //     }

  //     echo $this->Form->input($toinsert_id,array('type'=>'hidden','value'=>$toval_id));
  //     echo $this->Form->input('Comment.commenter',array('type'=>'hidden','value'=>$toval_name));
  //     echo $this->Form->input($frominsert_id,array('type'=>'hidden','value'=>$session_id)); //今ログインしている人がコメントするため。
  //  echo $this->Form->end();
  ?>