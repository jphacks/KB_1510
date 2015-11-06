<div class="container">
  <div class="profile">
    <div class="rows">
      <div class="profile_img">
        <!-- <?php #echo $this->Html->Image(); ?> 自分のプロフィール画像（なければ初期設定でこちらから用意） -->
      </div>
      <div class="profile_text">
        <h2><?php echo h($user['User']['username']); ?></h2>
        <?php
        echo $user['User']['job'] . "/";
        echo $user['User']['gender'] . "/";
        echo $user['User']['old'];
        ?>
        <ul>
          <li>
          <?php echo $user['User']['programin_lang']; ?><!-- 一つ一つの言語が分割してタブ形式で表示される -->
        <?php echo $this->Html->link('プロフィール編集', array('controller' => 'users', 'action' => 'edit', $user['User']['id'])); ?>
      </div>
    </div>
  </div>
  <div class="rows">
    <div><!-- 自分に関する講師情報 -->
      <div class="myteachers">
        <!-- 自分の講師一覧表示 -->
          <?php var_dump($user['Teachermatching']); ?><br>
        <?php foreach ($user['Teachermatching'] as $teacher): ?>
          <tr>
          <td><?php echo h($teacher['user_id']) ?></td>
          <td><?php echo $this->Html->link($teacher['name'], array('controller' => 'users', 'action' => 'view', $teacher['user_id'])); ?></td>
          </tr><br>
        <?php endforeach ?>
      </div>
      <div class="newteachers">
        <!-- 新着講師情報 -->
      </div>
    </div>
    <div><!-- サイドバー -->
    </div>
  </div>
</div>
