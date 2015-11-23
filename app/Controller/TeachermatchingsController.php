<?php

class TeachermatchingsController extends AppController{

  public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow();
  }

  public function login(){
    if($this->request->is('post')){
      if($this->Auth->login()){
        $id = $this->Auth->user();
        $this->redirect($this->Auth->redirect());
      }else{
        $this->Flash->error(__('Invalid username or password, try again'));
      }
    }
  }




  public function offer_fromme(){ //自分からのオファーリスト

  }


  public function offer_tomi(){ //自分へのオファーリスト
    
  }


    public function lists_json(){
    $data = array(
      'status' => 'success'
    );
      $teachermatchings = $this->Teachermatching->find('all',$data);
      $this->viewClass = 'Json';
      $this->set(compact('teachermatchings'));
      $this->set('_serialize', 'teachermatchings');
  }


  public function logout(){
    $this->redirect($this->Auth->logout());
  }


  public function userlists(){

  }


  public function view($id = null){
    if(!$this->User->exists($id)){
      throw new NotFoundException(__('無効なユーザーです。'));
    }
    $this->set('user', $this->User->findById($id));
  }


  public function add_mystudent(){
    if($this->request->is('post')){
      if($this->Teachermatching->save($this->request->data)){
        $this->Flash->success(__('生徒が追加されました'));
        $this->redirect(array('controller'=>'teachers','action' => 'mypage'));
      }else{
        $this->Flash->error(__('登録失敗。もう一度やり直して下さい。'));
      }
    }
  }



    public function add_teacher(){
    if($this->request->is('post')){
      if($this->Teachermatching->save($this->request->data)){
        $this->Flash->success(__('講師が追加されました！'));
        $this->redirect(array('controller'=>'teachers','action' => 'mypage'));
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
