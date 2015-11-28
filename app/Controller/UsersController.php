<?php

class UsersController extends AppController{

  public $uses = array('Teacher', 'User');

  public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow('lists_json','login','logout','index');

    $this->Auth->redirectUrl(array(
      'action'=>'tomypage'));
  }

  // public function login_user_student($teacher = null){
  //   if($this->request->is('post')){
  //     if($this->Auth->login()){
  //       $logged_in = $this->Auth->user();
  //       $this->redirect($this->Auth->redirect());
  //     }else{
  //       $this->Flash->error(__('メールアドレスとパスワードのどちらかが間違っています。もう一度入力してください。'));
  //     }
  //   }
  //     $this->set('loginname','生徒');
  // }


  public function login(){
    if($this->request->is('post')){
      if($this->Auth->login()){
        $logged_in = $this->Auth->user();
        $this->redirect($this->Auth->redirect());
      }else{
        $this->Flash->error(__('メールアドレスとパスワードのどちらかが間違っています。もう一度入力してください。'));
      }
    }
  }



  public function lists(){
    $params = array(
        'order' => 'User.modified desc',
        'conditions' => array(
            'User.username !=' => NULL
          )
      );
    $this->set('user', $this->User->find('all', $params));
  }




  public function logout(){
    $this->redirect($this->Auth->logout());
  }


public function mypage(){
  $session_id = $this->Auth->user('id');
  $session_name = $this->Auth->user('username');
  // $id = 5;
  if(!$session_id){
    throw new NotFoundException(__('ログインされていません。'));
  }
  
   $params = array(
    'order' => 'Teacher.modified desc',
    'limit' => 10
    );
  $teacher = $this->Teacher->find('all',$params);
  // $this->set('teacher',$teacher);
  $user = $this->User->findById($session_id);
  $this->set(compact('teacher','user'));
}


public function profile($id = null){
  $this->set('user', $this->User->findById($id));
}




  public function index(){
    $teacher = $this->Teacher->find('all' ,array('limit' => 10));
    #$this->set('teacher', $this->Teacher->find('all', array('limit' => 10)));
    $user = $this->User->find('all' ,array('limit' => 10));
    $this->set(compact('user', 'teacher'));
  }

  /*public function index(){
    $this->User->recursive = 0;
    $this->set('users', $this->paginate());
  }*/

  public function view($id = null){
    if(!$this->User->exists($id)){
      throw new NotFoundException(__('無効なユーザーです。'));
    }
    // $this->set('user', $this->User->findById($id));
    $this->User->id = $id;
    $this->set('user', $this->User->read());
    //$this->set('teachermatchings',$this->User->find('all',array('user' => 'User.id')));
  }


    public function add(){
    $this->_addAssociated();
    if($this->request->is('post')){
      $this->User->create();
      if($this->User->save($this->request->data)){

        $this->Flash->success(__('登録完了しました。'));
        $this->redirect(array('action' => 'login'));
      }else{
        $this->Flash->error(__('エラーがあります。以下の内容を確認して下さい。'));
      }
    }
  }



  public function edit($id = null){
    $this->User->id = $id;
    if(!$this->User->exists()){
      throw new NotFoundException(__('Invalid user'));
    }
    if($this->request->is('post') || $this->request->is('put')){
      if($this->User->save($this->request->data)){
        $this->Flash->success(__('The user has been saved'));
        $this->redirect(array('controller' => 'users', 'action' => 'mypage'));
      }else{
        $this->Flash->error(__('The user could not saved. Please try again.'));
      }
    }else{
      $this->request->data = $this->User->findById($id);
      unset($this->request->data['User']['password']);
    }
  }



  public function lists_json(){
    $data = array(
      'status' => 'success',
      'order' => 'created desc'
    );
      $users = $this->User->find('all',$data);
      $this->viewClass = 'Json';
      $this->set(compact('users'));
      $this->set('_serialize', 'users');
  }


  public function delete($id = null){
    $this->request->onlyAllow('post');

    $this->User->id = $id;
    if(!$this->User->exists()){
      throw new NotFoundException(__('Invalid User'));
    }
    if($this->User->delete()){
      $this->Flash->success(__('User deleted'));
      $this->redirect(array('action' => 'index'));
    }
    $this->Flash->error(__('User was not delete.'));
    $this->redirect(array('action' => 'index'));
  }
}
