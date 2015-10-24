<?php
header("Content-Type: text/html; charset=Shift_JIS");

 //debug($message); 
foreach($message as $list): ?>
	<div class="col-sm-10" id="message_<?php echo h($list['Message']['id']); ?>">
	<li><?php echo $this->HTML->link("名前:".$list['Message']['opponent_name']."内容:".$list['Message']['body'],array('controller'=>'messages','action' =>'whoview',$list['Message']['opponent_id'])) ?> :</li>
<!-- 	<?php echo h($list['Message']['body']); ?> -->
	</div>
<?php endforeach;?>
<div id="add_com"></div>
</ul>
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