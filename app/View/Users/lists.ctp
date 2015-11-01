<ul><?php //debug($teacher); ?>

<?php 
foreach($user as $list): ?>
	<li><?php echo h($list['User']['username']) ?> by <?php echo h($list['User']['job']); ?>
		<?php echo $this->Html->link('詳細', array('controller' => 'users', 'action' => 'view', $list['User']['id'])); ?>
	</li>
<?php endforeach;?>
</ul>