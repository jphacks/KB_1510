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
        <?php echo h($profile['id']); ?>
        <h2><?php echo h($profile['username']); ?></h2>
        <?php
        echo "職業：".$profile['job']."<br>";
        echo "性別：".$profile['gender']."<br>";
        echo "年齢：".$profile['old']."<br>";
        echo "写真：".$profile['photo_number']+1;
        ?><br>
        <?php echo $profile['language']; ?><br>
        <?php echo $this->Html->link('プロフィール編集', array('controller' => 'teachers', 'action' => 'edit', $profile['id'])); ?>
        <br>
        <?php echo $this->Html->link('トップ画編集', array('controller' => 'teachers', 'action' => 'uploads', $profile['id'])); ?>
      </div>
    </div>
  </div>
  <div class="rows">
    <div><!-- 自分に関する生徒情報 -->
    <?php echo $this->Html->link('プロフィール詳細', array('action' => 'profile',$teacher['Teacher']['id'])); ?>
    </div>
    <div><?php echo $this->Html->link('周辺情報', array('controller' => 'teachers', 'action' => 'location_map')); ?>
    </div>
      <div class="myteachers">
        <!-- 自分の生徒一覧表示 -->
        <h2><?php echo $profile['username'] ?>さんの生徒一覧</h2>
        <?php //var_dump($teacher['Teachermatching']); ?><br>
        <?php foreach ($teacher['Teachermatching'] as $student): ?>
          <tr>
          <td><?php echo h($student['id']) ?></td>
          <td><?php echo $this->Html->link('生徒：'.$student['name'], array('controller' => 'users', 'action' => 'view', $student['user_id'])); ?></td>
          </tr><br>
        <?php endforeach ?>
        <h3><?php echo $this->Html->link('もっと見る', array('controller' => 'teachers', 'action' => 'matching_lists', $profile['id'])); ?></h3>
      </div>
      <div class="newteachers">
        <!-- 新着生徒情報 -->
           <div class="newteachers">
          <!-- 新着生徒情報 -->
          <h2>新着生徒</h2>
          <?php foreach ($user as $list): ?>
            <td><?php echo $this->Html->link($list['User']['username'],array('controller' => 'users', 'action' => 'view', $list['User']['id']))?></td>
          
          <?php endforeach ?>
          <h3><?php echo $this->Html->link('もっと見る', array('controller' => 'users', 'action' => 'lists')); ?></h3>
      </div>
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
