<?php
header("Content-Type: text/html; charset=Shift_JIS");

 //debug($comment); 
foreach($comment as $list): ?>
	<div class="col-sm-10" id="comment_<?php echo h($list['Comment']['id']); ?>">
	<li><?php echo $list['Comment']['modified']; ?><br><?php echo $this->HTML->link($list['Comment']['commenter'],array('controller'=>'teachers','action' =>'view',$list['Comment']['teacher_id'])) ?> :</li>
	<?php echo h($list['Comment']['body']); ?>
	</div>
<?php endforeach;?>
<div id="add_com"></div>
</ul>

<?php echo $this->Form->create('Comment', array('action' => 'response')); ?>
<div class="row">
<div class="col-sm-12">メッセージを送信 </div> 
<?php 
echo $this->Form->input('body', array('rows' => '3','label' => 'メッセージ'));
echo $this->Form->end('送信');
?>
</div>


<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
$(function(){
	//alert($('#delete-pass').val);

	$('#comment_post').click(function(){
	  $.post('prokate_teacherscomment_inf.php',{
	    userid: $('#id').val(),
	    pass: $('#pass').val(),
	    contents: $('comment_val').val(),
	    nickname: $('nickname').val()
	  }, function(data){
	
	    if(data.contents==null || data.nickname == null || data.password == null){
	        alert("空の値があります！");
	        setTimeout("location.reload()",2000);
	         
	    }else{
	         alert(data.contents+','+data.datetime+','+data.nickname+','+data.password);
	    }
	  });
	});
});
</script>