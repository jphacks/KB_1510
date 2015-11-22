
<?php

$photo = $teacher['Teacher']['photo'];
if(empty($photo)){
			$photo = '13.png';
			echo $photo;
			// exit();
}


		var_dump($teacher);
		var_dump($teacher['Teacher']['photo']);
		echo $photo;
	echo $this->Html->image($photo, array('alt' => 'CakePHP','width'=>'300','height'=>'200')); ?>

<h3>投稿ページ</h3>
<?php echo $this->Form->create('Teacher', array('type' => 'file', 'action' => 'uploads')); ?>
<?php
	echo $this->Form->input('gender', array(
  'label' => '番号',
  'options' => array('1','2','3'),
  'empty' => '選択してください'
));
?>
    <?php echo $this->Form->input('Teacher.photo', array('type' => 'file', 'label' => '投稿画像')); ?>
    <?php echo $this->Form->input('Teacher.photo_dir', array('type' => 'hidden')); ?>
<?php echo $this->Form->end('アップロード'); ?>
