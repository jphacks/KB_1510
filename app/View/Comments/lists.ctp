<?php
header("Content-Type: text/html; charset=Shift_JIS");

//echo $this->Form->create('Comment', array('action' => 'add')); ?>
<div class="row">
                
            <!--     <div class="col-sm-2">名前：</div>
                <div class="col-sm-10"> -->
                <!-- <textarea class="text" name="nickname"  id="nickname" cols="30" rows="1"></textarea> -->
                <?php //echo $this->Form->input('commenter',array('label' => '名前')); ?>
         <!--        </div>
                <br><br>
                <div class="col-sm-12">コンタクトを取るコメントを入力しよう！(300字以内) </div> 
                <div class="col-sm-2">書き込み：</div>
                <div class="col-sm-10"><textarea class="text" name="contents"   id="comment_val" cols="30" rows="3"></textarea></div>
                <div class="col-sm-2">削除パス：</div>
                <div class="col-sm-10" ><textarea class="text" name="pass"  id="pass" cols="10" rows="1"></textarea></div> -->
               
名前：<input type="text" id="myname" value=""><br>
内容：<textarea class="text" id="contents" cols="30" rows="3"></textarea><br>
削除パス：<input type="text" id="deletepass"><br>
	<input type="button" id="com_submit" value="送信"><br>
	<br>
	<br>


<?php
// echo $this->Form->input('password',array('label' => '削除パス'));?>
<!--  <div class="col-sm-12">コンタクトを取るコメントを入力しよう！(300字以内) </div>  -->
// <?php 
// echo $this->Form->input('body', array('rows' => '3','label' => 'コメント内容'));
// echo $this->Form->end('コメント');

?>
                    
           <!--      <input type="button" value="コメントする" id="comment_post" class="btn btn-primary pull-right" >
            </div> -->
<table>
<thead>
<th>名前</th>>
<th>コメント</th>
<th>時間</th>
<th>削除pass</th>
<th>削除</th>
</thead>
<tbody id="com_list"><?php //debug($comment); ?>

<?php 
foreach($comment as $list): ?>
	<tr id="comment_<?php echo h($list['Comment']['id']); ?>">
	<td><?php echo $list['Comment']['created']; ?></td><td><?php echo $this->HTML->link($list['Comment']['commenter'],array('controller'=>'teachers','action' =>'view',$list['Comment']['teacher_id'])) ?> :</td><td>
	<?php echo h($list['Comment']['body']); ?></td>
	<td><?php echo $this->HTML->link('編集','#',array('class'=>'btn btn-primary','action'=>'edit', $list['Comment']['id'])); ?>　　　　　　
	削除パス<textarea class="text" name="delete-pass"  id="delete-pass" cols="10" rows="1"></textarea></td><td>
	<?php echo $this->HTML->link('削除','#',array('class'=>'btn btn-primary','id'=>'delete', 'data-comment-id'=>$list['Comment']['id'],'data-comment-password'=>$list['Comment']['password'])); ?></td>
	</tr>
<?php endforeach;?>
<a id="add_com"></div>
</tbody>
</table>


<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
$(function(){
	//alert($('#delete-pass').val);

	$('#comment_post').click(function(){
	  $.post('prokate_teacherscomment_inf.php',{
	    userid: $('#id').val(),
	    dataType:'json',
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
		var a = 0;
		if(confirm('sure?'+$(this).data('comment-id')+'&'+$('#delete-pass').val())){
			$.post('/prokate_cake/comments/delete/'+$(this).data('comment-id')+'&'+$(this).data('comment-password')+'&'+$(this).data('comment-delitepass'),{
				datapass:$('#delete-pass').val()
			},function(res){ //deletepass: $('#delete-pass')↑｛｝内
					alert(res);
					$('#comment_'+res.id).fadeOut();
		}, "json");
			}
			return false;
	});


	$('#com_submit').click(function(e){
		  $.post('/prokate_cake/jsons/',{
		    name : $("#myname").val(),
		    deletepass: $('#deletepass').val(),
		    content : $("#contents").val()
		}, function(data){
			console.log(data);
			alert(data);
			newdata = data[data.length-1];
			newtext = "<textarea class='text' name='delete-pass'  id='delete-pass' cols='10' rows='1'></textarea>";
		        var box = "<tr><td>"+newdata['time']+"</td><td>"+newdata['name']+"</td><td>"+newdata['content']+"</td><td>+"+newtext+"</td><td>"+"button"+"</td></tr>";
		     $("#com_list").append(box);
		  });
});


});
</script>