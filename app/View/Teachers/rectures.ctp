<h2><?php echo $teacher['Teacher']['username']; ?></h2>
<ul><?php //debug($teacher); ?>

<?php 
if($teacher['Recture'] == null){
	echo"まだ講義はありません。";
}else{


 foreach($teacher['Recture'] as $list): ?>
	<li>
	<?php 
	echo h($list['name']);

	echo $this->Html->link($list['title'], array('controller' => 'rectures', 'action' => 'view', $list['id'])); ?>
	
	  </li>
<?php endforeach;}?>
</ul>