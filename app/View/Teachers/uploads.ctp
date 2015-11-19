<h3><?php echo $teacher['Teacher']['username'] ?></h3>
<?php

if(empty($photo)){
			$photo = '13.png';
			echo $photo;
			// exit();
}
?>

<table>
<tr>
<?php
foreach ($teacher['Post'] as $photo): ?>
	<td>
	<?php
	$imgname = '/files/post/photo/'.$photo['photo_dir'].'/'. $photo['photo'];

    echo $this->Html->link($this->Html->image($imgname),array('#', 'class'=>'delete', 'data-post-id'=>$photo['id'],$photo['id']),array('escape'=>false));
	// echo $this->Html->image('/files/post/photo/'.$teacher['photo_dir'].'/'. $teacher['photo'] ,array('alt' =>$teacher['photo'],'width'=>'200','height'=>'100'));  
	//echo $this->Html->link($this->Html->image($imgname),array('controller'=>'posts','action'=>'userphoto',$data['Post']['id']),array('escape'=>false));
	?></td>
<?php endforeach; ?>
</tr>
</table>

<br>
<?php  
echo $this->HTML->link('写真のアップロード',array('controller'=>'posts','action'=>'index'));
?>
<h3>トップ画像を選択して下さい</h3>
<?php echo $this->Form->create('Teacher', array('action' => 'uploads')); ?>
<?php
	echo $this->Form->input('photo_number', array(
  'label' => '番号',
  'options' => array('1','2','3'),
  'empty' => '選択してください'
));
?>
    
<?php echo $this->Form->end('トップ画にする'); ?>
