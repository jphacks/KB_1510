<table>
  <tr>
    <th>Id</th>
    <th>Name</th>
    <th>Created</th>
  </tr>
<?php echo $this->Html->link(
  'Add Post',
  array('controller' => 'posts', 'action' => 'add')
); ?>
  <?php foreach ($posts as $post): ?>
  <tr>
    <td><?php echo $post['Post']['id']; ?></td>
    <td><?php echo $this->Html->link($post['Post']['title'], array('controller' => 'posts', 'action' => 'view', $post['Post']['id'])); ?></td>
    <td>
      <?php echo $this->Form->postlink(
      'Delete',
      array('action' => 'delete', $post['Post']['id']),
      array('confirm' => 'Are you sure?')); ?>
      <?php echo $this->Html->link('Edit', array('controller' => 'posts', 'action' => 'edit', $post['Post']['id'])); ?>
    </td>
    <td><?php echo $post['Post']['created']; ?></td>
  </tr>
  <?php endforeach; ?>
  <?php unset($post); ?>
</table>
