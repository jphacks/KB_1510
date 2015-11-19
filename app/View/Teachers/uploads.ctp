<h3><?php echo $teacher['Teacher']['username'] ?></h3>
<table>
<tr>
<?php
$n = 1;
foreach ($teacher['Post'] as $photo): ?>
	<td>
	<?php
	echo $n;
	$imgname = '/files/post/photo/'.$photo['photo_dir'].'/'. $photo['photo'];
	$imgoption = array('alt' =>$photo['photo'],'width'=>'100','height'=>'130');  
	//echo $this->Html->link($this->Html->image($imgnam

    echo $this->Html->link($this->Html->image($imgname,$imgoption),array('#', 'class'=>'delete', 'data-post-id'=>$photo['id'],$photo['id']),array('escape'=>false));
    $n += 1;
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
