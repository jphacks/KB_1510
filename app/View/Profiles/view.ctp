<h3>投稿データ</h3>
<h4>画像</h4><br>
<?php echo $data[0]['Profile']['photo']?>
<?php echo $data[0]['Profile']['photo_dir']?>
<?php echo $this->Html->image('/files/profile/photo/'.$data[0]['Profile']['photo_dir'].'/'. $data[0]['Profile']['photo'] ,array('alt' =>$data[0]['Profile']['photo'] )); ?>