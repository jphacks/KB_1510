<?php

class PlacesController extends AppController{

  public $uses = array('Place', 'User');

  public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow('lists_json','login','logout','index');

    $this->Auth->redirectUrl(array(
      'action'=>'tomypage'));
  }


  public function lists(){
    $params = array(
        'order' => 'Place.modified desc',
        'conditions' => array(
            'Place.name !=' => NULL
          )
      );
    $this->set('place', $this->Place->find('all', $params));
  }



  public function lists_json(){
    $data = array(
      'status' => 'success',
      'order' => 'created desc'
    );
      $users = $this->Place->find('all',$data);
      $this->viewClass = 'Json';
      $this->set(compact('places'));
      $this->set('_serialize', 'places');
  }


  public function index(){
    #$this->set('teacher', $this->Teacher->find('all', array('limit' => 10)));
    $params = $this->Place->find('all' ,array('limit' => 10));
    $this->set('place',$this->Place->find('all',$params);
  }

  /*public function index(){
    $this->Place->recursive = 0;
    $this->set('places', $this->paginate());
  }*/

  public function view($id = null){
    if(!$this->Place->exists($id)){
      throw new NotFoundException(__('無効なユーザーです。'));
    }
    // $this->set('place', $this->Place->findById($id));
    $this->Place->id = $id;
    $this->set('place', $this->Place->read());
    //$this->set('teachermatchings',$this->Place->find('all',array('user' => 'User.id')));
  }


 public function add(){
    $this->_addAssociated();
    if($this->request->is('post')){
      $this->Place->create();
      if($this->Place->save($this->request->data)){

        $this->Flash->success(__('登録完了しました。'));
        $this->redirect(array('action' => 'login'));
      }else{
        $this->Flash->error(__('エラーがあります。以下の内容を確認して下さい。'));
      }
    }
  }



  public function edit($id = null){
    $this->Place->id = $id;
    if(!$this->Place->exists()){
      throw new NotFoundException(__('Invalid user'));
    }
    if($this->request->is('post') || $this->request->is('put')){
      if($this->Place->save($this->request->data)){
        $this->Flash->success(__('The user has been saved'));
        $this->redirect(array('controller' => 'places', 'action' => 'mypage'));
      }else{
        $this->Flash->error(__('The user could not saved. Please try again.'));
      }
    }else{
      $this->request->data = $this->Place->findById($id);
    }
  }


  public function delete($id = null){
    $this->request->onlyAllow('post');

    $this->Place->id = $id;
    if(!$this->Place->exists()){
      throw new NotFoundException(__('Invalid User'));
    }
    if($this->Place->delete()){
      $this->Flash->success(__('User deleted'));
      $this->redirect(array('action' => 'index'));
    }
    $this->Flash->error(__('User was not delete.'));
    $this->redirect(array('action' => 'index'));
  }
}
