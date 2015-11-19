<h3>投稿データ</h3>
<h4>タイトル</h4><br>
<?php echo $data[0]['Post']['title']?><br><br><br>
<h4>本文</h4><br>
<?php echo $data[0]['Post']['body']?><br><br><br>
<h4>画像</h4><br>
<?php echo $data[0]['Post']['photo']?>
<?php echo $data[0]['Post']['photo_dir']?>
<?php //echo $this->Html->image('/files/post/photo/'.$data[0]['Post']['photo_dir'].'/'. $data[0]['Post']['photo'] ,array('alt' =>$data[0]['Post']['photo'] )); 
$imgname = '/files/post/photo/'.$data[0]['Post']['photo_dir'].'/'. $data[0]['Post']['photo'];
echo $this->Html->link($this->Html->image($imgname),array('controller'=>'posts','action'=>'userphoto',$data[0]['Post']['id']),array('escape'=>false));

?>