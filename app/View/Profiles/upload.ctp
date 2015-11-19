<h3>投稿ページ</h3>
<?php echo $this->Form->create('Profile', array('type' => 'file', 'action' => 'post')); ?>
    <?php echo $this->Form->input('photo', array('type' => 'file', 'label' => 'プロフィール画像')); ?>
    <?php echo $this->Form->input('photo_dir', array('type' => 'hidden')); ?>

    <?php
    $session_status = 1;
    $session_id = 10;

	if($session_status = 1){
		$user_id = $session_id;
		echo $this->Form->input('user_id', array(
      'type' => 'hidden','value' => $session_id));
	}else{
		$teacher_id = $session_id;
		echo $this->Form->input('teacher_id', array(
      'type' => 'hidden','value' => $session_id));
	}
    ?>
<?php echo $this->Form->end('Submit'); ?>