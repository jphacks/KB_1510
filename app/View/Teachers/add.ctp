<h1>App Teacher</h1>
<div class="users form">
<?php echo $this->Form->create('Teacher'); ?>
  <fieldset>
    <legend><?php echo __('Add User'); ?></legend>
    <?php echo $this->Form->input('username');
    echo $this->Form->input('password');
    ?>
  </fieldset>
<?php echo $this->Form->end(__('submit')); ?>
</div>
