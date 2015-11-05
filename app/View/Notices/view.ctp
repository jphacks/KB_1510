<h3>投稿データ</h3>
<h4>タイトル</h4><br>
<?php echo $data[0]['Notice']['title']?><br><br><br>
<h4>本文</h4><br>
<?php echo $data[0]['Notice']['body']?><br><br><br>
<h4></h4><br>
<?php if($data[0]['Notice']['photo'] != null){
	echo $data[0]['Notice']['photo'];}?>
<?php if($data[0]['Notice']['photo_dir']  != null){
	echo $data[0]['Notice']['photo_dir'];}?>
<?php if($data[0]['Notice']['photo'] != null){
	echo $this->Html->image('/files/notice/photo/'.$data[0]['Notice']['photo_dir'].'/'. $data[0]['Notice']['photo'] ,array('alt' =>$data[0]['Notice']['photo'] )); } ?>