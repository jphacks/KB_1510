<ul><?php //debug($teacher); ?>

<?php 
foreach($recture as $list): ?>
	<li>
	<?php echo h($list['Recture']['name']) ?> 

	  <?php echo $this->Html->link($list['Recture']['title'], array('controller' => 'rectures', 'action' => 'view', $list['Recture']['id'])); ?>
	
	  </li>
<?php endforeach;?>
</ul>

