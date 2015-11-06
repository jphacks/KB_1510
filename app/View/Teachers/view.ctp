<h1><?php echo h($teacher['Teacher']['username']); ?></h1>
<p><?php echo h($teacher['Teacher']['job']); ?></p>
<?php
$session_id = 5;
if(!empty($session_id)){
	echo $this->Form->create('Teachermatching',array('action'=>'add'));

echo $this->Form->input('Teachermatching.teacher_id',array('type'=>'hidden','value'=>$teacher['Teacher']['id']));
echo $this->Form->input('Teachermatching.user_id',array('type'=>'hidden','value'=>$session_id));

echo $this->Form->end('講師リクエスト');
}
?>
      <?php //foreach ($teacher['Teachermatching'] as $student): ?>
          <li><?php //echo h($student['name']) ?></li>
          <li><?php //echo h($student['job']) ?> </li>
          
        <?php //endforeach ?>
