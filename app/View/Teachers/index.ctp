<table>
  <tr>
    <th>Id</th>
    <th>Username</th>
  </tr>
<?php echo $this->Html->link(
  'Add Teacher',
  array('controller' => 'teachers', 'action' => 'add')
); ?>
  <?php foreach ($teachers as $teacher): ?>
  <tr>
    <td><?php echo $teacher['Teacher']['id']; ?></td>
    <td><?php echo $this->Html->link($teacher['Teacher']['username'], array('controller' => 'teachers', 'action' => 'view', $teacher['Teacher']['id'])); ?></td>
    <td>
      <?php echo $this->Form->postlink(
      'Delete',
      array('action' => 'delete', $teacher['Teacher']['id']),
      array('confirm' => 'Are you sure?')); ?>
      <?php echo $this->Html->link('Edit', array('action' => 'edit', $teacher['Teacher']['id'])); ?>
    </td>
  </tr>
  <?php endforeach; ?>
  <?php unset($teacher); ?>
</table>
