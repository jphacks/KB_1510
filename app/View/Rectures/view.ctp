<p><?php echo $this->Html->link($recture['Recture']['name'],array('controller'=>'teachers','action' => 'view', $recture['Recture']['teacher_id'])); ?></p>
<p><?php echo h($recture['Recture']['title']); ?></p>
<?php
// $session_id = 5;
// if(!empty($session_id)){
// 	echo $this->Form->create('Teachermatching',array('action'=>'add_student'));

// echo $this->Form->input('Teachermatching.teacher_id',array('type'=>'hidden','value'=>$recture['Recture']['id']));
// echo $this->Form->input('Teachermatching.name',array('type'=>'hidden','value'=>$recture['Recture']['username']));
// echo $this->Form->input('Teachermatching.user_id',array('type'=>'hidden','value'=>$session_id));

// echo $this->Form->end('受講リクエスト');
// }
?>
  
<div id="body">
<?php echo h($recture['Recture']['body']); ?>
</div>

<script>
$(function(){
	$('a.delete').click(function(e){
		if(confirm('本当に削除しますか?削除しても、相手には通知されません。')){
			$.post('<?php echo $this->webroot; ?>comments/delete/'+$(this).data('comment-id'),{},function(res){
				$('#comment_'+res.id).fadeOut();
        console.log(res.id);
			},"json");
		}
		return false;
	});
});
</script>

