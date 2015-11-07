<?php

class ProfilesController extends AppController{
	public $helpers  = array('Html', 'Form', 'Flash');
	public $components = array('Flash');
	public $uses = array('Teacher', 'User');

  public function beforeFilter(){
    parent::beforeFilter();
    $this->Auth->allow();
  }

public $scaffold;
	
	/**
	 * 初期表示
	 */
	public function upload($id = null){
		$session_state = 1;
		$param = $this->Teacher->find('all');
    #$this->set('teacher', $this->Teacher->find('all', array('limit' => 10)));
		if($session_state = 1){
			$param = $this->Teacher->findById($id);
		}else{
			$param = $this->User->findById($id);
		}
  //   	$user = $this->User->find('all');
		// $this->set(compact('user', 'teacher'));
		$this->set('thisuser',$params);
		$this->render('upload');
	}
	
	/**
	 * 投稿処理
	 */
	public function post(){
		
		if($this->request->is('post')){
			// 登録処理を行う。
			// $id = $this->Profile->save($this->request->data);
			$session_id = 3;
			$sessein_status = 1;
			
			$id = $this->Profile->save($this->request->data);
			// 登録後、参照画面にリダイレクトする。
			$option = $this->Profile->findById($id);
			$this->redirect('/Profiles/view/'.$this->Profile->id);
			return;
		}
		
		$this->render('upload');
	}
	
	/**
	 * 投稿データ参照
	 */
	public function view(){
		// 投稿idを取得する。
		$id = $this->request->pass[0];

		// データを取得する。
		$options = array('conditions' => array('Profile.id' => $id));
		$data = $this->Profile->find('first', $options);
		
		// 取得したデータをveiwにセットする。
		$this->set('data', $data);

		$this->render('view');
	}


	public function add(){
		if($this->request->is('post')){
			$this->request->data['Post']['user_id'] = $this->Auth->user('id');
			$this->Profile->create();
			if($this->Profile->save($this->request->data)){
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

		$post = $this->Profile->findById($id);
		if(!$post){
			throw new NotFoundException(__('Invalid post'));
		}

		if($this->request->is(array('post', 'put'))){
			$this->Profile->id = $id;
			if($this->Profile->save($this->request->data)){
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

		if($this->Profile->delete($id)){
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
			if($this->Profile->isOwnedBy($postId, $user['id'])){
				return true;
			}
		}
		return parent::isAuthorized($user);
	}
}
