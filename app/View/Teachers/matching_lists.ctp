<?php  $profile = $teacher['Teacher']; ?>

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
      </div>