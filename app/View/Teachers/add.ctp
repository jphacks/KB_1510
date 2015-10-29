<h1>講師登録</h1>
<div class="users form">
<?php echo $this->Form->create('Teacher'); ?>
  <fieldset>
    <?php echo $this->Form->input('username');
    echo $this->Form->input('password');
    echo $this->Form->input('email');
    ?>
  </fieldset>
<?php echo $this->Form->end(__('submit')); ?>
</div>
