
<?php

if(empty($photo)){
			$photo = '13.png';
			echo $photo;
			// exit();
}


	echo $this->Html->image($photo, array('alt' => 'CakePHP','width'=>'300','height'=>'200')); ?>

<h3>投稿ページ</h3>
<?php echo $this->Form->create('Teacher', array('type' => 'file', 'action' => 'uploads')); ?>

    <?php echo $this->Form->input('Teacher.photo', array('type' => 'file', 'label' => '投稿画像')); ?>
    <?php echo $this->Form->input('Teacher.photo_dir', array('type' => 'hidden')); ?>
<?php echo $this->Form->end('トップ画にする'); ?>
