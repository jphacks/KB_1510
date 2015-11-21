<div class="container">
  <div class="profile">
    <div class="rows">
      <div class="profile_img col-md-3"><!-- プロフィール画像のセクション -->
        <!-- 自分のプロフィール画像（なければ初期設定でこちらから用意） -->
      </div>
      <div class="profile_text col-md-9"><!-- プロフィールのテキスト-->
      <?php  //debug($teacher['Teacher']['username']);
      if(empty($teacher['Teacher'])){
        echo "読み込みエラー！通信エラーかもしくは、ユーザーが存在しない可能性があります。";
        exit();
      }else{
        $profile = $teacher['Teacher']; 
        } ?>
        <h2><?php echo h($profile['username']); ?></h2>
        <?php
        echo $profile['job']."\n";
        echo $profile['gender']."\n";
        echo $profile['old']."\n";
        ?><br>
        <?php echo $profile['language']; ?><br>
        <?php echo $this->Html->link('プロフィール編集', array('controller' => 'teachers', 'action' => 'edit', $profile['id'])); ?>
        <br>
        <?php echo $this->Html->link('トップ画編集', array('controller' => 'teachers', 'action' => 'uploads', $profile['id'])); ?><br>
         <?php echo $this->Html->link('開設講座リスト', array('controller' => 'teachers', 'action' => 'rectures')); ?>
      </div>
    </div>
  </div>
  <div class="rows">
    <div><!-- 自分に関する生徒情報 -->
      <div class="mystudents">
        <!-- 自分の生徒一覧表示 -->
        <h2>マッチングリスト</h2>
        <?php //var_dump($teacher['Teachermatching']); ?><br>
        <?php foreach ($teacher['Teachermatching'] as $student): ?>
          <tr>
          <td><?php echo h($student['id']) ?></td>
          <td><?php 
          echo $this->Html->link('生徒：'.$student['name'], array('controller' => 'users', 'action' => 'view', $student['user_id'])); ?></td>
          </tr><br>
        <?php endforeach ?>
      </div>

    </div>
     <div class="rows">
      <div class="addcomment">
        <!-- コメント追加欄 -->

  <?php
  $session_id = 8; //上と合わせると、講師のidが9という条件の選択 （この２つの値をSessionComponentsで調整）
  $session_name = "kazuki";
  $session_state = 0;

//   echo $this->Form->create('Comment',array('action'=>'add_to_teacher'));
  
// //コメントする人が講師か生徒かによって、場合分け（講師と生徒のidは同じものがあるので、どちらのtableかを決定するため）
//       echo $this->Form->input('body',array('rows'=>3));
//       echo $this->Form->input('commenter',array('type'=>'hidden','value'=>$session_name)); //コメントした人
//       echo $this->Form->input('Comment.teacher_id',array('type'=>'hidden','value'=>$session_id)); //今ログインしている人がコメントするため。
//    echo $this->Form->end('コメント');
  ?>
      </div>
    <!-- 自分へのコメントに関する情報 -->
      <div class="mycomments">
        <!-- コメント一覧 -->
         <h2><?php echo $profile['username']?>さんへのコメント</h2>
        <?php //var_dump($teacher['Teachermatching']); ?>
        <br>
        <?php foreach ($teacher['Comment'] as $comment): ?>
          <tr>
          <td><?php //echo h($comment['id']) ?></td>
           <td><?php echo $comment['created']; ?></td>
          <td><?php 
          // if($comment['user_id'] == $teacher['Teacher']['id'] && $session_state = 0){
            echo $this->Html->link($comment['commenter'], array('controller' => 'users', 'action' => 'view', $comment['user_id']));
          // }else{
          //   echo $comment['commenter'];
          //   echo $session_state;
          //   echo $comment['user_id'];
          // }
          ?></td>
          <td><?php echo $comment['body']; ?></td>
          
           <td><?php
          echo $this->Html->link('削除',array('controller' => 'teachers', 'action' => 'delete'));
          ?></td>
          </tr><br>
        <?php endforeach ?>
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


<!-- <ul>
<?php foreach($teacher['Comment'] as $comment): ?>
	<li><?php echo h($comment['body']) ?> by <?php echo h($comment['commenter']); ?></li>
<?php endforeach; ?>
</ul> -->
