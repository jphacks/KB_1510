<?php

class UsersController extends AppController{

  public $uses = array('Teacher', 'User');

  public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow('add','lists','lists_json','mypage','profile');
  }

  public function login(){
    if($this->request->is('post')){
      if($this->Auth->login()){
        $id = $this->Auth->user();
        $this->redirect($this->Auth->redirect());
      }else{
        $this->Flash->error(__('メールアドレスとパスワードのどちらかが間違っています。もう一度入力してください。'));
      }
    }
  }

    public function lists(){
    $params = array(
        'order' => 'modified desc',
        'limit' => 20
      );
    $this->set('user', $this->User->find('all', $params));
    $this->set('teachersmatching',$teachermatchings);
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


  public function logout(){
    $this->redirect($this->Auth->logout());
  }

  public function mypage(){
    $id = $this->Auth->user('id');
    // $id = 5;
    if(!$id){
      throw new NotFoundException(__('ログインされていません'));
    }
    
     $params = array(
      'order' => 'modified desc',
      'limit' => 10
      );
    $teacher = $this->Teacher->find('all',$params);
    // $this->set('teacher',$teacher);
    $user = $this->User->findById($id);
    $this->set(compact('teacher','user'));
  }


    public function profile($id = null){
    $this->set('user', $this->User->findById($id));
  }



public function uploads($id = null){
     // if(!$this->Teacher->exists()){
    //   throw new NotFoundException(__('Invalid user'));
    // }
    $this->Teacher->id = $id;
    if($this->request->is('get')){
      $this->set('teacher',$this->User->findById($id));
      $this->request->data = $this->Teacher->read();
    }else{
      if($this->Teacher->save($this->request->data)){
        $this->Flash->success('写真を変更しました。');
        $this->redirect(array('action' => 'mypage'));
      }else{
        $this->Flash->error('failed');
      }
    }
    $this->render('uploads');
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
    if($this->request->is('post')){
      $this->User->create();
      if($this->User->save($this->request->data)){
        $this->Flash->success(__('The user has been saved.'));
        $this->redirect(array('action' => 'login'));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
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
