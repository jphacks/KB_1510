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
