<h3>写真アップロード</h3>
<?php echo $this->Form->create('Post', array('type' => 'file', 'action' => 'post')); ?>
    <?php //echo $this->Form->input('Post.title', array('label' => 'タイトル')); ?>
    <?php //echo $this->Form->input('Post.body', array('label' => '本文')); ?>
    <?php echo $this->Form->input('Post.photo', array('type' => 'file', 'label' => '投稿画像')); ?>
    <?php echo $this->Form->input('Post.photo_dir', array('type' => 'hidden')); ?>

    <?php 
    $session_id = 10;
    $session_isteacher = 1;
    if($session_isteacher == 1){
    	echo $this->Form->input('Post.teacher_id',array('type' => 'hidden','value' => $session_id));
    }else if($session_isteacher == 1){
    	echo $this->Form->input('Post.user_id',array('type' => 'hidden','value' => $session_id));
    }else{
    	echo"不正な値の可能性があります。";
    	exit();
    }
     ?>
    
<?php echo $this->Form->end('Submit'); ?>