<h1><?php echo h($teacher['Teacher']['username']); ?></h1>
<p><?php echo h($teacher['Teacher']['job']); ?></p>
<?php
$session_id = 5;
if(!empty($session_id)){
	echo $this->Form->create('Teachermatching',array('action'=>'add'));

echo $this->Form->input('Teachermatching.teacher_id',array('type'=>'hidden','value'=>$teacher['Teacher']['id']));
echo $this->Form->input('Teachermatching.name',array('type'=>'hidden','value'=>$teacher['Teacher']['username']));
echo $this->Form->input('Teachermatching.user_id',array('type'=>'hidden','value'=>$session_id));

echo $this->Form->end('講師リクエスト');
}
?>
      <?php //foreach ($teacher['Teachermatching'] as $student): ?>
          <li><?php //echo h($student['name']) ?></li>
          <li><?php //echo h($student['job']) ?> </li>
          
        <?php //endforeach 

        $session_id = 10; //上と合わせると、講師のidが9という条件の選択 （この２つの値をSessionComponentsで調整）
  $session_name = "kazuki";

  echo $this->Form->create('Comment',array('action'=>'add_to_teacherview'));
  
//コメントする人が講師か生徒かによって、場合分け（講師と生徒のidは同じものがあるので、どちらのtableかを決定するため）
      echo $this->Form->input('body',array('rows'=>3));
      echo $this->Form->input('commenter',array('type'=>'hidden','value'=>$session_name)); //コメントした自分の名前
      echo $this->Form->input('Comment.user_id',array('type'=>'hidden','value'=>$session_id)); //コメントした自分のid 
       echo $this->Form->input('Comment.teacher_id',array('type'=>'hidden','value'=>$teacher['Teacher']['id'])); //コメントした相手のid
   echo $this->Form->end('コメント');
  ?>
      </div>
    <!-- 自分へのコメントに関する情報 -->
      <div class="mycomments">
        <!-- コメント一覧 -->
        <?php //var_dump($teacher['Teachermatching']); ?><br>
        <?php foreach ($teacher['Comment'] as $comment): ?>
          <tr>
          <td><?php echo h($comment['id']) ?></td>
           <td><?php echo $comment['created']; ?></td>
            <td><?php echo $this->Html->link($comment['commenter'], array('controller' => 'users', 'action' => 'view', $comment['user_id'])); ?></td>
          <td><?php echo $comment['body']; ?></td>
        
          <td>
          	<?php
          	if($comment['user_id'] == $session_id){
          		echo $this->Html->link('削除','#', array('class'=>'delete', 'data-comment-id'=>$comment['id'],'data-comment-user_id'=>$comment['user_id'])); 
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

