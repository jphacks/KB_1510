<ul><?php //debug($teacher); ?>

<?php 
foreach($teacher as $list): ?>
	<li><?php echo h($list['Notice']['created']) ?> <br> <?php echo h($list['Notice']['title']); ?>
	  <?php echo $this->Html->link('詳細', array('controller' => 'notices', 'action' => 'view', $list['Notice']['id'])); ?>
	  </li>
<?php endforeach;?>
</ul>