<h3>投稿データ</h3>
<h4>タイトル</h4><br>
<?php echo $data[0]['Notice']['title']?><br><br><br>
<h4>本文</h4><br>
<?php echo $data[0]['Notice']['body']?><br><br><br>
<h4>画像</h4><br>
<?php echo $data[0]['Notice']['photo']?>
<?php echo $data[0]['Notice']['photo_dir']?>
<?php echo $this->Html->image('/files/notice/photo/'.$data[0]['Notice']['photo_dir'].'/'. $data[0]['Notice']['photo'] ,array('alt' =>$data[0]['Notice']['photo'] )); ?>