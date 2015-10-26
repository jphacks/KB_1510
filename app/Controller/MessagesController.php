<?php

class MessagesController extends AppController{

 public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow();
 }


  public function whoview($id = null){
    $this->Message->id = $id;

    // $params = array(
    //   'conditions' => array('Individual_message.opponent_id' => $id),
    //     'order' => 'modified desc',
    //     'limit' => 20
    //   );
    // $this->set('user', $this->User->findById($id));
    $this->set('who', $this->Message->read());
  }


  public function jsontest(){

  }

  public function wholists(){
    $params = array(
      'order' => 'sended_time desc',
      'limit' => 20
      );
    $this->set('message',$this->Message->find('all',$params));
  }


  public function add(){
    if($this->request->is('get')){
      throw new MethodNotAllowedException();
    }
    // if($this->request->is('ajax')){
      $this->Message->create();
      if($this->Message->save($this->request->data)){
        $this->Flash->success(__('The message has been sent.'));
        $this->redirect(array('action' => 'wholists'));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
      }
  }

  // public function edit($id = null){
  //   if(!$this->Message->exists()){
  //     throw new NotFoundException(__('Invalid user'));
  //   }
  //   if($this->request->is('post') || $this->request->is('put')){
  //     if($this->Message->save($this->request->data)){
  //       $this->Flash->success(__('The user has been saved.'));
  //       $this->redirect(array('action' => 'mypage'));
  //     }else{
  //       $this->Flash->error(__('The user could not be saved. Please try again.'));
  //     }
  //   }else{
  //     $this->request->data = $this->Message->findById($id);
  //     // unset($this->request->data['Message']['password']);
  //   }

  //   $this->set('program_language',$this->Message->find('list', array(
  //     'fields' => array('C', 'C+', 'Java')
  //   )));
  // }

  // public function delete($id){
  //   //$this->request->onlyAllow('ajax')  $this->Message->id = $id;
  //   if($this->request->is('get')){
  //     throw new Exception("Error Processing Request");
  //   }
  //   // if(!$this->Message->exists()){
  //   //   throw new NotFoundException(__('Invalid user'));
  //   // }
  //   if($this->request->is('ajax')){
  //     debug($this->request);
  //     if($id != $deletepass){
  //       // throw new Exception("Error Missing Password");
  //           $this->Flash->error(__('パスワードが違います！'));
  //           $this->redirect(array('action' => 'lists'));
  //           exit();
  //     }
  //     if($this->Message->delete($id)){
  //           $this->autoRendor = false;
  //           $this->autoLayout = false;
  //           $response = array('id' => $id,);
  //           $this->header('Content-Type: application/json');
  //           echo json_encode($response);
  //           exit();
  //     }else{
  //       $this->Session->setFlash('failed delete!', 'flash_custom');
  //     }
  //   }
  //   $this->Flash->error(__('Comment was not deleted.'));
  //   $this->redirect(array('action' => 'lists'));
  // }


  public function search($keyword){
    // $this->set('result',$this->)
  }


  public function isAuthorized($user){
    if($this->action === 'add'){
      return true;
    }

    if(in_array($this->action, array('edit', 'delete'))){
      $teacherId = (int)$this->request->param['pass'][0];
      if($this->Message->isOwnedBy($teacherId, $user['id'])){
        return true;
      }
    }
    return parent::isAuthorized($user);
  }
}
