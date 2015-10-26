<h1>マイページ</h1>
<h1><?php echo h($teacher['Teacher']['username']); ?></h1>
<p><?php echo $teacher['Teacher']['role']; ?></p>
<!-- <ul>
<?php foreach($teacher['Comment'] as $comment): ?>
	<li><?php echo h($comment['body']) ?> by <?php echo h($comment['commenter']); ?></li>
<?php endforeach; ?>
</ul> -->