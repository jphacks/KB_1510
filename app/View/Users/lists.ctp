<ul><?php //debug($teacher); ?>

<?php 
foreach($user as $list): ?>
	<li><?php echo h($list['User']['username']) ?> by <?php echo h($list['User']['job']); ?></li>
<?php endforeach;?>
</ul>