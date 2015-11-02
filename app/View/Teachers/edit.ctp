<h2>プロフィール編集</h2>
<?php
echo $this->Form->create('Teacher');
echo $this->Form->input('username', array(
  'label' => 'username'
));
echo $this->Form->input('gender', array(
  'label' => '性別',
  'options' => array('男', '女'),
  'empty' => '選択してください'
));
echo $this->Form->input('old', array(
  'label' => '年齢'
));
echo $this->Form->input('job', array(
  'label' => '職業'
));
echo $this->Form->input('desire_time', array(
  'label' => '希望時間帯'
));
echo $this->Form->input('way', array(
  'label' => '教わりたい方法',
  'options' => array(
    '直接', 'skype等', 'チャット上で'
  ),
  'empty' => '教わりたい方法を選択してください'
));
echo $this->Form->input('programing_skill', array(
  'label' => 'プログラミング習熟度',
  'options' => array(
    '未経験', '初級', '中級', '上級'
  ),
  'empty' => '自分のレベルだと思うものを選択して下さい'
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
  'options' => array(
    'C', 'Java', 'Javascript'
  ),
));
echo $this->Form->input('introduction', array(
  'label' => '自己紹介',
  'options' => array(
    'rows' => 5
  )
));
echo $this->Form->input('id', array('type' => 'hidden'));
echo $this->Form->end('変更を保存する');
