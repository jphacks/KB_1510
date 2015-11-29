<?php

class UserShell extends AppShell{
	public $uses = array('User');

	public function show(){
		$user = $this->User->findByUsername($this->args[0]);
		$this->out(print_r($user, true));
	}
}
