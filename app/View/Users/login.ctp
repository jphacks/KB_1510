<h2>ログイン</h2>
<div class="Users form">
  <?php echo $this->Flash->render('auth'); ?>
  <?php
  echo $this->Form->create('User');
  echo $this->Form->inputs(array(
    'legend' => __('メールアドレスを入力してください。'),
    'email'
  ));
  echo $this->Form->end(__('ログインする'));
  ?>
</div>
<div class="to_Resister">
<?php 
  echo $this->HTML->link('登録はこちら',array('controller'=>'users','action'=>'add'));
?>
<br>
<br>
<?php 
  echo $this->HTML->link('メールアドレス.パスワードを忘れた方',array('controller'=>'contact','action'=>'resetpass'));
?>