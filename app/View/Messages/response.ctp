<?php echo $this->Form->create('Comment', array('action' => 'response')); ?>
<div class="row">
<?php
echo $this->Form->input('password',array('label' => '削除パス'));?>
<div class="col-sm-12">コンタクトを取るコメントを入力しよう！(300字以内) </div> 
<?php 
echo $this->Form->input('body', array('rows' => '3','label' => 'コメント内容'));
echo $this->Form->end('コメント');
?>