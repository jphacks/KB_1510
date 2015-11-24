<div class="container">
  <div class="profile">
    <div class="rows">
      <div class="profile_img">
        <!-- <?php #echo $this->Html->Image(); ?> 自分のプロフィール画像（なければ初期設定でこちらから用意） -->
      </div>
      <div class="profile_text">
        <h2><?php echo h($user['User']['username']); ?></h2>
        <?php $profile = $user['User'];
        echo $user['User']['job'] . "<br>";
        echo $user['User']['gender'] . "<br>";
        echo $user['User']['old'];
        ?>
        <ul>
          <li>
          <?php echo $user['User']['programin_lang']; ?><!-- 一つ一つの言語が分割してタブ形式で表示される -->
          <?php echo $this->Html->link('プロフィール詳細', array('controller' => 'users', 'action' => 'profile', $user['User']['id'])); ?><br>
        <?php echo $this->Html->link('プロフィール編集', array('controller' => 'users', 'action' => 'edit', $user['User']['id'])); ?>

      </div>
    </div>
  </div>
  <div class="rows">
    <div><!-- 自分に関する講師情報 -->
      <div class="myteachers">
      <h2><?php echo $profile['username'] ?>さんの講師一覧</h2>
        <?php //var_dump($user['Teachermatching']); ?><br>
        <?php foreach ($user['Teachermatching'] as $myteacher): ?>
          <tr>
          <td><?php //echo h($student['id']) ?></td>
          <td><?php echo $this->Html->link($myteacher['teacher_name'], array('controller' => 'teachers', 'action' => 'view', $myteacher['teacher_id'])); ?></td>
          </tr><br>
        <?php endforeach ?>
      </div>
      <div class="newteachers">
        <!-- 新着講師情報 -->
           <div class="newteachers">
          <!-- 新着講師情報 -->
          <h2>新着講師</h2>
          <?php  //var_dump($teacher); ?>
          <table><tr>
          <?php foreach ($teacher as $list): ?>
            <td><?php echo $this->Html->link($list['Teacher']['username'],array('controller' => 'teachers', 'action' => 'view', $list['Teacher']['id']))?></td>
          
          <?php endforeach; ?>
          </tr></table>
          <h3><?php echo $this->Html->link('もっと見る', array('controller' => 'teachers', 'action' => 'lists')); ?></h3>
      </div>
 
      </div>

    </div>
    <div><!-- サイドバー -->
    </div>
  </div>
</div>
