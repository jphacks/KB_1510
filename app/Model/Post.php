<?php

class Post extends AppModel{
	public $belongsTo = array('User','Teacher');
	public $validate = array(
		'title' => array(
			'rule' => 'notBlank'
		),
		'body' => array(
			'rule' => 'notBlank'
		)
	);

	public $actsAs = array(
		'Upload.Upload' => array(
			'photo' => array(
				'fields' => array(
					'dir' => 'photo_dir'
				)
			)
		)
	);

	public function isOwnedBy($post, $user){
		return $this->field('id', array('id' => $post, 'user_id' => $user)) !== false;
	}
}
