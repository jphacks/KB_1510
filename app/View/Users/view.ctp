<h1><?php echo h($user['User']['username']); ?></h1>
<p><?php echo h($user['User']['job']); ?></p>
<?php foreach($user['User'] as $teacherof_user): ?>
	<li><?php echo $teacherof_user['Teacher_matching']['name']; ?>
<?php endforeach; ?>