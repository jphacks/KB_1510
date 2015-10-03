<?php

class TeachersController extends AppController{

  public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow('add', 'logout');
  }

  public function login(){
    if($this->request->is('post')){
      if($this->Auth->login()){
        $this->redirect($this->Auth->redirect());
      }else{
        $this->Flash->error(__('Invalid username or password, try again.'));
      }
    }
  }

  public function logout(){
    $this->redirect($this->Auth->logout());
  }

  public function index(){
    $this->Teacher->recursive = 0;
    $this->set('teachers', $this->paginate());
  }

  public function view($id = null){
    if(!$this->Teacher->exists($id)){
      throw new NotFoundException(__('Invalid user'));
    }
    $this->set('teacher', $this->Teacher->findById($id));
  }

  public function add(){
    if($this->request->is('post')){
      $this->Teacher->create();
      if($this->Teacher->save($this->request->data)){
        $this->Flash->success(__('The user has been saved.'));
        $this->redirect(array('action' => 'index'));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
      }
    }
  }

  public function edit($id = null){
    if(!$this->Teacher->exists()){
      throw new NotFoundException(__('Invalid user'));
    }
    if($this->request->is('post') || $this->request->is('put')){
      if($this->Teacher->save($this->request->data)){
        $this->Flash->success(__('The user has been saved.'));
        $this->redirect(array('action' => 'index'));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
      }
    }else{
      $this->request->data = $this->Teacher->findById($id);
      unset($this->request->data['Teacher']['password']);
    }
  }

  public function delete($id = null){
    $this->request->onlyAllow('post');

    $this->Teacher->id = $id;
    if(!$this->Teacher->exists()){
      throw new NotFoundException(__('Invalid user'));
    }
    if($this->Teacher->delete()){
      $this->Flash->success(__('User deleted.'));
      $this->redirect(array('action' => 'index'));
    }
    $this->Flash->error(__('User was not deleted.'));
    $this->redirect(array('action' => 'index'));
  }
}
