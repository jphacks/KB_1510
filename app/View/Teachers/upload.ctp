<?php
echo($this->Form->create(
	null,
	array('url' => '/teachers/upload', 'type' => 'file')

	));

echo($this->Form->input(
	'file',
	array(
		'type' => 'file', 'label' => 'ファイル')
	));

echo($this->Form->submit('アップロード'));
echo($this->Form->end());