<h1>写真</h1>

<ul>
<?php foreach ($images['Profile'] as $image): ?>
	<li><?php echo $image['photo']; ?></li>
	<li><?php echo $image['photo_dir']; ?></li>
	<?php echo $this->Html->image('/files/profile/photo/'.$image['Profile']['photo_dir'].'/'. $image['Profile']['photo'] ,array('alt' =>$image['Profile']['photo'] )); ?>
</ul>