<p><?php echo $this->Html->link($recture['Recture']['name'],array('controller'=>'teachers','action' => 'view', $recture['Recture']['teacher_id'])); ?></p>
<p><?php echo h($recture['Recture']['title']); ?></p>
  
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

