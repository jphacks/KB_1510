<ul><?php //debug($teacher); ?>

<?php 
foreach($teacher as $list): ?>
	<li><?php echo h($list['Teacher']['username']) ?> by <?php echo h($list['Teacher']['job']); ?>
	  <?php echo $this->Html->link('詳細', array('controller' => 'teachers', 'action' => 'view', $list['Teacher']['id'])); ?>
	  <?php echo $this->Html->link('写真', array('controller' => 'teachers', 'action' => 'mypicture', $list['Teacher']['id'])); ?>
	  </li>
<?php endforeach;?>
</ul>

<?php
$num = 
?>