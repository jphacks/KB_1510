<?php

class TeachersController extends AppController{

  public $uses = array('Teacher', 'User');

  public $name = 'Teachers';

  public $components = array(
      'Auth' => array(
          'loginAction' => array(
              'controller' => 'Teachers',
              'action' => 'login',
            ),
          'authenticate' => array(
            'Form' => array(
              'teacherModel' => 'Teacher',
              'fields' => array(
                  'email' => 'email',
                  'password' => 'password',
                ),
            )
        ),
      'loginRedirect' => array(
          'controller' => 'Teachers',
          'action' => 'mypage'
        ),
      'logoutRedirect' => array(
            'controller' => 'Teachers',
            'action' => 'index'
        ),
      )
    );

  public function beforeFilter(){
    parent::beforeFilter();

    $this->Auth->allow('login','lists','lists_json','uploads','mypicture','mypage','edit','profile','post','matching_lists','location_map');

  }

  public function login(){
    $this->redirect(array('controller'=>'users','action'=>'login',1));
    if($this->request->is('post')){
      if($this->Auth->login()){
        $session_id = $this->Auth->user();
        $this->redirect($this->Auth->redirect());
      }else{
        $this->Flash->error(__('メールアドレスかパスワードが間違っています。もう一度入力して下さい。'));
      }
    }
  }

  public function logout(){
    #$this->Session->destroy(); #セッションを消す。facebookについて。
    $this->redirect($this->Auth->logout());
  }

  public function index(){
    $teacher = $this->Teacher->find('all' ,array('limit' => 10));
    #$this->set('teacher', $this->Teacher->find('all', array('limit' => 10)));
    $user = $this->User->find('all' ,array('limit' => 10));
    $this->set(compact('user', 'teacher'));
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
        'order' => 'modified desc'
      );
    $this->set('teacher', $this->Teacher->find('all', $params));
  }

  public function view($id = null){
    if(!$this->Teacher->exists($id)){
      throw new NotFoundException(__('Invalid user'));
    }
    $this->set('teacher', $this->Teacher->findById($id));
  }



    public function mypage(){
    $session_id = $this->Auth->user('id');
    $session_isteacher = $this->Auth->user('isteacher');
    // $id = 10; //後で消します。
    if(!$session_id){
      throw new NotFoundException(__('ログインされていません'));
    }
    //$teacher = $this->Teacher->findById($id);
    $teacher = $this->Teacher->find('first', ['conditions' => ['Teacher.user_id' => $session_id]]);
    //$matchings = $this->User->find('all',['conditions' => ['Teachermatching.user_id' => $id]]);
    //$this->set(compact('teacher'));
    $params = array(
      'order' => 'modified desc',
      'limit' => 10,
      'conditions' => array(
          'isteacher' => 0 //isteacher=falseつまり、生徒ユーザーの情報を取ってくる。
        )
      );

    $user = $this->User->find('all',$params);
    // $this->set('teacher',$teacher);
    $this->set(compact('teacher','user'));
  }


  public function matching_lists(){
      $id = $this->Auth->user('id');
      $id = 10; //後で消す
      $teacher = $this->Teacher->find('first', ['conditions' => ['Teacher.id' => $id]]);
      $this->set('teacher', $teacher);
  }



  public function profile($id = null){
    $this->set('teacher', $this->Teacher->findById($id));
  }

 /**
   * 初期表示
   */
  public function uploads($id = null){
     // if(!$this->Teacher->exists()){
    //   throw new NotFoundException(__('Invalid user'));
    // }
    $this->Teacher->id = $id;
    if($this->request->is('get')){
      $this->set('teacher',$this->Teacher->findById($id));
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
  
  /**
   * 投稿処理
   */
  public function posts(){
    if($this->request->is('post')){
      // 登録処理を行う。
      // $id = $this->Teacher->save($this->request->data);
      $session_id = 10;

      $id = $session_id;
      $this->Teacher->save($this->request->data);
      // 登録後、参照画面にリダイレクトする。
      $this->redirect(array('action' => 'mypage'));
      return;
    }
    $this->render('posts');
  }
  
  /**
   * 投稿データ参照
   */
  public function mypicture($id = null){
    // 投稿idを取得する。
    // $id = $this->request->pass[0];
    // データを取得する。
    $options = array('conditions' => array('Teacher.id' => $id));
    $data = $this->Teacher->find('all', $options);
    // 取得したデータをveiwにセットする。
    $this->set('data', $data);
    $this->render('mypicture');
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


  public function location_map(){

  }


  public function add(){
    if($this->request->is('post')){
      $this->Teacher->create();
      if($this->Teacher->save($this->request->data)){
        $this->Flash->success(__('登録されました。'));
        $this->redirect(array('action' => 'login'));
      }else{
        $this->Flash->error(__('エラーが発生しました。もう一度よろしくお願いいたします。'));
      }
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
