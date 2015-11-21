<h2>講師登録</h2>
<div class="users form">
<?php echo $this->Form->create('User'); ?>
  <fieldset>
    <legend><?php echo __('Add User'); ?></legend>
    // <?php //echo $this->Form->input('User.username', array(
    //   'label' => "ユーザーネーム",
    // ));
    echo $this->Form->input('User.password', array(
      "label" => "パスワード",
    ));
    echo $this->Form->input('User.email', array(
      'label' => "メールアドレス",
    ));

     echo $this->Form->input('Teacher.language', array('label' => 'プログラミング経験。','value' => '例.php3年（IT起業で、cakePHPを用いたWebメディアを作っていました。）','rows' => 4,'cols'=>44));

    echo $this->Form->input('isteacher', array(
      'type' => 'hidden','value' => 1
    ));
    ?>
  </fieldset>
<?php echo $this->Form->end(__('登録する')); ?>
</div>
