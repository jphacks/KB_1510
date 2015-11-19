<div class="Users form">
  <?php echo $this->Flash->render('auth'); ?>
  <?php echo $this->Form->create('Teacher'); ?>
    <fieldset>
      <legend><?php echo __('メールアドレスとパスワードを入力してください。'); ?></legend>
      <?php
      echo $this->Form->input('email', array(
        'label' => 'メールアドレス',
      ));
      echo $this->Form->input('password', array(
        'label' => 'パスワード',
      ));
      ?>
    </fieldset>
  <?php echo $this->Form->end(__('ログインする')); ?>
</div>

<div class="to_Resister"><?php echo $this->HTML->link('講師登録はこちら',array('controller'=>'users','action'=>'add',1)); ?>
