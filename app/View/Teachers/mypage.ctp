<div class="container">
  <div class="profile">
    <div class="rows">
      <div class="profile_img col-md-3"><!-- プロフィール画像のセクション -->
        <!-- 自分のプロフィール画像（なければ初期設定でこちらから用意） -->
      </div>
      <div class="profile_text col-md-9"><!-- プロフィールのテキスト-->
        <h2><?php echo h($teacher['Teacher']['username']); ?></h2>
        <?php
        echo $teacher['Teacher']['job'];
        echo $teacher['Teacher']['gender'];
        echo $teacher['Teacher']['old'];
        ?>
        <?php echo $teacher['Teacher']['language']; ?>
        <?php echo $this->Html->link('プロフィール編集', array('controller' => 'teachers', 'action' => 'edit', $teacher['Teacher']['id'])); ?>
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
