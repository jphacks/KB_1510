<h2>ログイン</h2>
<div class="Users form">
  <?php echo $this->Flash->render('auth'); ?>
  <?php
  echo $this->Form->create('User');
  echo $this->Form->inputs(array(
    'legend' => __('メールアドレスとパスワードを入力してください、'),
    'email',
    'password',
  ));
  echo $this->Form->end(__('ログインする'));
  ?>
</div>
<div class="to_Resister">
<?php
  echo $this->HTML->link('講師登録はこちら',array('controller'=>'users','action'=>'add_user_teacher')); ?>
<br>
<?php 
  echo $this->HTML->link('生徒登録はこちら',array('controller'=>'users','action'=>'add'));
?>