<h1><?php echo h($user['User']['username']); ?></h1>
<p><?php echo h($user['User']['job']); ?></p>
<?php

$session_id = $acountSession;

if($acountSession == null){
   echo $this->Html->link('生徒リクエスト',array('controller'=>'users','action'=>'login'));
}else{
      echo $this->Form->create('Teachermatching',array('action'=>'add_student'));

    echo $this->Form->input('Teachermatching.user_id',array('type'=>'hidden','value'=>$user['User']['id']));
    echo $this->Form->input('Teachermatching.name',array('type'=>'hidden','value'=>$user['User']['username']));
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
        <?php //var_dump($user['Teachermatching']); ?><br>
        <?php foreach ($user['Comment'] as $comment): ?>
          <tr>
          <td><?php echo h($comment['id']) ?></td>
           <td><?php echo $comment['created']; ?></td>
           <td><?php echo $this->Html->link($comment['commenter'], array('controller' => 'teachers', 'action' => 'view', $comment['teacher_id'])); ?>
          <td><?php echo $comment['commenter']; ?></td>
          <td><?php echo $comment['body']; ?></td>
           </td>
            <td>
          	<?php
          	if($comment['teacher_id'] == $session_id){
          		echo $this->Html->link('削除',array('controller' => 'comments', 'action' => 'delete'));
          	}
          	?>
          </td>
          </tr><br>
        <?php endforeach ?>
      </div>
      </div>
    </div>
    <div><!-- サイドバー -->
    </div>
  </div>
</div>