<?php

class CommentsController extends AppController{

 public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow();
  }


  public function lists(){
    $params = array(
        'order' => 'modified desc',
        'limit' => 20
      );
    $this->set('comment', $this->Comment->find('all',$params));
  }


  public function add(){
    if($this->request->is('post')){
      $this->Comment->create();
      if($this->Comment->save($this->request->data)){
        $this->Flash->success(__('The comment has been saved.'));
        $this->redirect(array('action' => 'list'));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
      }
    }
  }

  public function edit($id = null){
    if(!$this->Comment->exists()){
      throw new NotFoundException(__('Invalid user'));
    }
    if($this->request->is('post') || $this->request->is('put')){
      if($this->Comment->save($this->request->data)){
        $this->Flash->success(__('The user has been saved.'));
        $this->redirect(array('action' => 'mypage'));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
      }
    }else{
      $this->request->data = $this->Comment->findById($id);
      unset($this->request->data['Comment']['password']);
    }

    $this->set('program_language',$this->Comment->find('list', array(
      'fields' => array('C', 'C+', 'Java')
    )));
  }

  public function delete($id = null){
    $this->request->onlyAllow('post');

    $this->Comment->id = $id;
    if(!$this->Comment->exists()){
      throw new NotFoundException(__('Invalid user'));
    }
    if($this->Comment->delete()){
      $this->Flash->success(__('User deleted.'));
      $this->redirect(array('action' => 'index'));
    }
    $this->Flash->error(__('User was not deleted.'));
    $this->redirect(array('action' => 'index'));
  }

  public function isAuthorized($user){
    if($this->action === 'add'){
      return true;
    }

    if(in_array($this->action, array('edit', 'delete'))){
      $teacherId = (int)$this->request->param['pass'][0];
      if($this->Comment->isOwnedBy($teacherId, $user['id'])){
        return true;
      }
    }
    return parent::isAuthorized($user);
  }
}
