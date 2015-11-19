<?php

class PostsController extends AppController{
	public $helpers  = array('Html', 'Form', 'Flash');
	public $components = array('Flash');

  public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow();
  }

public $scaffold;
	

	public function lists(){

		$data = $this->Post->find('all');
		$this->set('datas',$data);
		$this->render('lists');
	}

 public function userphoto($id = null){
    $this->layout = "";
    $this->set('user',$this->Post->findById($id));
  }
	/**
	 * 初期表示
	 */
	public function index(){

		$this->render('index');
	}
	
	/**
	 * 投稿処理
	 */
	public function post(){
		
		if($this->request->is('post')){
			// 登録処理を行う。
			$id = $this->Post->save($this->request->data);

			
			// 登録後、マイページにリダイレクトする。
			//$this->redirect('/Posts/view/'.$this->Post->id);
			// if(!empty($this->Post->teacher_id)){
				$this->redirect(array('controller'=>'teachers','action'=>'mypage'));
			//}else{
				//$this->redirect(array('controller'=>'users','action'=>'uploads',$this->Post->user_id));
			//}
			
			return;
		}
		
		$this->render('index');
	}


	public function delete_from_teacher($id = null){
    $this->request->onlyAllow('post');

    $this->Teacher->id = $id;
    if($this->Comment->delete()){
      $this->Flash->success(__('User deleted.'));
      $this->redirect(array('action' => 'index'));
    }
    $this->Flash->error(__('User was not deleted.'));
    $this->redirect(array('action' => 'index'));
  }

	
	/**
	 * 投稿データ参照
	 */
	public function view(){
		// 投稿idを取得する。
		$id = $this->request->pass[0];
		
		// データを取得する。
		$options = array('conditions' => array('Post.id' => $id));
		$data = $this->Post->find('all', $options);
		
		// 取得したデータをveiwにセットする。
		$this->set('data', $data);

		$this->render('view');
	}

	// public function view($id = null){
	// 	if(!$id){
	// 		throw new NotFoundException(__('Invalid post'));
	// 	}

	// 	$post = $this->Post->findById($id);
	// 	if(!$post){
	// 		throw new NotFoundException(__('Invalid post'));
	// 	}
	// 	$this->set('post', $post);
	// }

	public function add(){
		if($this->request->is('post')){
			$this->request->data['Post']['user_id'] = $this->Auth->user('id');
			$this->Post->create();
			if($this->Post->save($this->request->data)){
				$this->Flash->success(__('Your post has been saved.'));
				return $this->redirect(array('action' => 'index'));
			}
			$this->Flash->error(__('Unable to add your post.'));
		}
	}

	public function edit($id = null){
		if(!$id){
			throw new NotFoundException(__('Invalid post'));
		}

		$post = $this->Post->findById($id);
		if(!$post){
			throw new NotFoundException(__('Invalid post'));
		}

		if($this->request->is(array('post', 'put'))){
			$this->Post->id = $id;
			if($this->Post->save($this->request->data)){
				$this->Flash->success(__('Your post has been updated.'));
				return $this->redirect(array('action' => 'index'));
			}
			$this->Flash->error(__('Unable to update your post.'));
		}

		if(!$this->request->data){
				$this->request->data = $post;
		}
	}

	public function delete($id){
		if($this->request->is('get')){
			throw new MethodNotAllowedException();
		}

		if($this->Post->delete($id)){
			$this->Flash->success(
				__('The post with id: %s has been deleted.', h($id)));
		}else{
			$this->Flash->error(
				__('The post with id: %s could not be deleted.', h($id)));
		}
		return $this->redirect(array('action' => 'index'));
	}

	public function isAuthorized($user){
		// 投稿済みuserは投稿可能trueな設定へ
		if($this->action === 'add'){
			return true;
		}

		if(in_array($this->action, array('edit', 'delete'))){
			$postId = (int) $this->request->param['pass'][0];
			if($this->Post->isOwnedBy($postId, $user['id'])){
				return true;
			}
		}
		return parent::isAuthorized($user);
	}
}
