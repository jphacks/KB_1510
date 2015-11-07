<h2>講師登録</h2>
<div class="users form">
<?php echo $this->Form->create('Teacher'); ?>
  <fieldset>
    <?php echo $this->Form->input('username', array(
      'label' => 'ユーザーネーム',
    ));
    echo $this->Form->input('password', array(
      'label' => 'パスワード',
    ));
    echo $this->Form->input('email', array(
      'label' => 'メールアドレス',
    ));

     echo $this->Form->input('isStudent', array(
      'type' => 'hidden','value' => 0
    ));
    ?>
  </fieldset>
<?php echo $this->Form->end(__('登録する')); ?>
</div>
