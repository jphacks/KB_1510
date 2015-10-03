<h1>Edit teacher</h1>
<?php
echo $this->Form->create('username');
echo $this->Form->input('id', array('type' => 'hidden'));
echo $this->Form->end('Save user');
