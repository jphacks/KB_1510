<div class="Users form">
  <?php echo $this->Flash->render('auth'); ?>
  <?php
  echo $this->Form->create('User');
  echo $this->Form->inputs(array(
    'legend' => __('Please enter your username and password'),
    'username',
    'password',
  ));
  echo $this->Form->end(__('Login'));
  ?>
</div>
