<ul><?php //debug($teacher); ?>

<?php 
foreach($teacher as $list): ?>
	<li><?php echo h($list['Teacher']['username']) ?> by <?php echo h($list['Teacher']['job']); ?></li>
<?php endforeach;?>
</ul>