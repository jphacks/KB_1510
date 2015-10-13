<table>
  <tr>
    <th>Id</th>
    <th>Username</th>
    <th>role</th>
  </tr>
<?php echo $this->Html->link(
  'Add User',
  array('controller' => 'users', 'action' => 'add')
); ?>
  <?php foreach ($users as $user): ?>
  <tr>
    <td><?php echo $user['User']['id']; ?></td>
    <td><?php echo $this->Html->link($user['User']['username'], array('controller' => 'users', 'action' => 'view', $user['User']['id'])); ?></td>
    <td>
      <?php echo $this->Form->postlink(
      'Delete',
      array('action' => 'delete', $user['User']['id']),
      array('confirm' => 'Are you sure?')); ?>
      <?php echo $this->Html->link('Edit', array('action' => 'edit', $user['User']['id'])); ?>
    </td>
    <td><?php echo $user['User']['role']; ?></td>
  </tr>
  <?php endforeach; ?>
  <?php unset($user); ?>
</table>
<?php echo env("SERVER_NAME"); ?>
