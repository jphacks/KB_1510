<h1>プロフィール編集</h1>
<?php
echo $this->Form->create('User');
echo $this->Form->input('role');
echo $this->Form->input('id', array('type' => 'hidden'));
echo $this->Form->input('gender', array(
  'label' => '性別',
  'options' => array('男','女'),
  'empty' => '選択してください'
));
echo $this->Form->input('prefecture');
echo $this->Form->input('job');

echo $this->Form->input('id',array('type'=>'hidden'));
echo $this->Form->end('変更を保存する');
