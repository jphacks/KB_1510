<h1><?php echo h($user['User']['username']); ?></h1>
<p><?php echo h($user['User']['job']); ?></p>
<?php  
$session_id = 2;
if(!empty($session_id)){
echo $this->Form->create('Teachermatching',array('action'=>'add'));

echo $this->Form->input('Teachermatching.user_id',array('type'=>'hidden','value'=>$user['User']['id']));
echo $this->Form->input('Teachermatching.teacher_id',array('type'=>'hidden','value'=>$session_id));

echo $this->Form->end('生徒リクエスト');
}
?>

<?php foreach($user['User'] as $teacherof_user): ?>
	<li><?php echo $teacherof_user['Teachermatching']['name']; ?>
<?php endforeach; ?>

