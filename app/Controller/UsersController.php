<?php

class UsersController extends AppController{

  public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow('add', 'logout');
  }

  public function login(){
    if($this->request->is('post')){
      if($this->Auth->login()){
        $id = $this->Auth->user();
        $this->redirect($this->Auth->redirect($id));
      }else{
        $this->Flash->error(__('Invalid username or password, try again'));
      }
    }
  }

  public function logout(){
    $this->redirect($this->Auth->logout());
  }

  public function index(){
    $this->User->recursive = 0;
    $this->set('users', $this->paginate());
  }

  public function view($id = null){
    if(!!$this->User->exists($id)){
      throw new NotFoundException(__('無効なユーザーです。'));
    }
    $this->set('user', $this->User->findById($id));
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
        $this->redirect(array('controller' => 'posts', 'action' => 'index'));
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
