<h1>一覧</h1>
<?php foreach ($datas as $data): ?> 
	<h4>画像</h4>
<?php echo $data['Post']['photo']?>
<?php echo $data['Post']['photo_dir']?>
<?php //echo $this->Html->image('/files/post/photo/'.$data['Post']['photo_dir'].'/'. $data['Post']['photo']); ?>
<?php 
$imgname = '/files/post/photo/'.$data['Post']['photo_dir'].'/'. $data['Post']['photo'];
echo $this->Html->link($this->Html->image($imgname),array('controller'=>'posts','action'=>'userphoto',$data['Post']['id']),array('escape'=>false));?>
<?php endforeach; ?>

