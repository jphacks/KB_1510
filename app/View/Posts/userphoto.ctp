<?php 
$imgname = '/files/post/photo/'.$user['Post']['photo_dir'].'/'. $user['Post']['photo'];
echo $this->Html->image($imgname, array('alt' => 'CakePHP','width'=>'300','height'=>'200')); ?>