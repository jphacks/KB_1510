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
        <?php echo $this->Html->link('トップ画編集', array('controller' => 'teachers', 'action' => 'upload', $profile['id'])); ?>
      </div>
    </div>
  </div>
  <div class="rows">
    <div><!-- 自分に関する生徒情報 -->
      <div class="myteachers">
        <!-- 自分の生徒一覧表示 -->
      </div>
      <div class="newteachers">
        <!-- 新着生徒情報 -->
      </div>
    </div>
    <div><!-- サイドバー -->
    </div>
  </div>
</div>

<!-- <ul>
<?php foreach($teacher['Comment'] as $comment): ?>
	<li><?php echo h($comment['body']) ?> by <?php echo h($comment['commenter']); ?></li>
<?php endforeach; ?>
</ul> -->
