<h1><?php echo h($teacher['Teacher']['username']); ?></h1>
<p><?php echo h($teacher['Teacher']['job']); ?></p>



<tr>
<td><?php
foreach ($teacher['Recture'] as $recture): ?></td>
<td><?php echo $this->Html->link($recture['title'], array('controller' => 'rectures', 'action' => 'view', $recture['id'])); ?> 
</td>
<?php endforeach; ?>
</tr>
<br>
<br>
<?php
echo $this->Html->link($teacher['Teacher']['username'].'さんの講座一覧',array('controller'=>'teachers','action'=>'rectures',$teacher['Teacher']['id']));?>
<br>
<br>
<div id="request" class="btn-primary" style="width: 120px; color: white;" >


<?php
// $session_id = 5;
if($acountSession == null){
   echo $this->Html->link('講師リクエスト',array('controller'=>'users','action'=>'login'));
}else{
    $session_id = $acountSession['id'];
    $session_name = $acountSession['username'];

    	echo $this->Form->create('Teachermatching',array('action'=>'add_myteacher'));

    echo $this->Form->input('Teachermatching.teacher_id',array('type'=>'hidden','value'=>$teacher['Teacher']['id']));
    echo $this->Form->input('Teachermatching.teacher_name',array('type'=>'hidden','value'=>$teacher['Teacher']['username']));
     echo $this->Form->input('Teachermatching.user_name',array('type'=>'hidden','value'=>$session_name));
    echo $this->Form->input('Teachermatching.user_id',array('type'=>'hidden','value'=>$session_id));
    echo"</br>";
    echo $this->Form->end('講師リクエスト');
    echo"</div>";

 $session_id = $acountSession['id'];
 $session_name = $acountSession['username'];

  echo $this->Form->create('Comment',array('action'=>'add_to_teacherview'));
  
//コメントする人が講師か生徒かによって、場合分け（講師と生徒のidは同じものがあるので、どちらのtableかを決定するため）
      echo $this->Form->input('body',array('rows'=>3));
      echo $this->Form->input('commenter',array('type'=>'hidden','value'=>$session_name)); //コメントした自分の名前
      echo $this->Form->input('Comment.user_id',array('type'=>'hidden','value'=>$session_id)); //コメントした自分のid 
       echo $this->Form->input('Comment.teacher_id',array('type'=>'hidden','value'=>$teacher['Teacher']['id'])); //コメントした相手のid
   echo $this->Form->end('コメント');
}
?>
         
          
        <?php //endforeach 

        // $session_id = 10; //上と合わせると、講師のidが9という条件の選択 （この２つの値をSessionComponentsで調整）
  // $session_name = "kazuki";


  ?>
      </div>
    <!-- 自分へのコメントに関する情報 -->
      <div class="mycomments">
        <!-- コメント一覧 -->
        <?php //var_dump($teacher['Teachermatching']); ?><br>
        <table>
        <?php foreach ($teacher['Comment'] as $comment): ?>
          <tr id="comment_<?php echo ($comment['id']); ?>">
          <td><?php echo h($comment['id']) ?></td>
           <td><?php echo $comment['created']; ?></td>
            <td><?php echo $this->Html->link($comment['commenter'], array('controller' => 'users', 'action' => 'view', $comment['user_id'])); ?></td>
          <td><?php echo $comment['body']; ?></td>
        
          <td id="comment_<?php echo h($comment['id']); ?>">
          	<?php
          	if($comment['user_id'] == $session_id){
          		echo $this->Html->link('削除','#', array('class'=>'delete', 'data-comment-id'=>$comment['id'])); 
          	}
          	?>
          </td>
          </tr><br>
        <?php endforeach ?>
        </table>
      </div>
      </div>
    </div>
    <div><!-- サイドバー -->
    </div>
  </div>
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

