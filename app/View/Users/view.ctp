<h1><?php echo h($user['User']['username']); ?></h1>
<p><?php echo h($user['User']['job']); ?></p>
<?php

$session_id = $acountSession['Teacher']['id'];
$session_name = $acountSession['Teacher']['username'];
//var_dump($session_id);

if($acountSession == null){
   echo $this->Html->link('生徒リクエスト',array('controller'=>'users','action'=>'login'));
}else{
      echo $this->Form->create('Teachermatching',array('action'=>'add_mystudent'));

    echo $this->Form->input('Teachermatching.user_id',array('type'=>'hidden','value'=>$user['User']['id']));
    echo $this->Form->input('Teachermatching.user_name',array('type'=>'hidden','value'=>$user['User']['username']));
      echo $this->Form->input('Teachermatching.teacher_name',array('type'=>'hidden','value'=>$session_name));
    echo $this->Form->input('Teachermatching.teacher_id',array('type'=>'hidden','value'=>$session_id));
    echo"</br>";
    echo $this->Form->end('生徒リクエスト');
    echo"</div>";



  echo $this->Form->create('Comment',array('action'=>'add_to_userview'));
  
//コメントする人が講師か生徒かによって、場合分け（講師と生徒のidは同じものがあるので、どちらのtableかを決定するため）
      echo $this->Form->input('body',array('rows'=>3));
      echo $this->Form->input('commenter',array('type'=>'hidden','value'=>$session_name)); //コメントした自分の名前
      echo $this->Form->input('Comment.teacher_id',array('type'=>'hidden','value'=>$session_id)); //コメントした自分のid 
       echo $this->Form->input('Comment.user_id',array('type'=>'hidden','value'=>$user['User']['id'])); //コメントした相手のid
   echo $this->Form->end('コメント');
}
?>

      </div>
    <!-- 自分へのコメントに関する情報 -->
      <div class="mycomments">
        <!-- コメント一覧 -->
        <?php //var_dump($user['Teachermatching']); ?>
        <table>
        <?php foreach ($user['Comment'] as $comment): ?>
          <tr id="comment_<?php echo ($comment['id']); ?>">
          <td><?php echo h($comment['id']) ?></td>
           <td><?php echo $comment['created']; ?></td>
           <td><?php 
           if($session_id == $comment['teacher_id']){
            echo $this->Html->link($comment['commenter'], array('controller' => 'teachers', 'action' => 'profile', $comment['teacher_id']));
          }else{
                echo $this->Html->link($comment['commenter'], array('controller' => 'teachers', 'action' => 'view', $comment['teacher_id']));
             }
          ?>
          
          <td><?php echo $comment['commenter']; ?></td>
          <td><?php echo $comment['body']; ?></td>
           </td>
            <td>
          	<?php
       if($comment['teacher_id'] == $session_id){
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