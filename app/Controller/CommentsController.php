<?php

class CommentsController extends AppController{

//   public $components = array('RequestHandler');


//   $parser = function ($data) {
//     $rows = str_getcsv($data, "\n");
//     foreach ($rows as &$row) {
//         $row = str_getcsv($row, ',');
//     }
//     return $rows;
// };
//$this->RequestHandler->addInputType('json', array('json_decode', true));


 public function beforeFilter(){
    parent::beforeFilter();
     // if ($this->RequestHandler->accepts('html')) {
     //        // クライアントが HTML (text/html) のレスポンスを受付ける場合のみ実行されます
     //    } elseif ($this->RequestHandler->accepts('xml')) {
     //        // XMLのみ実行するコード
     //    }
     //    if ($this->RequestHandler->accepts(array('xml', 'rss', 'atom','json'))) {
     //        // XML か RSS か Atom の場合に実行される
     //    }
     //    if ($this->request->is('ajax')) {
     //      $this->disableCache();
     //    }
// コントローラのアクションの続き
    $this->Auth->allow();
 }


 public function jsonfunc(){
  $data = array(
  'status' => 'success',
  'items' => array(
      array('id' => 1, 'name' => 'apple', 'price' => 100),
      array('id' => 2, 'name' => 'banana', 'price' => 80),
    ),
  );
  $this->viewClass = 'Json';
  $this->set(compact('data'));
  $this->set('_serialize', 'data');
}


  public function lists(){
    $params = array(
        'order' => 'created desc',
        'limit' => 20
      );
    $this->set('comment', $this->Comment->find('all',$params));
    if($id){
      $this->set('id', $id);
    }
  }

  public function lists_json(){
  $data = array(
  'status' => 'success',
  'order' => 'created desc'
  );
  $comments = $this->Comment->find('all',$data);
  $this->viewClass = 'Json';
  $this->set(compact('comments'));
  $this->set('_serialize', 'comments');
  }


   function method(){
    $output->error = array(
      array('code' => '101', 'msg' => 'GET method is not supported')
    );
    $this->set('output', $output);
  }

  public function apridata_json(){

  }



  public function comment_inf(){
   $this->layout = "ajax";
  }


     public function afterFilter() {
   /* Viewのrenderより後に実行したい処理を書く */
    $this->set('comments',$this->Comment->find('all'));
   }

  public function add_to_teacher(){
    if($this->request->is('get')){
      throw new MethodNotAllowedException();
    }
    // if($this->request->is('ajax')){
      $this->Comment->create();
      if($this->Comment->save($this->request->data)){
        $this->Flash->success(__('The comment has been saved.'));
        $this->redirect(array('controller'=>'teachers','action' => 'profile',$this->data['Comment']['teacher_id']));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
      }
  }

    public function add_to_teacherview(){
    if($this->request->is('get')){
      throw new MethodNotAllowedException();
    }
    // if($this->request->is('ajax')){
      $this->Comment->create();
      if($this->Comment->save($this->request->data)){
        $this->Flash->success(__('コメント投稿完了'));
        $this->redirect(array('controller'=>'teachers','action' => 'view',$this->data['Comment']['teacher_id']));
      }else{
        $this->Flash->error(__('コメント投稿失敗。もう一度やり直して下さい。'));
      }
  }


  public function add_to_user(){
    if($this->request->is('get')){
      throw new MethodNotAllowedException();
    }
    // if($this->request->is('ajax')){
      $this->Comment->create();
      if($this->Comment->save($this->request->data)){
        $this->Flash->success(__('The comment has been saved.'));
        $this->redirect(array('controller'=>'users','action' => 'profile',$this->data['Comment']['user_id']));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
      }
  }


   public function add_to_userview(){
    if($this->request->is('get')){
      throw new MethodNotAllowedException();
    }
    // if($this->request->is('ajax')){
      $this->Comment->create();
      if($this->Comment->save($this->request->data)){
        $this->Flash->success(__('The comment has been saved.'));
        $this->redirect(array('controller'=>'users','action' => 'view',$this->data['Comment']['user_id']));
      }else{
        $this->Flash->error(__('The user could not be saved. Please try again.'));
      }
  }


