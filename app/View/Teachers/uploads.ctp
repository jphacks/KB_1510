
<?php

if(empty($photo)){
			$photo = '13.png';
			echo $photo;
			// exit();
}


	echo $this->Html->image($photo, array('alt' => 'CakePHP','width'=>'300','height'=>'200')); ?>

<h3>選択ページ</h3>
<?php echo $this->Form->create('Teacher', array('action' => 'uploads')); ?>
<?php
	echo $this->Form->input('photo_number', array(
  'label' => '番号',
  'options' => array('1','2','3'),
  'empty' => '選択してください'
));
?>
    
<?php echo $this->Form->end('トップ画にする'); ?>
