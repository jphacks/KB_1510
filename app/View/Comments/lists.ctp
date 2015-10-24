<?php
echo $this->Form->create('Comment', array('action' => 'add')); ?>
<div class="row">
                
            <!--     <div class="col-sm-2">名前：</div>
                <div class="col-sm-10"> -->
                <!-- <textarea class="text" name="nickname"  id="nickname" cols="30" rows="1"></textarea> -->
                <?php echo $this->Form->input('commenter',array('label' => '名前')); ?>
         <!--        </div>
                <br><br>
                <div class="col-sm-12">コンタクトを取るコメントを入力しよう！(300字以内) </div> 
                <div class="col-sm-2">書き込み：</div>
                <div class="col-sm-10"><textarea class="text" name="contents"   id="comment_val" cols="30" rows="3"></textarea></div>
                <div class="col-sm-2">削除パス：</div>
                <div class="col-sm-10" ><textarea class="text" name="pass"  id="pass" cols="10" rows="1"></textarea></div> -->

<?php
echo $this->Form->input('password',array('label' => '削除パス'));?>
<div class="col-sm-12">コンタクトを取るコメントを入力しよう！(300字以内) </div> 
<?php 
echo $this->Form->input('body', array('rows' => '3','label' => 'コメント内容'));
echo $this->Form->end('コメント');
?>
                    
           <!--      <input type="button" value="コメントする" id="comment_post" class="btn btn-primary pull-right" >
            </div> -->

<ul><?php //debug($comment); ?>

<?php 
foreach($comment as $list): ?>
	<div class="col-sm-10" id="comment_<?php echo h($list['Comment']['id']); ?>">
	<li><?php echo $list['Comment']['modified']; ?><br><?php echo $this->HTML->link($list['Comment']['commenter'],array('controller'=>'teachers','action' =>'view',$list['Comment']['teacher_id'])) ?> :</li>
	<?php echo h($list['Comment']['body']); ?>
	<?php echo $this->HTML->link('編集','#',array('class'=>'btn btn-primary','action'=>'edit', $list['Comment']['id'])); ?>　　　　　　
	<textarea class="text" name="delete-pass"  id="delete-pass" cols="10" rows="1">削除パス</textarea>
	<?php echo $this->HTML->link('削除','#',array('class'=>'btn btn-primary','id'=>'delete', 'data-comment-id'=>$list['Comment']['id'])); ?>
	</div>
<?php endforeach;?>
<div id="add_com"></div>
</ul>


<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
$(function(){
	$('#comment_post').click(function(){
	  $.post('prokate_teacherscomment_inf.php',{
	    userid: $('#id').val(),
	    pass: $('#pass').val(),
	    contents: $('comment_val').val(),
	    nickname: $('nickname').val()
	  }, function(data){
	    // $('#comdesc_top').append("<tr class='comdesc_top'>
	    //                         <td id='com_id'></td>
	    //                         <td id='com_datetime'></td>
	    //                         <td id='com_user'name></td>
	    //                         <td id='comment_val'>}</td>
	    //                         </tr>");
	    // $('#com_id').html(data.userid);
	    // $('#com_user').html(data.nickname);
	    // $('#comment_val').html(data.contents);
	    // $('#com_datetime').html(data.datetime);
	    //alert($('#id').val()+','+$('#pass').val()+','+$('#comment_val').val()+','+$('#nickname').val());
	    if(data.contents==null || data.nickname == null || data.password == null){
	        alert("空の値があります！");
	        setTimeout("location.reload()",2000);
	         
	    }else{
	         alert(data.contents+','+data.datetime+','+data.nickname+','+data.password);
	    }
	  });
	});
	
	$('a#delete').click(function(e){
		if(confirm('sure?'+$(this).data('comment-id'))){
			$.post('/prokate_cake/comments/delete/'+$(this).data('comment-id'),{
			deletepass: $('#delete-pass').val()},function(res){ //deletepass: $('#delete-pass')↑｛｝内
					alert(res);
					$('#comment_'+res.id).fadeOut();
		}, "json");
			}
			return false;
	});
});
</script>