<ul><?php //debug($teacher); ?>

<?php 
foreach($student as $list): ?>
	<li><?php echo h($list['Student']['username']) ?> by <?php echo h($list['Student']['job']); ?>
		<?php echo $this->Html->link('詳細', array('controller' => 'students', 'action' => 'view', $list['Student']['id'])); ?>
	</li>
<?php endforeach;?>
</ul>