  // public function delete_from_view($id = null){
  //   $this->request->onlyAllow('post');
  //   $this->Teacher->id = $id;
  //  if($this->request->is('get')){
  //     throw new MethodNotAllowedException();
  //   }
  //   if($this->request->is('ajax')){
  //       if($this->Comment->delete($id)){
  //           $this->autoRender = false;
  //           $this->autoLayout = false;
  //           $response = array('id' => $id);
  //           $this->header('Content-Type: application/json');
  //           echo json_encode($response);
  //           exit();
  //       }
  //     //↓Ajaxじゃない場合（例外処理）に戻る
  //     $session_isteacher = $this->Auth->user('isteacher');
  //     if($session_state == 1){ //⇢講師としてログインしてる場合
  //       $session_id = $this->Auth->user('teacher_id');
  //       $this->redirect(array('controller'=>'teachers', 'action' => 'profile'));
  //     }else{
  //       $session_id = $this->Auth->user('id');
  //       $this->redirect(array('controller'=>'users', 'action' => 'profile'));
  //     }
  //   }
  // }


  public function delete($id){
    if($this->request->is('get')){
      throw new MethodNotAllowedException();
    }
    if($this->request->is('ajax')){
        if($this->Comment->delete($id)){
            $this->autoRender = false;
            $this->autoLayout = false;
            $response = array('id' => $id);
            $this->header('Content-Type: application/json');
            echo json_encode($response);
            exit();
        }
      $session_isteacher = 0;
      if($session_isteacher == 0){ //⇢講師としてログインしてる場合
        $this->redirect(array('controller'=>'users', 'action' => 'mypage'));
      }else{
        $this->redirect(array('controller'=>'teachers', 'action' => 'mypage'));
      }
    }
  }

  // public function addfrom_user(){

  //     // ajax 通信だった場合に以下のブロックを処理する。

  //     if ($this->request->is('ajax')) {

  //         $this->autoRender = false;   // 自動描画をさせない

  //         // json response data ('succeed' と 'message'をJSON形式で返します)

  //         $succeed = $this->Comment->save($this->request->data);
  //         $message = $succeed ? '追加しました' : '追加に失敗しました';

  //         // Model::$validationErrors があれば、その先頭の一つをメッセージにセット

  //         if (!$succeed && $this->Comment->validationErrors) {
  //             $validationError = array_shift($this->Comment->validationErrors);
  //             $message = $validationError[0];
  //         }
  //         $data = compact('succeed', 'message');
  //         $this->response->type('json');
  //         echo json_encode($data);
  //         exit;
  //     }
  //     /* 通常の処理は省略 */
  // }



  // ajax 用のメソッド

  // 2013/06/30 2箇所修正しました。

  // 1. exit 文を削除（不要。単体テストが困難になる）

  // 2. $this->response('json') を追加。レスポンスヘッダを正しく送出する。

  // 2013/07/02

  // 3. Configure::write('debug', 0); を追加

  public function get_last_update(){

      // ajax 専用のメソッドならこれもあり。ajax 以外はindexアクションへリダイレクトします。

      if (!$this->request->is('ajax')){
          $this->redirect(array('action'=>'lists'));
      }


      Configure::write('debug', 0); // 余分な情報の出力を抑制

      $this->autoRender = false;

      // $_POST['num'] で取得件数をリクエストされる。念のためデフォルトで5件。

      $data = array_merge(

          array(
              'num' => 5,
          ),
          $this->request->data
      );



      // find するパラメータ。極力シンプルなものにしています。

      $contain = array();

      $fields = array('id', 'my_field');

      $order = 'Comment.created DESC';

      $limit = $data['num'];

      // json response data

      $lastUpdate = $this->Comment->find('all', compact('conditions', 'fields', 'contain', 'order', 'limit'));

      $succeed = $lastUpdate ? true : false;

      $this->response->type('json');

      echo json_encode(compact('succeed', 'lastUpdate'));

    }



  public function edit($id = null){
    if(!$this->Comment->exists()){
      throw new NotFoundException(__('Invalid user'));
    }
    if($this->request->is('post') || $this->request->is('put')){
      if($this->Comment->save($this->request->data)){
        $this->Flash->success(__('The comments has been saved.'));
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

  public function delete_from_view($id,$state,$teacher_id,$user_id){
    //$this->request->onlyAllow('ajax')  $this->Comment->id = $id;

    if($this->request->is('ajax')){
      if($this->Comment->delete($id)){
            $this->autoRendor = false;
            $this->autoLayout = false;
            $response = array('id' => $id,);
            $this->header('Content-Type: application/json');
            echo json_encode($response);
            exit();
      }else{
        $this->Session->setFlash('failed delete!', 'flash_custom');
      }
    }
    $this->Flash->error(__('Comment was not deleted.'));
    if($state == 0){
      $this->redirect(array('controller' => 'teachers', 'action' => 'view',$teacher_id));
    }
    $this->redirect(array('controller' => 'users', 'action' => 'view',$user_id));
  }


  public function search($keyword){
    // $this->set('result',$this->)
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
