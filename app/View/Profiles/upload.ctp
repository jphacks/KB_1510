<h3>投稿ページ</h3>
<?php echo $this->Form->create('Profile', array('type' => 'file', 'action' => 'post')); ?>
    <?php echo $this->Form->input('Profile.photo', array('type' => 'file', 'label' => 'プロフィール画像')); ?>
    <?php echo $this->Form->input('Profile.photo_dir', array('type' => 'hidden')); ?>

    <?php
    $session_status = 1;

	if($session_status = 1){
		$user_id = $session_id;
		echo $this->Form->input('Profile.user_id', array(
      'type' => 'hidden','value' => $user_id));
	}else{
		$teacher_id = $session_id;
		echo $this->Form->input('Profile.teacher_id', array(
      'type' => 'hidden','value' => $teacher_id));
	}
    ?>
<?php echo $this->Form->end('Submit'); ?>