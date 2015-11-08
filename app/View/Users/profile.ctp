<div class="container">
  <div class="profile">
    <div class="rows">
      <div class="profile_img col-md-3"><!-- プロフィール画像のセクション -->
        <!-- 自分のプロフィール画像（なければ初期設定でこちらから用意） -->
      </div>
      <div class="profile_text col-md-9"><!-- プロフィールのテキスト-->
      <?php  //debug($user['User']['username']);
      if(empty($user['User'])){
        echo "読み込みエラー！通信エラーかもしくは、ユーザーが存在しない可能性があります。";
        exit();
      }else{
        $profile = $user['User']; 
        } ?>
        <h2><?php echo h($profile['username']); ?></h2>
        <?php
        echo $profile['job']."\n";
        echo $profile['gender']."\n";
        echo $profile['old']."\n";
        ?><br>
        <?php echo $profile['language']; ?><br>
        <?php echo $this->Html->link('プロフィール編集', array('controller' => 'users', 'action' => 'edit', $profile['id'])); ?>
        <br>
        <?php echo $this->Html->link('トップ画編集', array('controller' => 'users', 'action' => 'upload', $profile['id'])); ?>
      </div>
    </div>
  </div>
  <div class="rows">
    <div><!-- 自分に関する生徒情報 -->
      <div class="mystudents">
        <!-- 自分の生徒一覧表示 -->
        <?php //var_dump($user['Teachermatching']); ?><br>
        <?php foreach ($user['Teachermatching'] as $teacher): ?>
          <tr>
          <td><?php echo h($teacher['id']) ?></td>
          <td><?php echo $this->Html->link('生徒：'.$teacher['name'], array('controller' => 'users', 'action' => 'view', $teacher['user_id'])); ?></td>
          </tr><br>
        <?php endforeach ?>
      </div>
      <div class="newusers">
        <!-- 新着生徒情報 -->
      </div>
    </div>
     <div class="rows">
      <div class="addcomment">
        <!-- コメント追加欄 -->
  <?php
  $session_id = 8; //上と合わせると、講師のidが9という条件の選択 （この２つの値をSessionComponentsで調整）
  $session_name = "kazuki";

  echo $this->Form->create('Comment',array('action'=>'add_to_user'));
  
//コメントする人が講師か生徒かによって、場合分け（講師と生徒のidは同じものがあるので、どちらのtableかを決定するため）
   //    echo $this->Form->input('body',array('rows'=>3));
   //    echo $this->Form->input('commenter',array('type'=>'hidden','value'=>$session_name)); //コメントした人
   //    echo $this->Form->input('Comment.user_id',array('type'=>'hidden','value'=>$session_id)); //今ログインしている人がコメントするため。
   // echo $this->Form->end('コメント');
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
          <td><?php echo $comment['commenter']; ?></td>
          <td><?php echo $comment['body']; ?></td>
          <td><?php echo $this->Html->link($comment['commenter'], array('controller' => 'teachers', 'action' => 'view', $comment['teacher_id'])); ?></td>
          </tr><br>
        <?php endforeach ?>
      </div>
      </div>
    </div>
    <div><!-- サイドバー -->
    </div>
  </div>
</div>

<!-- <ul>
<?php foreach($user['Comment'] as $comment): ?>
	<li><?php echo h($comment['body']) ?> by <?php echo h($comment['commenter']); ?></li>
<?php endforeach; ?>
</ul> -->
