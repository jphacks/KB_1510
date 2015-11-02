<h1>Edit teacher</h1>
<?php
echo $this->Form->create('Teacher');
echo $this->Form->input('gender', array(
  'label' => '性別',
  'options' => array('男', '女'),
  'empty' => '選択してください'
));
echo $this->Form->input('prefecture', array(
  'label' => '都道府県',
  'options' => Configure::read('Pref'),
  'type' => 'select',
  'empty' => '選択してください。'
));
echo $this->Form->input('job');
echo $this->Form->input('language', array(
  'type' => 'select',
  'multiple' => 'checkbox',
  'options' => $program_language,
));
echo $this->Form->input('id', array('type' => 'hidden'));
echo $this->Form->end('変更を保存する');
