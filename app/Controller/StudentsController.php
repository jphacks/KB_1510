<?php

class StudentsController extends AppController{

  public $uses = array('Teacher', 'Student');

  public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow('add','lists','lists_json','mypage','profile','login');
  }

  public function login($teacher = null){
    if($this->request->is('post')){
      if($this->Auth->login()){
        $logged_in = $this->Auth->user();
        $this->redirect($this->Auth->redirect());
      }else{
        $this->Flash->error(__('メールアドレスとパスワードのどちらかが間違っています。もう一度入力してください。'));
      }
    }
    if($teacher == 1){
      $this->set('loginname','講師');
    }else{
      $this->set('loginname','生徒');
    }
  }

    public function lists(){
    $params = array(
        'order' => 'modified desc',
        'limit' => 20
      );
    $this->set('student', $this->Student->find('all', $params));
    $this->set('teachersmatching',$teachermatchings);
  }


    public function lists_json(){
    $data = array(
      'status' => 'success',
      'order' => 'created desc'
    );
      $users = $this->Student->find('all',$data);
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
    $user = $this->Student->findById($id);
    $this->set(compact('teacher','user'));
  }


    public function profile($id = null){
    $this->set('student', $this->Student->findById($id));
  }



public function uploads($id = null){
     // if(!$this->Teacher->exists()){
    //   throw new NotFoundException(__('Invalid user'));
    // }
    $this->Teacher->id = $id;
    if($this->request->is('get')){
      $this->set('teacher',$this->Student->findById($id));
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
    $this->Student->recursive = 0;
    $this->set('users', $this->paginate());
  }*/

  public function view($id = null){
    if(!$this->Student->exists($id)){
      throw new NotFoundException(__('無効なユーザーです。'));
    }
    // $this->set('student', $this->Student->findById($id));
    $this->Student->id = $id;
    $this->set('student', $this->Student->read());
    //$this->set('teachermatchings',$this->Student->find('all',array('user' => 'User.id')));
  }

  public function add($teacher = null){
    if($this->request->is('post')){
      $this->Student->create();
      if($this->Student->save($this->request->data)){
      $new = $this->Student->find('all',array('fields' => array('max(id) as User.id')));
      $id = $new[0]['id_new'];
      $newuser = $this->Student->findById($id);
        if($newuser['Student']['isteacer'] == 1){
            $this->Flash->success(__('登録ありがとうございます。'));
            $this->redirect(array('action' => 'add_teacher'));
        }
        $this->Flash->success(__('ユーザー登録が完了しました。'));
        $this->redirect(array('action' => 'login'));
      }else{
        $this->Flash->error(__('登録に失敗しました。もう一度やり直して下さい。'));
      }
    }
    if($teacher == 1){
      $this->set('addname','講師');
    }else{
      $this->set('addname','生徒');
    }
  }


  public function add_teacher(){
    $this->_addAssociated();
    // if($this->request->is('post')){
    //   $this->Teacher->create();
    //   if($this->Teacher->save($this->request->data)){
    //     $this->Flash->success(__('The user has been saved.'));
    //     $this->redirect(array('controller' => 'teachers','action' => 'mypage'));
    //   }else{
    //     $this->Flash->error(__('The user could not be saved. Please try again.'));
    //   }
    // }
    //   $newteacher = $this->Teacher->find('all',array('fields' => array('max(id) as User.id_new')));
    //   $id = $newteacher[0]['id_new'];
    //   $this->set('newteacher',$this->Student->findById($id));
 }


 /**
 * _addAssociated method
 *
 * @return void
 */
    private function _addAssociated() {
        if ($this->request->is('post')) {
            $this->Student->create();
 
            $this->log($this->request->data, 'debug');
 
            $result = $this->Student->saveAssociated($this->request->data);
            $this->log($result, 'debug');
 
            if ($result) {
                $this->Session->setFlash(__('The user has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The user could not be saved. Please, try again.'));
            }
        }
    }
    


  public function edit($id = null){
    $this->Student->id = $id;
    if(!$this->Student->exists()){
      throw new NotFoundException(__('Invalid user'));
    }
    if($this->request->is('post') || $this->request->is('put')){
      if($this->Student->save($this->request->data)){
        $this->Flash->success(__('The user has been saved'));
        $this->redirect(array('controller' => 'users', 'action' => 'mypage'));
      }else{
        $this->Flash->error(__('The user could not saved. Please try again.'));
      }
    }else{
      $this->request->data = $this->Student->findById($id);
      unset($this->request->data['Student']['password']);
    }
  }

  public function delete($id = null){
    $this->request->onlyAllow('post');

    $this->Student->id = $id;
    if(!$this->Student->exists()){
      throw new NotFoundException(__('Invalid User'));
    }
    if($this->Student->delete()){
      $this->Flash->success(__('User deleted'));
      $this->redirect(array('action' => 'index'));
    }
    $this->Flash->error(__('User was not delete.'));
    $this->redirect(array('action' => 'index'));
  }
}
