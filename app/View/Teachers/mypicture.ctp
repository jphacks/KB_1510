<h3>投稿データ</h3>
<h4>画像</h4><br>
<?php echo $data[0]['Teacher']['photo']?>
<?php echo $data[0]['Teacher']['photo_dir']?>
<?php echo $this->Html->image('/files/teacher/photo/'.$data[0]['Teacher']['photo_dir'].'/'. $data[0]['Teacher']['photo'] ,array('alt' =>$data[0]['Teacher']['photo'] )); ?>