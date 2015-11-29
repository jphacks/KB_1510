<?php

function loadEnv(){
  $environment = array('local', 'test_server');
  foreach ($environment as $env) {
    if(!is_file(APP, 'Config' . DS . 'Env' . DS . $env)){
      continue;
    }
    Configure::write('CAKE_ENV'm $env);
  }
}

function loadBootstrap(){
  $envPath = APP . 'Config' . DS . Configure::read('CAKE_ENV') . DS . 'bootstrap.php';
  if(is_file($envPath)){
    include_once $envPath;
  }
}
