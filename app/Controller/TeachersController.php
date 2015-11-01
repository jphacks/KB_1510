<?php

class TeachersController extends AppController{

  public function beforeFilter(){
    parent::beforeFilter();


    $this->Auth->allow('add', 'logout','mypage','lists','edit','lists_json','upload');

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
    $this->set('teacher', $this->paginate());
  }

  public function mypage(){
    $id = $this->Auth->user('id');
    $id = 11;
    if(!$id){
      throw new NotFoundException(__('ログインされていません'));
    }
    $this->set('teacher', $this->Teacher->findById($id));
  }


  public function lists_json(){
    $data = array(
      'status' => 'success',
      'order' => 'created desc'
    );
      $teachers = $this->Teacher->find('all',$data);
      $this->viewClass = 'Json';
      $this->set(compact('teachers'));
      $this->set('_serialize', 'teachers');
  }



  public function lists(){
    $params = array(
        'order' => 'modified desc',
        'limit' => 20
      );
    $this->set('teacher', $this->Teacher->find('all', $params));
  }

  public function view($id = null){
    if(!$this->Teacher->exists($id)){
      throw new NotFoundException(__('Invalid user'));
    }
    $this->set('teacher', $this->Teacher->findById($id));
  }


  public function mypicture($id = null){
    $this->layout = "";
    return 0;
  }


  public function upload($id = null){
    if($this->request->data){
      $file = $this->request->data['file'];
      $original_filename = $file['name'];
      $uploaded_file = $file['tmp_name'];
      $filesize = $file['size'];
      $filetype = $file['type'];

      $dest_jullpath = APP.'tmp/'.md5(uniqid(rand(),true));

      move_uploaded_file($file['tmp_name'], $dest_jullpath);

      $root = 'http://localhost:8888/'
      $folder_path = $root.'prokate_cake/teachers/userphoto/'
      $photourl = $folder_path.'&'.$file['name'];
      $teacher = $this->Teacher->find(
          'first',
          array('conditions' => array('Teacher.id' => $id))
        );

      $teacher['Teacher']['photo_url'] = $photourl;
      $this->Teacher->save($teacher);
      $this->redirect(array('action' => 'mypage'));
    }
  }



   public function searched(){

    if(isset($this->request->data)){
      $id = $this->request->data['keyword'];
    }else{
      $keyword = "";
    }
     $teachers = $this->Teacher->find(
          'all',
          array('conditions' => array(
            $keyword =>' like Teacher.name',
            $keyword => 'like Teacher.gender'
            // 'Teacher.way like' => $keyword,
            // 'Teacher.program like' => $keyword,
            // 'Teacher.job like' => $keyword,
            // 'Teacher.position like' => $keyword,
            // 'Teacher.prefecture like' => $keyword
            )
        )
      );

     $this->set('teacher',$teachers);
     $this->redirect((array('action' => 'lists')));
     exit();
  }


  public function add(){
    if($this->request->is('post')){
      $this->Teacher->create();
      if($this->Teacher->save($this->request->data)){
        $this->Flash->success(__('The user has been saved.'));
        $this->redirect(array('action' => 'login'));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
      }
    }
  }

  public function edit($id = null){
    // if(!$this->Teacher->exists()){
    //   throw new NotFoundException(__('Invalid user'));
    // }
    if($this->request->is('post') || $this->request->is('put')){
      if($this->Teacher->save($this->request->data)){
        $this->Flash->success(__('The user has been saved.'));
        $this->redirect(array('action' => 'mypage'));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
      }
    }else{
      $this->request->data = $this->Teacher->findById($id);
      unset($this->request->data['Teacher']['password']);
    }

    $this->set('program_language',$this->Teacher->find('list', array(
      'fields' => array('C', 'C+', 'Java')
    )));
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

  public function isAuthorized($user){
    if($this->action === 'add'){
      return true;
    }

    if(in_array($this->action, array('edit', 'delete'))){
      $teacherId = (int)$this->request->param['pass'][0];
      if($this->Teacher->isOwnedBy($teacherId, $user['id'])){
        return true;
      }
    }
    return parent::isAuthorized($user);
  }
}
